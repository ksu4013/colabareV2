package cot.colabare.meetingboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cot.colabare.meetingboard.domain.MeetingBoardReplyDto;
import cot.colabare.meetingboard.domain.MeettingBoardCriteria;

public interface MeetingBoardReplyMapper {

	// 댓글 페이징
	public List<MeetingBoardReplyDto> mbReplyList (@Param("cri") MeettingBoardCriteria cri, @Param("board_no") Long board_no);
	
	// 댓글 디테일
	public MeetingBoardReplyDto detailMBReply (Long board_no);	// read
	
	// 해당 글의 댓글 갯수
	public int countMBReply(Long board_no);
	
	// 댓글 삽입
	public int insertMBReply(MeetingBoardReplyDto mbReply); 
	
	// 댓글 삭제
	public int deleteMBReply(Long reply_no);
	
	// 댓글 수정
	public int updateMBReply(MeetingBoardReplyDto mbReply);
}
