package cot.colabare.profile.mapper;

import cot.colabare.master.domain.UserDto;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ModifyRequestDto;
import cot.colabare.profile.domain.ProfileDto;

public interface ProfileMapper {
	ProfileDto selectProfile(int employee_no);
	int insertProfile(int employee_no);
	int updatePass(UserDto user);
	int updateGreeting(ProfileDto profile);
	int insertModify(ModifyRequestDto modifyr);
}
