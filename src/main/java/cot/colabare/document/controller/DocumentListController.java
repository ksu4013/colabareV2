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
	
	private ApprovalService service;
	
	// 내가보낸 결재문서 목록
	
	
	// 문서 목록 페이지 이동
	@GetMapping("/documentList")
	public void documentList(){
		log.info("문서 목록으로 이동 ");
		System.out.println("문서목록으로 이동");
		
	}
	@GetMapping("example1")
	public void example1(){
		
	}
	
	@GetMapping("approvalList")
	public void approvalList(){
		
	}
	
	@GetMapping("document1")
	public void documentexam(){
		
	}
	@GetMapping("document2")
	public void documentexam2(){
		
	} 
	@GetMapping("document3")
	public void documentexam3(){
		
	} 
	@GetMapping("document4")
	public void documentexam4(){
		
	} 
	@GetMapping("document5")
	public void documentexam5(){
		
	} 
	@GetMapping("document6")
	public void documentexam6(){
		
	} 
	@GetMapping("document7")
	public void documentexam7(){
		
	} 
	@GetMapping("document8")
	public void documentexam8(){
		
	} 
	@GetMapping("document9")
	public void documentexam9(){
		
	} 
	@GetMapping("document10")
	public void documentexam10(){
		
	} 
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
