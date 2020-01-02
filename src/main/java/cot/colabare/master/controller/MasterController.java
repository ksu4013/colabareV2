package cot.colabare.master.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.ScriptStyle;
import jxl.format.UnderlineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/master/*", method = RequestMethod.POST)
public class MasterController {
	private MasterService service;
	private LoginService l_service;
	private ProfileService p_service;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@GetMapping("/insertmemform")
	public void insertmemform(HttpServletRequest request) {
		log.info("insertmemform....");
		List<DepartmentDto> departments = service.departmentList();
		List<PositionDto> positions = service.positionList();

		request.setAttribute("departments", departments);
		request.setAttribute("positions", positions);

	}

	@GetMapping("/insertmember")
	public ResponseEntity<String> insertmember(HttpServletRequest request) {
		log.info("insertmember....");
		EmployeeDto employee = new EmployeeDto();
		UserDto user = new UserDto();
		UserAuthDto userauth = new UserAuthDto();

		user.setUserid(request.getParameter("userid"));
		user.setUserpw(pwencoder.encode(request.getParameter("userpw")));
		user.setEmployee_no(Integer.parseInt(request.getParameter("employee_no")));

		userauth.setUserid(request.getParameter("userid"));
		System.out.println(request.getParameter("master"));
		if (request.getParameter("master").equals("y")) {
			userauth.setAuth("ROLE_ADMIN");
		} else {
			userauth.setAuth("ROLE_MEMBER");
		}
		System.out.println(userauth.getAuth());
		employee.setEmployee_no(Integer.parseInt(request.getParameter("employee_no")));
		employee.setName(request.getParameter("name"));
		employee.setPosition_id(Integer.parseInt(request.getParameter("position_id")));
		employee.setMaster(request.getParameter("master"));
		employee.setE_mail(request.getParameter("e_mail"));
		employee.setDepartment_id(request.getParameter("department_id"));

		SecurityAuthDto secauth = new SecurityAuthDto();
		secauth.setEmployee_id(employee.getEmployee_no());
		if (employee.getMaster().equals("y")) {
			secauth.setMeeting_cud("y");
			secauth.setNotice_cud("y");
			secauth.setProject_c("y");
			secauth.setReference_cud("y");
		} else {
			secauth.setMeeting_cud("n");
			secauth.setNotice_cud("n");
			secauth.setProject_c("y");
			secauth.setReference_cud("n");
		}
		int success = service.insertMemberService(employee);
		int successauth = service.insertMemberAuthService(secauth);
		int successuser = service.insertUserService(user);
		int successuserauth = service.insertUserAuthService(userauth);
		int successprofile = p_service.insertProfileService(employee.getEmployee_no());
		if (success > 0 && successauth > 0 && successuser > 0 && successuserauth > 0 && successprofile > 0) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("/listmember")
	public void listmember(HttpServletRequest request) {
		List<DepartmentDto> departments = service.departmentList();
		request.setAttribute("departments", departments);

		System.out.println(request.getParameter("pageNum"));
		Criteria cri = new Criteria(1, 10);
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
		request.setAttribute("employeelist", service.employeeList(cri));
		int count = service.totalCount(cri);
		System.out.println(service.employeeList(cri) + "   " + count);
		request.setAttribute("pageMaker", new PageDto(cri, count));
		System.out.println(new PageDto(cri, count));
		request.setAttribute("department_id", request.getParameter("department_info"));

	}

	/*
	 * @GetMapping(value="/listmem/{page}",
	 * produces={MediaType.APPLICATION_XML_VALUE,MediaType.
	 * APPLICATION_JSON_UTF8_VALUE}) public ResponseEntity<EmployeePageDto>
	 * getMemlist (@PathVariable("page") int page){ Criteria cri=new
	 * Criteria(page,10);
	 * 
	 * //EmployeePageDto employeepage=service.employeeList(cri);
	 * 
	 * return new ResponseEntity<EmployeePageDto>(employeepage,HttpStatus.OK);
	 * 
	 * }
	 */

	@GetMapping(value = "/listreq")
	public ResponseEntity<List<ModifyRequestDto>> getReqlist() {

		List<ModifyRequestDto> requests = service.requestList();
		return new ResponseEntity<List<ModifyRequestDto>>(requests, HttpStatus.OK);
	}

	@GetMapping("/modifymemform")
	public void modifymemform(HttpServletRequest request) {
		log.info("modifymemform....");
		String num = request.getParameter("employee_no");
		int employee_no = Integer.parseInt(num);

		EmployeeDto employee = l_service.loginService(employee_no);
		List<DepartmentDto> departments = service.departmentList();
		List<PositionDto> positions = service.positionList();
		SecurityAuthDto security = service.selectSec(employee_no);

		request.setAttribute("employee", employee);
		request.setAttribute("departments", departments);
		request.setAttribute("positions", positions);
		request.setAttribute("security", security);
	}

	@GetMapping("/modifymember")
	public ResponseEntity<String> modifymember(HttpServletRequest request) {
		log.info("modifymember....");
		SecurityAuthDto sec = new SecurityAuthDto();
		EmployeeDto employee = new EmployeeDto();
		employee.setName(request.getParameter("name"));
		employee.setEmployee_no(Integer.parseInt(request.getParameter("employee_id")));
		employee.setDepartment_id(request.getParameter("department_id"));
		employee.setPosition_id(Integer.parseInt(request.getParameter("position_id")));
		employee.setMaster(request.getParameter("master"));

		UserAuthDto userauth = new UserAuthDto();
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
		int m_success = service.updateMember(employee);
		int s_success = service.updateSecAuth(sec);
		int a_success = service.updateUserAuth(userauth);

		if (m_success > 0 && s_success > 0 && a_success > 0) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("/deletemem")
	public String deleteMember(HttpServletRequest request) {
		int employee_no = Integer.parseInt(request.getParameter("employee_no"));

		int success = service.deleteMember(employee_no);
		return "redirect:/master/listmember";
	}

	@GetMapping("/deletereq")
	public ResponseEntity<String> deleteRequest(HttpServletRequest request) {
		int modify_no = Integer.parseInt(request.getParameter("modify_no"));
		int success = service.deleteRequest(modify_no);
		if (success > 0) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/excel")
	public ResponseEntity<String> getExcelFile() {

		String uploadFolder = "c:\\upload\\excel";
		// make folder
		File uploadPath = new File(uploadFolder);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		UUID uuid = UUID.randomUUID();
		try {
			WritableWorkbook excelfile = Workbook
					.createWorkbook(new File(uploadPath + "\\" + uuid.toString() + "EmployeeList.xls"));
			WritableSheet sheet1 = excelfile.createSheet("Employee", 0);
			WritableCellFormat titleFormat = new WritableCellFormat(
					new WritableFont(
					WritableFont.ARIAL,
					11,
					WritableFont.BOLD,
					false,
					UnderlineStyle.NO_UNDERLINE,
					Colour.BLACK,
					ScriptStyle.NORMAL_SCRIPT));
			titleFormat.setBackground(Colour.AQUA);
			titleFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
			titleFormat.setBorder(Border.BOTTOM, BorderLineStyle.THICK);
			WritableCellFormat contentFormat = new WritableCellFormat();
			contentFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
			
			List<EmplDepPosDto> list=service.allEmployeeListService();
			
			sheet1.setColumnView(0, 20);
			sheet1.setColumnView(1, 15);
			sheet1.setColumnView(2, 15);
			sheet1.setColumnView(3, 15);
			sheet1.setColumnView(4, 30);
			sheet1.setColumnView(5, 15);
			
			for(int i=0;i<list.size();i++){
				Label content = new Label(0,i+1, String.valueOf(list.get(i).getEmployee_no()), contentFormat);
				sheet1.addCell(content);
			}
			for(int i=0;i<list.size();i++){
				Label content = new Label(1,i+1, list.get(i).getName(), contentFormat);
				sheet1.addCell(content);
			}
			for(int i=0;i<list.size();i++){
				Label content = new Label(2,i+1, list.get(i).getDepartment_name(), contentFormat);
				sheet1.addCell(content);
			}
			for(int i=0;i<list.size();i++){
				Label content = new Label(3,i+1, list.get(i).getPosition_name(), contentFormat);
				sheet1.addCell(content);
			}
			for(int i=0;i<list.size();i++){
				Label content = new Label(4,i+1, list.get(i).getE_mail(), contentFormat);
				sheet1.addCell(content);
			}
			for(int i=0;i<list.size();i++){
				Label content = new Label(5,i+1, list.get(i).getMaster(), contentFormat);
				sheet1.addCell(content);
			}

			sheet1.addCell(new Label(0, 0, "사원번호", titleFormat));
			sheet1.addCell(new Label(1, 0, "사원이름", titleFormat));
			sheet1.addCell(new Label(2, 0, "부서", titleFormat));
			sheet1.addCell(new Label(3, 0,"직급", titleFormat));
			sheet1.addCell(new Label(4, 0, "메일주소", titleFormat));
			sheet1.addCell(new Label(5, 0, "관리자여부", titleFormat));

			
			
			excelfile.write();
			excelfile.close();
			return new ResponseEntity<String>("success",HttpStatus.OK);
			
			
		} catch (Exception e) {
			e.printStackTrace();

			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
	}
}
