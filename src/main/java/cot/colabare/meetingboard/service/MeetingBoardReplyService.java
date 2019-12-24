package cot.colabare.meetingboard.service;

import java.util.List;

import cot.colabare.meetingboard.domain.MeetingBoardReplyDto;
import cot.colabare.meetingboard.domain.MeettingBoardCriteria;
import cot.colabare.meetingboard.domain.ReplyPageDTO;

public interface MeetingBoardReplyService {

	// 댓글 디테일
	public MeetingBoardReplyDto detailMBReply (Long reply_no);
	
	// 댓글 리스트
	public List<MeetingBoardReplyDto> mbReplyList(MeettingBoardCriteria cri, Long board_no);	
	
	// 댓글 페이징
	public ReplyPageDTO getListPage(MeettingBoardCriteria cri, Long board_no);
	
	// 댓글 삽입
	public int insertMBReply(MeetingBoardReplyDto mbReply);
	
	// 댓글 삭제
	public int deleteMBReply(Long reply_no);
	
	// 댓글 수정
	public int updateMBReply(MeetingBoardReplyDto mbReply);
}
