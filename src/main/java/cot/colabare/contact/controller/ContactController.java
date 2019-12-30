package cot.colabare.contact.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cot.colabare.contact.domain.ContactEmplDto;
import cot.colabare.contact.service.ContactService;
import cot.colabare.master.controller.MasterController;
import cot.colabare.master.domain.DepartmentDto;
import cot.colabare.master.domain.PageDto;
import cot.colabare.master.service.MasterService;
import cot.colabare.profile.domain.Criteria;
import cot.colabare.profile.domain.ProfileAttachDto;
import cot.colabare.profile.domain.ProfileDto;
import cot.colabare.profile.service.LoginService;
import cot.colabare.profile.service.ProfileService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/contact/*", method = RequestMethod.POST)
public class ContactController {
	private ProfileService p_service;
	private MasterService m_service;
	private ContactService service;

	@GetMapping("/contactlist")
	public void listmember(HttpServletRequest request) {
		List<DepartmentDto> departments = m_service.departmentList();
		request.setAttribute("departments", departments);

		System.out.println(request.getParameter("pageNum"));
		Criteria cri = new Criteria(1, 16);
		
		if (request.getParameter("pageNum") != null) {
			cri.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		}
		
		if (request.getParameter("department_info") != null && request.getParameter("department_info") != "") {
			cri.setType(request.getParameter("department_info"));
		}
		
		if (request.getParameter("keyword") != null) {
			cri.setKeyword(request.getParameter("keyword"));
		} else {
			cri.setKeyword("");
		}
		
		System.out.println(cri.getPageNum() + " " + cri.getKeyword());
		
		int count = m_service.totalCount(cri);
		request.setAttribute("pageMaker", new PageDto(cri, count));
		System.out.println(new PageDto(cri, count));
		request.setAttribute("department_id", request.getParameter("department_info"));
		
		
		List<ContactEmplDto> employeelist = service.contactListService(cri);
		for (ContactEmplDto profile : employeelist) {
			if (profile.getEmployee_img() != null) {
				ProfileAttachDto profilepic = p_service.selectProfilePicService(profile.getEmployee_img());
				String fileCallPath = profilepic.getP_uploadPath() + "/s_" + profilepic.getP_uuid() + "_"
						+ profilepic.getP_fileName();
				profile.setProfile_pic(fileCallPath);
			} 
		}
		request.setAttribute("employeelist", employeelist);

	}
	
	
	@PostMapping(value="/modal", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ContactEmplDto> modalInfo(HttpServletRequest request){
		int employee_no=Integer.parseInt(request.getParameter("employee_no"));
		System.out.println(employee_no);
		
		ContactEmplDto profile=service.contactService(employee_no);
		if (profile.getEmployee_img() != null) {
			ProfileAttachDto profilepic = p_service.selectProfilePicService(profile.getEmployee_img());
			String fileCallPath = profilepic.getP_uploadPath() + "/s_" + profilepic.getP_uuid() + "_"
					+ profilepic.getP_fileName();
			profile.setProfile_pic(fileCallPath);
		}
		if(profile.getEmployee_greeting()==null) {
			profile.setEmployee_greeting("안녕하세요! "+profile.getName()+"입니다.");
		}
		System.out.println(profile);
		if(profile!=null){
			return new ResponseEntity<ContactEmplDto>(profile,HttpStatus.OK);
		}else{
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}

}
