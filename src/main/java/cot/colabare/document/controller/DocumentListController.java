package cot.colabare.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/document/*")
@Controller
@Log4j
@AllArgsConstructor
public class DocumentListController {
	
	// 서비스 주입하기
	
	// 문서 목록 페이지 이동
	@GetMapping("/documentList")
	public void documentList(){
		log.info("문서 목록으로 이동 ");
		System.out.println("문서목록으로 이동");
		
	}
	
	@GetMapping("example1")
	public void documentexam(){
		
	}
	

}
