package cot.colabare.meetingboard.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cot.colabare.meetingboard.domain.MeetingBoardReplyDto;
import cot.colabare.meetingboard.domain.MeettingBoardCriteria;
import cot.colabare.meetingboard.domain.ReplyPageDTO;
import cot.colabare.meetingboard.service.MeetingBoardReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/mbreplies/")
@RestController
@Log4j
@AllArgsConstructor
public class MeetingBoardReplyController {
	
	private MeetingBoardReplyService service;
	
	
	// 댓글 한 개 디테일
	@GetMapping(value="/{reply_no}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MeetingBoardReplyDto> detailMBReply(@PathVariable("reply_no") Long reply_no){
		
		log.info("get: " + reply_no);
		
		return new ResponseEntity<>(service.detailMBReply(reply_no), HttpStatus.OK);
	}
	
	// 댓글 리스트
	@GetMapping(value = "/pages/{board_no}/{page}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getListPage(@PathVariable("page") int page, @PathVariable("board_no") Long board_no) {
		
		MeettingBoardCriteria cri = new MeettingBoardCriteria(page, 10);
		
		log.info("get Reply List board_no: " + board_no);

		log.info("cri:" + cri);
		
		return new ResponseEntity<>(service.getListPage(cri, board_no), HttpStatus.OK);
	}
	
	// 댓글 삽입
	@PostMapping(value="/newMBReply", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> insertMBReply(@RequestBody MeetingBoardReplyDto mbReply){
		
		log.info("ReplyVO: " + mbReply);
		
		int insertCount = service.insertMBReply(mbReply);
		
		log.info("Reply INSERT COUNT: " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	

}
