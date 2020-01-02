package cot.colabare.profile.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;
=======
>>>>>>> colabareV2/Ang

import cot.colabare.approval.domain.ApproverDto;
import cot.colabare.approval.service.ApprovalService;
import cot.colabare.master.domain.EmplDepPosDto;
import cot.colabare.master.domain.SecurityAuthDto;
import cot.colabare.master.service.MasterService;
import cot.colabare.meetingboard.domain.MeettingBoardCriteria;
import cot.colabare.meetingboard.service.MeetingBoardService;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ProfileAttachDto;
import cot.colabare.profile.domain.ProfileDto;
import cot.colabare.profile.service.LoginService;
import cot.colabare.profile.service.ProfileService;
import cot.colabare.todolist.service.TodoService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/login/*", method = RequestMethod.POST)
@AllArgsConstructor
public class LoginController {
	private LoginService service;
	private MasterService m_service;
	private ProfileService p_service;
<<<<<<< HEAD
	private TodoService todoservice;

=======
	private ApprovalService apservice;
	private TodoService todoservice;
	private MeetingBoardService mbservice;
	
	
	
>>>>>>> colabareV2/Ang
	@GetMapping("/chklogin")
	public String chkLogin(HttpServletRequest request) {
		log.info("/chklogin");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) authentication.getPrincipal();
		String username = user.getUsername();

		int employee_no = service.employee_noService(username);
		EmployeeDto employee = service.loginService(employee_no);
		HttpSession session = request.getSession();

		ProfileDto profile = p_service.profileDetailService(employee_no);
		if (profile.getEmployee_img() != null) {
			ProfileAttachDto profilepic = p_service.selectProfilePicService(profile.getEmployee_img());
			String fileCallPath = profilepic.getP_uploadPath() + "/s_" + profilepic.getP_uuid() + "_"
					+ profilepic.getP_fileName();
			session.setAttribute("profilepic", fileCallPath);
		} else {
			session.setAttribute("profilepic", null);
		}

		session.setAttribute("employee", employee);
		EmplDepPosDto meminfo = service.memberInfoService(employee_no);
		SecurityAuthDto security = m_service.selectSec(employee_no);
		session.setAttribute("meminfo", meminfo);
		session.setAttribute("secauth", security);
		return "redirect:/login/main";

	}

	@GetMapping("/main")
<<<<<<< HEAD
	public void goMain(HttpServletRequest request) {

		HttpSession session = request.getSession();
		EmployeeDto employee = (EmployeeDto) session.getAttribute("employee");
		int employee_no = employee.getEmployee_no();
=======
	public void goMain(HttpServletRequest request,Model model, MeettingBoardCriteria cri){

>>>>>>> colabareV2/Ang

		ProfileDto profile = p_service.profileDetailService(employee_no);
		System.out.println(profile.getEmployee_img());
		request.setAttribute("profilepic", null);
		if (profile == null) {
			p_service.insertProfileService(employee_no);
			profile = p_service.profileDetailService(employee_no);
		}
		if (profile.getEmployee_greeting() == null) {
			profile.setEmployee_greeting("안녕하세요! " + employee.getName() + "입니다.");
		}

		if (profile.getEmployee_img() != null) {
			ProfileAttachDto profilepic = p_service.selectProfilePicService(profile.getEmployee_img());
			String fileCallPath = profilepic.getP_uploadPath() + "/s_" + profilepic.getP_uuid() + "_"
					+ profilepic.getP_fileName();
			request.setAttribute("profilepic", fileCallPath);
		} else {
			request.setAttribute("profilepic", null);
		}
		request.setAttribute("profile", profile);
<<<<<<< HEAD

		log.info("/main.....");
=======
		

		//전자결재 리스트
		model.addAttribute("approval", apservice.receiveList(employee_no));
		System.out.println("메인페이이지");
		System.out.println(apservice.receiveList(employee_no));
		
		 //todo type 리스트
        model.addAttribute("typelist", todoservice.getTypeList());
        
        // 회의록 리스트
        model.addAttribute("list", mbservice.meetingBoardList(cri));
        
>>>>>>> colabareV2/Ang
	}

	@GetMapping("/logout")
	public void logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();

	}

	@GetMapping("todo/todostyle")
	public void todostyle() {

	}

	@GetMapping("todo/todolist")
	public void listTodo(@RequestParam(value = "todo_type_no") int todo_type_no, Model model) {
		log.info("todolist");
		model.addAttribute("todolist", todoservice.getTodoList(todo_type_no));
		model.addAttribute("todo_type_no", todo_type_no);
	}

}