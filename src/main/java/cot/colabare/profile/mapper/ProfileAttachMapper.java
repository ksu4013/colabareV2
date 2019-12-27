package cot.colabare.profile.mapper;

import java.util.List;

import cot.colabare.profile.domain.ProfileAttachDto;

public interface ProfileAttachMapper {

	public int insertProfilePic(ProfileAttachDto profile);

	public int deleteProfilePic(String p_uuid);

	public ProfileAttachDto selectProfilePic(String p_uuid);

	public int updateProfileInfo(ProfileAttachDto profile);

	/*public List<BoardAttachVO> getOldFiles();*/
}
