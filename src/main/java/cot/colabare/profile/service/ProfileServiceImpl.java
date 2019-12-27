package cot.colabare.profile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cot.colabare.meetingboard.mapper.MeetingBoardMapper;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ModifyRequestDto;
import cot.colabare.profile.domain.ProfileAttachDto;
import cot.colabare.profile.domain.ProfileDto;
import cot.colabare.profile.mapper.ProfileAttachMapper;
import cot.colabare.profile.mapper.ProfileMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ProfileServiceImpl implements ProfileService {
	@Setter(onMethod_ = @Autowired)
	private ProfileMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ProfileAttachMapper pa_mapper;
	
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

	@Override
	public int insertProfilePicService(ProfileAttachDto profile) {
		log.info("insertprofilepicservice.......");
		return pa_mapper.insertProfilePic(profile);
	}

	@Override
	public int updateProfilePicInfoService(ProfileAttachDto profile) {
		log.info("updateprofilepicinfoservice.......");
		return pa_mapper.updateProfileInfo(profile);
	}

	@Override
	public ProfileAttachDto selectProfilePicService(String p_uuid) {
		log.info("selectprofilepicservice.......");
		return pa_mapper.selectProfilePic(p_uuid);
	}

}
