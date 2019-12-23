package cot.colabare.profile.service;

import org.springframework.stereotype.Service;

import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ModifyRequestDto;
import cot.colabare.profile.domain.ProfileDto;
import cot.colabare.profile.mapper.ProfileMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ProfileServiceImpl implements ProfileService {
	private ProfileMapper mapper;
	
	@Override
	public ProfileDto profileDetailService(int employee_no) {
		log.info("profiledetailservice.......");
		return mapper.selectProfile(employee_no);
	}

	@Override
	public int modifyPassService(EmployeeDto employee) {
		log.info("modifypassservice.......");
		return mapper.updatePass(employee);
	}

	@Override
	public int modifyGreetingService(ProfileDto profile) {
		log.info("modifygreetingservice.......");
		return mapper.updateGreeting(profile);
	}

	@Override
	public int sendModifyReqService(ModifyRequestDto modifyreq) {
		log.info("sendmodifyreqservice.......");
		return mapper.insertModify(modifyreq);
	}

}
