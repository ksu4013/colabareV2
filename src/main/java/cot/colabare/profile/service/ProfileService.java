package cot.colabare.profile.service;

import org.springframework.stereotype.Service;

import cot.colabare.master.domain.UserDto;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ModifyRequestDto;
import cot.colabare.profile.domain.ProfileAttachDto;
import cot.colabare.profile.domain.ProfileDto;

@Service
public interface ProfileService {
	ProfileDto profileDetailService(int employee_no);
	int modifyPassService(UserDto user);
	int modifyGreetingService(ProfileDto profile);
	int sendModifyReqService(ModifyRequestDto modifyreq);
	int insertProfilePicService(ProfileAttachDto profile);

	int insertProfileService(int employee_no);
	
	int updateProfilePicInfoService(ProfileAttachDto profile);
	ProfileAttachDto selectProfilePicService(String p_uuid);

}
