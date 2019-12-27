package cot.colabare.meetingboard.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cot.colabare.meetingboard.domain.MeetingBoardAttachDto;
import cot.colabare.meetingboard.domain.MeetingBoardDto;
import cot.colabare.meetingboard.domain.MeettingBoardCriteria;
import cot.colabare.meetingboard.domain.PageDTO;
import cot.colabare.meetingboard.service.MeetingBoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/meetingboard/*")
@AllArgsConstructor
public class MeetingBoardController {

	private MeetingBoardService service;
	
	// 글 목록. 페이징
	@GetMapping("/meetingBoardList")
	public void meetingBoardList(MeettingBoardCriteria cri, Model model){
		
		log.info("MBController list : " + cri);
		
		model.addAttribute("list", service.meetingBoardList(cri));
		
		int total = service.getTotalCount(cri);
		
		log.info("MBController getTotalCount : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	// 글 상세보기
	@GetMapping({"/detailMeetingBoard", "/modifyMeetingBoard"})
	public void detailMeetingBoard(@RequestParam("board_no") Long board_no, @ModelAttribute("cri") MeettingBoardCriteria cri, Model model ){
		
		log.info("MBController detailMeetingBoard or modify : ");
		
		model.addAttribute("meetingBoard", service.detailMeetingBoard(board_no));
	}
	
	// 글 쓰기 페이지로 이동
	@GetMapping("/insertMeetingBoard")
	public void insertMeetingBoard(){
		
	}
	
	// 글 insert
	@PostMapping("/insertMeetingBoard")
	public String insertMeetingBoard(MeetingBoardDto meetingboard, RedirectAttributes rttr){
		
		log.info("==========================");

		log.info("register: " + meetingboard);
		
		if (meetingboard.getAttachList() != null) {

			meetingboard.getAttachList().forEach(attach -> log.info(attach));

		}
		
		service.insertMeetingBoard(meetingboard);
		
		rttr.addFlashAttribute("result", meetingboard.getBoard_no());
		
		return "redirect:/meetingboard/meetingBoardList";
	}
	
	// 글 삭제
	@GetMapping("/deleteMeetingBoard")
	public String deleteMeetingBoard(@RequestParam("board_no") Long board_no, MeettingBoardCriteria cri, RedirectAttributes rttr){
		
		log.info("remove..." + board_no);
		
		List<MeetingBoardAttachDto> attachList = service.attachListMeetingBoard(board_no);
		
		if(service.deleteMeetingBoard(board_no)){
			
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
			
		}
		
		return "redirect:/meetingboard/meetingBoardList" + cri.getListLink();
	}
	
	// 파일 삭제 처리
		private void deleteFiles(List<MeetingBoardAttachDto> attachList) {
		    
		    if(attachList == null || attachList.size() == 0) {
		      return;
		    }
		    
		    log.info("delete attach files...................");
		    log.info(attachList);
		    
		    attachList.forEach(attach -> {
		    	
		      try {        
		    	  
		        Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
		        
		        Files.deleteIfExists(file);
		        
		        if(Files.probeContentType(file).startsWith("image")) {
		        
		          Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
		          
		          Files.delete(thumbNail);
		        }
		
		      }catch(Exception e) {
		        log.error("delete file error" + e.getMessage());
		      }//end catch
		    });//end foreachd
		  }
	
	
	@GetMapping(value = "/attachListMeetingBoard", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<MeetingBoardAttachDto>> attachListMeetingBoard(Long board_no) {

		log.info("getAttachList " + board_no);

		return new ResponseEntity<>(service.attachListMeetingBoard(board_no), HttpStatus.OK);

	}
	
	@PostMapping("/modifyMeetingBoard")
	public String modifyMeetingBoard(MeetingBoardDto meetingboard, @ModelAttribute("cri") MeettingBoardCriteria cri, RedirectAttributes rttr){
		
		if(service.updateMeetingBoard(meetingboard)){
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/meetingboard/meetingBoardList";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
