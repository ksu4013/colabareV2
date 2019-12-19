package cot.colabare.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cot.colabare.master.domain.EmplDepPosDto;
import cot.colabare.master.domain.SecurityAuthDto;
import cot.colabare.master.service.MasterService;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.service.LoginService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/login/*", method = RequestMethod.POST)
@AllArgsConstructor
public class LoginController {
	private LoginService service;
	private MasterService m_service;
	
	@GetMapping("/loginform")
	public void loginForm(){
		log.info("/loginform");
	}
	
	@GetMapping("/chklogin")
	public ResponseEntity<String> chkLogin(@RequestParam("employee_no") int employee_no, @RequestParam("password") String password, HttpServletRequest request){
		log.info("/chklogin");
		
		EmployeeDto employee=service.loginService(employee_no);
		HttpSession session=request.getSession();
		System.out.println(employee_no +" + " +password);
		if(employee!=null){
			if(password.equals(employee.getPassword())){
				session.setAttribute("employee", employee);
				EmplDepPosDto meminfo=service.memberInfoService(employee_no);
				SecurityAuthDto security=m_service.selectSec(employee_no);
				session.setAttribute("meminfo", meminfo);
				session.setAttribute("secauth", security);
				return new ResponseEntity<String>("success",HttpStatus.OK);
			}
			else{
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		}
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		
	}
	
	@GetMapping("/main")
	public void goMain(){
		log.info("/main.....");
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.invalidate();
		
		return "redirect:/login/loginform.do";
	}
}