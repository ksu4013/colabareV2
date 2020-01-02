package cot.colabare.master.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cot.colabare.master.domain.DepartmentDto;
import cot.colabare.master.domain.EmplDepPosDto;
import cot.colabare.master.domain.EmployeePageDto;
import cot.colabare.master.domain.PositionDto;
import cot.colabare.master.domain.SecurityAuthDto;
import cot.colabare.master.domain.UserAuthDto;
import cot.colabare.master.domain.UserDto;
import cot.colabare.profile.domain.Criteria;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ModifyRequestDto;

public interface MasterMapper {
	List<DepartmentDto> listDepartment();
	List<PositionDto> listPosition();
	int insertMember(EmployeeDto employee);
	List<EmplDepPosDto> listEmployee(Criteria cri);
	int deleteMember(int employee_no);
	List<ModifyRequestDto> listRequest();
	int deleteReq(int request_no);
	SecurityAuthDto selectSec(int employee_no);
	
	int insertUser(UserDto user);
	int insertUserAuth(UserAuthDto userauth);
	int insertSec(SecurityAuthDto secauth);
	int insertMasterSec(int employee_no);
	
	int updateSec(SecurityAuthDto secauth);
	int updateMember(EmployeeDto employee);
	
	String selectUserId(int employee_no);
	public int getCountEmployee(Criteria cri);
	
	UserAuthDto getAdminAuth(String userid);
	int updateUserAuth(UserAuthDto userauth);
	int deleteUserAuth(String userid);
	
	List<EmplDepPosDto> getEmployee();
	
}
