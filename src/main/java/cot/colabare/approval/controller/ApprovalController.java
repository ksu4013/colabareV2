package cot.colabare.approval.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cot.colabare.approval.domain.AEmployeeDto;
import cot.colabare.approval.service.ApprovalService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/approval/")
@RestController
@Log4j
@AllArgsConstructor
public class ApprovalController { 
	
	// 서비스 입력
	private ApprovalService service;
	
	@PostMapping(value="/search" , produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<AEmployeeDto>> approvalM(String query){
		
		System.out.println("approval Controller!");
		List<AEmployeeDto> list = service.approvalM(query);
		System.out.println("리스트야 " + list);
		
		return new ResponseEntity<List<AEmployeeDto>>(service.approvalM(query),  HttpStatus.OK);
	}
	

}
