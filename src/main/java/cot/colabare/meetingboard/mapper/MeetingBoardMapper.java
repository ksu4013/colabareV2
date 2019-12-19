package cot.colabare.meetingboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cot.colabare.meetingboard.domain.MeettingBoardCriteria;
import cot.colabare.meetingboard.domain.MeetingBoardDto;
import cot.colabare.meetingboard.domain.MeetingBoardReplyDto;

public interface MeetingBoardMapper {

    // 삽입
    public Integer insertMeetingBoard(MeetingBoardDto meetingboard);
    
    // 목록 리스트
    List<MeetingBoardDto> meetingBoardList ();
    
    // 페이징 
    List<MeetingBoardDto> meetingBoardListPaging (MeettingBoardCriteria cri);
    
    // 글 목록 카운트
    public int getTotalCount(MeettingBoardCriteria cri);
      
    // 상세보기
    public MeetingBoardDto detailMeetingBoard(Long board_no);
    
    // 수정하기
    public int updateMeetingBoard(MeetingBoardDto meetingboard);
    
    // 삭제하기
    public int deleteMeetingBoard(Long board_no);
    
    // 해당 글의 댓글 갯수
    public void updateReplyCnt(@Param("board_no") Long board_no, @Param("amount") int amount);
    
    // 글 조회수 증가
    public Long updateReadCountMeetingBoard (Long board_no);
    
    
    
    
    
    // ************************ 댓글 *********************************
    
    // 댓글 리스트
    /*List<MeetingBoardReplyDto> listMeetingBoardReply (int board_no);
    
    // 댓글 삽입
    int insertMeetingBoardReply(MeetingBoardReplyDto meetingboardreply);
    
    // 댓글 삭제
    int deleteMeetingBoardReply(int reply_no);
    
    // 댓글 수정
    int updateMeetingBoardReply(MeetingBoardReplyDto meetingboardreply);
    
    // 댓글 상세
    MeetingBoardReplyDto detailMeetingBoardReply (int reply_no);*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}