package cot.colabare.master.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cot.colabare.master.domain.DepartmentDto;
import cot.colabare.master.domain.EmplDepPosDto;
import cot.colabare.master.domain.EmployeePageDto;
import cot.colabare.master.domain.PositionDto;
import cot.colabare.master.domain.SecurityAuthDto;
import cot.colabare.profile.domain.Criteria;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ModifyRequestDto;

@Service
public interface MasterService {
	
	public List<PositionDto> positionList();
	public List<DepartmentDto> departmentList();
	public SecurityAuthDto selectSec(int employee_no);
	public int updateMember(EmployeeDto employee);
	public int updateSecAuth(SecurityAuthDto secauth);
	
	public int deleteMember(int employee_no);
	public int deleteRequest(int employee_no);
	
	public int insertMemberService(EmployeeDto employee);
	public int insertMemberAuthService(SecurityAuthDto secauth);
	
	public List<ModifyRequestDto> requestList();
	public EmployeePageDto employeeList(Criteria cri);
	

}
