package cot.colabare.profile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cot.colabare.approval.domain.ApproverDto;
import cot.colabare.approval.service.ApprovalService;
import cot.colabare.master.domain.EmplDepPosDto;
import cot.colabare.master.domain.SecurityAuthDto;
import cot.colabare.master.service.MasterService;
import cot.colabare.meetingboard.domain.MeettingBoardCriteria;
import cot.colabare.meetingboard.domain.PageDTO;
import cot.colabare.meetingboard.service.MeetingBoardService;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ProfileAttachDto;
import cot.colabare.profile.domain.ProfileDto;
import cot.colabare.profile.service.LoginService;
import cot.colabare.profile.service.ProfileService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/login/*", method = RequestMethod.POST)
@AllArgsConstructor
public class LoginController {
	private LoginService service;
	private MasterService m_service;
	private ProfileService p_service;
	private ApprovalService apservice;
	
	
	
	@GetMapping("/chklogin")
	public String chkLogin( HttpServletRequest request){
		log.info("/chklogin");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User user = (User) authentication.getPrincipal(); 
		String username=user.getUsername();
		
		int employee_no=service.employee_noService(username);
		EmployeeDto employee=service.loginService(employee_no);
		HttpSession session=request.getSession();
		
		ProfileDto profile=p_service.profileDetailService(employee_no);
		if(profile.getEmployee_img()!=null){
			ProfileAttachDto profilepic=p_service.selectProfilePicService(profile.getEmployee_img());
			String fileCallPath =  profilepic.getP_uploadPath()+ "/s_"+profilepic.getP_uuid() +"_"+profilepic.getP_fileName();
			session.setAttribute("profilepic", fileCallPath);
		}else{
			session.setAttribute("profilepic", null);
		}
		
		
				session.setAttribute("employee", employee);
				EmplDepPosDto meminfo=service.memberInfoService(employee_no);
				SecurityAuthDto security=m_service.selectSec(employee_no);
				session.setAttribute("meminfo", meminfo);
				session.setAttribute("secauth", security);
				return "redirect:/login/main";
		
	}
	
	@GetMapping("/main")
	public void goMain(HttpServletRequest request,Model model){
		log.info("/main.....");
		//전자결재 리스트
		HttpSession session=request.getSession();
		Long employee_no = Integer.parseInt((String)session.getAttribute("employee_no"));
		
		
		
		List<ApproverDto> aplist = new ArrayList<ApproverDto>();
		aplist = apservice.receiveList(employee_no);
		model.addAttribute("approval", aplist);

		
		
	}
	
	@GetMapping("/logout")
	public void logout(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.invalidate();
		
	}
}