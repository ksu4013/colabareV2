package cot.colabare.profile.mapper;

import cot.colabare.master.domain.EmplDepPosDto;
import cot.colabare.profile.domain.EmployeeDto;

public interface LoginMapper {
	EmployeeDto selectEmployee(int employee_no);
	EmplDepPosDto selectEmployeeInfo(int employee_no);
	int selectEmployeeno(String name);
}
