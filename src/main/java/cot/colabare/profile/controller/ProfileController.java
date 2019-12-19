package cot.colabare.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ModifyRequestDto;
import cot.colabare.profile.domain.ProfileDto;
import cot.colabare.profile.service.ProfileService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/profile/*", method=RequestMethod.POST)
@AllArgsConstructor
public class ProfileController {
	private ProfileService service;
	
	@GetMapping("/profile")
	public void detailProfile(HttpServletRequest request){
		HttpSession session=request.getSession();
		EmployeeDto employee=(EmployeeDto)session.getAttribute("employee");
		int employee_no=employee.getEmployee_no();
		
		ProfileDto profile=service.profileDetailService(employee_no);
		if(profile.getEmployee_greeting()==null) {
			profile.setEmployee_greeting("안녕하세요! "+employee.getName()+"입니다.");
		}
		
		request.setAttribute("profile", profile);
	}
	
	@GetMapping("/profilemodifyform")
	public void profileModifyForm(HttpServletRequest request){
		HttpSession session=request.getSession();
		ProfileDto profile=(ProfileDto)request.getAttribute("profile");
		request.setAttribute("profile", profile);
	}
	@GetMapping("/modifypass")
	public ResponseEntity<String> modifyPassword(HttpServletRequest request){
		HttpSession session=request.getSession();
		EmployeeDto employee=(EmployeeDto)session.getAttribute("employee");
		String password=request.getParameter("password");
		employee.setPassword(password);
		
		int success=service.modifyPassService(employee);
		if(success>0){
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@GetMapping("/modifygreeting")
	public ResponseEntity<String> modifyGreeting(HttpServletRequest request){
		HttpSession session=request.getSession();
		EmployeeDto employee=(EmployeeDto)session.getAttribute("employee");
		ProfileDto profile=new ProfileDto();
		profile.setEmployee_no(employee.getEmployee_no());
		profile.setEmployee_greeting((String)request.getParameter("employee_greeting"));
		
		int success=service.modifyGreetingService(profile);
		if(success>0){
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@GetMapping("/modifyreq")
	public ResponseEntity<String> sendModifyRequest(HttpServletRequest request){
		HttpSession session=request.getSession();
		
		EmployeeDto employee=(EmployeeDto)session.getAttribute("employee");
		
		ModifyRequestDto modifyreq=new ModifyRequestDto();
		modifyreq.setEmployee_no(employee.getEmployee_no());
		modifyreq.setModify_info((String)request.getParameter("modify_info"));
		
		int success=service.sendModifyReqService(modifyreq);
		if(success>0){
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
