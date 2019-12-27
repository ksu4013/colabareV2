package cot.colabare.profile.service;

import org.springframework.stereotype.Service;

import cot.colabare.master.domain.EmplDepPosDto;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.mapper.LoginMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {

	
	private LoginMapper mapper;
	
	@Override
	public EmployeeDto loginService(int employee_no) {
		log.info("login.......");
		return mapper.selectEmployee(employee_no);	
	}

	@Override
	public EmplDepPosDto memberInfoService(int employee_no) {
		log.info("infoservice.......");
		return mapper.selectEmployeeInfo(employee_no);	
	}

	@Override
	public int employee_noService(String name) {
		log.info("infoservice.......");
		return mapper.selectEmployeeno(name);	
	}

}