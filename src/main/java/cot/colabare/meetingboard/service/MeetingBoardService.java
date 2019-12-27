package cot.colabare.meetingboard.service;

import java.util.List;

import cot.colabare.meetingboard.domain.MeetingBoardAttachDto;
import cot.colabare.meetingboard.domain.MeettingBoardCriteria;
import cot.colabare.meetingboard.domain.MeetingBoardDto;

public interface MeetingBoardService {
	
	public List<MeetingBoardDto> meetingBoardList (MeettingBoardCriteria cri);
	
	//public List<MeetingBoardDto> meetingBoardListPaging (Criteria cri);
	
	public int getTotalCount(MeettingBoardCriteria cri);
	
	public MeetingBoardDto detailMeetingBoard(Long board_no);
	
	public void insertMeetingBoard(MeetingBoardDto meetingboard);
	
	// 삭제
	public boolean deleteMeetingBoard(Long board_no);
	
	// 게시판 첨부파일 목록 불러오기
	public List<MeetingBoardAttachDto> attachListMeetingBoard(Long board_no);
	
	public boolean updateMeetingBoard(MeetingBoardDto meetingboard);

}
