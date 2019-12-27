package cot.colabare.profile.service;

import org.springframework.stereotype.Service;

import cot.colabare.master.domain.EmplDepPosDto;
import cot.colabare.profile.domain.EmployeeDto;

@Service
public interface LoginService {
	public EmployeeDto loginService(int employee_no);
	public EmplDepPosDto memberInfoService(int employee_no);
	public int employee_noService(String name);
}
