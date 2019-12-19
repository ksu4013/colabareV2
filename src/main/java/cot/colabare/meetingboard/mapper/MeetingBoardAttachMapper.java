package cot.colabare.meetingboard.mapper;

import java.util.List;

import cot.colabare.meetingboard.domain.MeetingBoardAttachDTO;

public interface MeetingBoardAttachMapper {

	public List<MeetingBoardAttachDTO> attachListMeetingBoard(Long board_no);
	
	public void insert(MeetingBoardAttachDTO attachdto);
	
	public void deleteAll(Long board_no);
	
	public void delete(String uuid);
}
