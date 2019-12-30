package cot.colabare.master.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.weaver.NewConstructorTypeMunger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cot.colabare.master.domain.EmployeePageDto;
import cot.colabare.master.domain.PageDto;
import cot.colabare.master.domain.DepartmentDto;
import cot.colabare.master.domain.EmplDepPosDto;
import cot.colabare.master.domain.PositionDto;
import cot.colabare.master.domain.SecurityAuthDto;
import cot.colabare.master.domain.UserAuthDto;
import cot.colabare.master.domain.UserDto;
import cot.colabare.master.service.MasterService;
import cot.colabare.profile.domain.Criteria;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ModifyRequestDto;
import cot.colabare.profile.service.LoginService;
import cot.colabare.profile.service.ProfileService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping(value="/master/*", method=RequestMethod.POST)
public class MasterController {
	private	MasterService service;
	private LoginService l_service;
	private ProfileService p_service;
	
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder pwencoder;
	
	@GetMapping("/insertmemform")
	public void insertmemform(HttpServletRequest request){
		log.info("insertmemform....");
		List<DepartmentDto> departments=service.departmentList();
		List<PositionDto> positions=service.positionList();
		
		request.setAttribute("departments", departments);
		request.setAttribute("positions", positions);
		
	}
	
	@GetMapping("/insertmember")
	public ResponseEntity<String> insertmember(HttpServletRequest request){
		log.info("insertmember....");
		EmployeeDto employee = new EmployeeDto();
		UserDto user=new UserDto();
		UserAuthDto userauth=new UserAuthDto();

		
		user.setUserid(request.getParameter("userid"));
		user.setUserpw(pwencoder.encode(request.getParameter("userpw")));
		user.setEmployee_no(Integer.parseInt(request.getParameter("employee_no")));
		
		userauth.setUserid(request.getParameter("userid"));
		if(request.getParameter("master").equals('y')){
			userauth.setAuth("ROLE_ADMIN");
		}else{
			userauth.setAuth("ROLE_MEMBER");
		}
		System.out.println(userauth.getAuth());
		employee.setEmployee_no(Integer.parseInt(request.getParameter("employee_no")));
		employee.setName(request.getParameter("name"));
		employee.setPosition_id(Integer.parseInt(request.getParameter("position_id")));
		employee.setMaster(request.getParameter("master"));
		employee.setE_mail(request.getParameter("e_mail"));
		employee.setDepartment_id(request.getParameter("department_id"));

		SecurityAuthDto secauth=new SecurityAuthDto();
		secauth.setEmployee_id(employee.getEmployee_no());
		if(employee.getMaster().equals("y")){
			secauth.setMeeting_cud("y");
			secauth.setNotice_cud("y");
			secauth.setProject_c("y");
			secauth.setReference_cud("y");
		}
		else{
			secauth.setMeeting_cud("n");
			secauth.setNotice_cud("n");
			secauth.setProject_c("y");
			secauth.setReference_cud("n");
		}
		int success=service.insertMemberService(employee);
		int successauth=service.insertMemberAuthService(secauth);
		int successuser=service.insertUserService(user);
		int successuserauth=service.insertUserAuthService(userauth);
		int successprofile=p_service.insertProfileService(employee.getEmployee_no());
		if (success>0&&successauth>0&&successuser>0&&successuserauth>0&&successprofile>0) {
			return new ResponseEntity<String>("success",HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/listmember")
	public void listmember(HttpServletRequest request){
		List<DepartmentDto> departments=service.departmentList();
		request.setAttribute("departments", departments);

		System.out.println(request.getParameter("pageNum"));
		Criteria cri=new Criteria(1,10);
		if(request.getParameter("pageNum")!=null){
			cri.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		}
		if(request.getParameter("department_info")!=null&&request.getParameter("department_info")!=""){
			cri.setType(request.getParameter("department_info"));
		}
		if(request.getParameter("keyword")!=null){
			cri.setKeyword(request.getParameter("keyword"));
		}else{
			cri.setKeyword("");
		}
		System.out.println(cri.getPageNum()+" "+cri.getKeyword());
		request.setAttribute("employeelist",service.employeeList(cri));
		int count=service.totalCount(cri);
		System.out.println(service.employeeList(cri)+"   "+count);
		request.setAttribute("pageMaker",new PageDto(cri, count));
		System.out.println(new PageDto(cri,count));
		request.setAttribute("department_id", request.getParameter("department_info"));
		
	}
	
	/*@GetMapping(value="/listmem/{page}", produces={MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<EmployeePageDto> getMemlist (@PathVariable("page") int page){
		Criteria cri=new Criteria(page,10);

		//EmployeePageDto employeepage=service.employeeList(cri);
		
		return new ResponseEntity<EmployeePageDto>(employeepage,HttpStatus.OK);
		
	}*/
	
	@GetMapping(value="/listreq")
	public ResponseEntity<List<ModifyRequestDto>> getReqlist(){
		
		List<ModifyRequestDto> requests=service.requestList();
		return new ResponseEntity<List<ModifyRequestDto>>(requests,HttpStatus.OK);
	}
	
	@GetMapping("/modifymemform")
	public void modifymemform(HttpServletRequest request){
		log.info("modifymemform....");
		String num=request.getParameter("employee_no");
		int employee_no=Integer.parseInt(num);

		EmployeeDto employee=l_service.loginService(employee_no);
		List<DepartmentDto> departments=service.departmentList();
		List<PositionDto> positions=service.positionList();
		SecurityAuthDto security=service.selectSec(employee_no);		
		
		request.setAttribute("employee", employee);
		request.setAttribute("departments", departments);
		request.setAttribute("positions", positions);
		request.setAttribute("security", security);
	}

	@GetMapping("/modifymember")
	public ResponseEntity<String> modifymember(HttpServletRequest request){
		log.info("modifymember....");
		SecurityAuthDto sec = new SecurityAuthDto();
		EmployeeDto employee = new EmployeeDto();
		employee.setName(request.getParameter("name"));
		employee.setEmployee_no(Integer.parseInt(request.getParameter("employee_id")));
		employee.setDepartment_id(request.getParameter("department_id"));
		employee.setPosition_id(Integer.parseInt(request.getParameter("position_id")));
		employee.setMaster(request.getParameter("master"));
		
		UserAuthDto userauth =new UserAuthDto();
		userauth.setUserid(service.selectUserId(employee.getEmployee_no()));
		System.out.println(service.selectUserId(employee.getEmployee_no()));
		userauth.setAuth(request.getParameter("master"));

		sec.setEmployee_id(Integer.parseInt(request.getParameter("employee_id")));
		if (userauth.getAuth().equals("y")) {
			sec.setMeeting_cud("y");
			sec.setNotice_cud("y");
			sec.setProject_c("y");
			sec.setReference_cud("y");
		} else {
			sec.setMeeting_cud("n");
			sec.setNotice_cud("n");
			sec.setProject_c("n");
			sec.setReference_cud("n");
			String[] list = request.getParameterValues("seclist");
			if (list != null) {
				for (String obj : list) {
					if (obj.equals("meeting")) {
						sec.setMeeting_cud("y");
					}
					if (obj.equals("notice")) {
						sec.setNotice_cud("y");
					}
					if (obj.equals("project")) {
						sec.setProject_c("y");
					}
					if (obj.equals("reference")) {
						sec.setReference_cud("y");
					}
				}
			}
		}
		int m_success=service.updateMember(employee);
		int s_success=service.updateSecAuth(sec);
		int a_success=service.updateUserAuth(userauth);
		
		if(m_success>0&&s_success>0&&a_success>0){
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/deletemem")
	public ResponseEntity<String> deleteMember(HttpServletRequest request){
		int employee_no=Integer.parseInt(request.getParameter("employee_no"));
		
		int success=service.deleteMember(employee_no);
		if(success>0){
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	@GetMapping("/deletereq")
	public ResponseEntity<String> deleteRequest(HttpServletRequest request){
		int modify_no=Integer.parseInt(request.getParameter("modify_no"));
		int success=service.deleteRequest(modify_no);
		if(success>0){
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
}
