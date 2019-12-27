package cot.colabare.meetingboard.mapper;

import java.util.List;

import cot.colabare.meetingboard.domain.MeetingBoardAttachDto;

public interface MeetingBoardAttachMapper {

	public List<MeetingBoardAttachDto> attachListMeetingBoard(Long board_no);
	
	public void insert(MeetingBoardAttachDto attachdto);
	
	public void deleteAll(Long board_no);
	
	public void delete(String uuid);
}
