package cot.colabare.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cot.colabare.approval.domain.ApprovalDto;
import cot.colabare.approval.service.ApprovalService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/document/*")
@Controller
@Log4j
@AllArgsConstructor
public class DocumentListController {
	
	// 서비스 주입하기
	private ApprovalService service;
	
	// 문서 목록 페이지 이동
	@GetMapping("/documentList")
	public void documentList(){
		log.info("문서 목록으로 이동 ");
		System.out.println("문서목록으로 이동");
		
	}
	
	@GetMapping("document1")
	public void documentexam(){
		
	} 
	
	@GetMapping("/autoAjax")
	public void autoAjax(){
		
	}
	
	// 전자결재 문서 내 삽입
	@PostMapping("/insertApproval")
	public String insertApproval(ApprovalDto approvaldto, RedirectAttributes rttr){
		
		System.out.println("==========================");
		System.out.println("Approval register: " + approvaldto);
		System.out.println("넘버!!!!!! : " + approvaldto.getApproval_no());
		service.insertApproval(approvaldto);
		
		System.out.println("넘버!!!!!!@@@@ : " + approvaldto.getApproval_no()); 
		
		System.out.println("오나욤");
		
		rttr.addFlashAttribute("result", approvaldto.getApproval_no());
		
		return "redirect:/document/documentList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
