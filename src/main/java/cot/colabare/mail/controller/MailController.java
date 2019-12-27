package cot.colabare.mail.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import cot.colabare.mail.service.MailService;
import cot.colabare.profile.domain.EmployeeDto;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping(value="/mail/*", method=RequestMethod.POST)
public class MailController {
	private MailService service;
	
	@GetMapping("/maillist")
	public void mailList(){
		log.info("mailcheck.....");
	}
	
	@GetMapping("/mailform")
	public void mailInsertForm(){
		log.info("mailform.....");
	}
	
	@GetMapping(value="/sendmail", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> sendMail(MultipartFile[] uploadFile,HttpServletRequest request){
		log.info("sendmail.....");
		
		HttpSession session=request.getSession();
		EmployeeDto employee = (EmployeeDto)session.getAttribute("employee");
		String from=employee.getE_mail();
		String name =employee.getName();
		String to = request.getParameter("to");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		try {
			service.sendMailService(from, to, name, subject, content, uploadFile);
			return new ResponseEntity<>("success",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
		}
		
	}

}
