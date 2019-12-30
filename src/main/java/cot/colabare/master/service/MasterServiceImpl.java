package cot.colabare.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cot.colabare.master.domain.DepartmentDto;
import cot.colabare.master.domain.EmplDepPosDto;
import cot.colabare.master.domain.EmployeePageDto;
import cot.colabare.master.domain.PositionDto;
import cot.colabare.master.domain.SecurityAuthDto;
import cot.colabare.master.domain.UserAuthDto;
import cot.colabare.master.domain.UserDto;
import cot.colabare.master.mapper.MasterMapper;
import cot.colabare.profile.domain.Criteria;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ModifyRequestDto;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MasterServiceImpl implements MasterService {
	
	@Setter(onMethod_=@Autowired)
	private MasterMapper mapper;
	
	@Override
	public int insertMemberService(EmployeeDto employee) {
		log.info("insertmemberservice.....");
		return mapper.insertMember(employee);
	}

	@Override
	public int insertMemberAuthService(SecurityAuthDto secauth) {
		log.info("insertmemberauthservice.....");
		return mapper.insertSec(secauth);
	}

	@Override
	public List<PositionDto> positionList() {
		log.info("insertmemberauthservice.....");
		return mapper.listPosition();
	}

	@Override
	public List<DepartmentDto> departmentList() {
		log.info("insertmemberauthservice.....");
		return mapper.listDepartment();
	}

	@Override
	public List<EmplDepPosDto> employeeList(Criteria cri) {
		log.info("employeelist......");
		return mapper.listEmployee(cri);
	}
	
	@Override
	public int totalCount(Criteria cri) {
		log.info("totalCount......");
		return mapper.getCountEmployee(cri);
	}

	@Override
	public List<ModifyRequestDto> requestList() {
		log.info("requestlist......");
		return mapper.listRequest();
	}

	@Override
	public SecurityAuthDto selectSec(int employee_no) {
		log.info("selectsequrityauth.......");
		return mapper.selectSec(employee_no);
	}

	@Override
	public int updateMember(EmployeeDto employee) {
		log.info("updatemember.......");
		return mapper.updateMember(employee);
	}

	@Override
	public int updateSecAuth(SecurityAuthDto secauth) {
		log.info("updatesequrityauth.......");
		return mapper.updateSec(secauth);
	}

	@Override
	public int deleteMember(int employee_no) {
		log.info("deletemember.......");
		return mapper.deleteMember(employee_no);
	}

	@Override
	public int deleteRequest(int modify_no) {
		log.info("deleterequest.......");
		return mapper.deleteReq(modify_no);
	}

	@Override
	public int insertUserService(UserDto user) {
		log.info("insertUserService.......");
		return mapper.insertUser(user);
	}

	@Override
	public int insertUserAuthService(UserAuthDto userauth) {
		log.info("insertUserAuthService.......");
		if(userauth.getAuth().equals("ROLE_ADMIN")){
			mapper.insertUserAuth(new UserAuthDto(userauth.getUserid(),"ROLE_MEMBER"));
		}
		return mapper.insertUserAuth(userauth);
	}

	@Override
	public String selectUserId(int employee_no) {
		log.info("selectUserId.......");
		return mapper.selectUserId(employee_no);
	}

	@Override
	public int updateUserAuth(UserAuthDto userauth) {
		log.info("updateUserAuth.......");
		
		UserAuthDto isadmin=mapper.getAdminAuth(userauth.getUserid());
		if(userauth.getAuth().equals("y")){
			userauth.setAuth("ROLE_ADMIN");
			if(isadmin==null){
				return mapper.updateUserAuth(userauth);
			}else{
				return 1;
			}
		}else{
			if(isadmin==null){
				return 1;
			}else{
				return mapper.deleteUserAuth(userauth.getUserid());
			}
		}
	}

	

}
