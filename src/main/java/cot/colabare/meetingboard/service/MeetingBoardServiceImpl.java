package cot.colabare.meetingboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cot.colabare.meetingboard.domain.MeetingBoardAttachDTO;
import cot.colabare.meetingboard.domain.MeettingBoardCriteria;
import cot.colabare.meetingboard.domain.MeetingBoardDto;
import cot.colabare.meetingboard.mapper.MeetingBoardAttachMapper;
import cot.colabare.meetingboard.mapper.MeetingBoardMapper;
import javafx.collections.ArrayChangeListener;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MeetingBoardServiceImpl implements MeetingBoardService {

	@Setter(onMethod_ = @Autowired)
	private MeetingBoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private MeetingBoardAttachMapper attachMapper;


	@Override
	public List<MeetingBoardDto> meetingBoardList(MeettingBoardCriteria cri) {
		
		log.info("★meetingboardServiceImpl meetingBoardListPaging(). criteria : ★" + cri);
		
		return mapper.meetingBoardListPaging(cri);
	}


	@Override
	public int getTotalCount(MeettingBoardCriteria cri) {
		
		log.info("MBServiceImpl getTotalCount " );
		
		return mapper.getTotalCount(cri);
	}


	@Override
	public MeetingBoardDto detailMeetingBoard(Long board_no) {

		log.info("MBServiceImpl detailMeetingBoard " );
		mapper.updateReadCountMeetingBoard(board_no);
		
		return mapper.detailMeetingBoard(board_no);
	}


	
	@Override
	public void insertMeetingBoard(MeetingBoardDto meetingboard) {
		// 트랜잭션 해야 함 파일첨부 한 후에
		
		log.info("register......" + meetingboard);
		
		mapper.insertMeetingBoard(meetingboard);
		System.out.println("매퍼 후야");
		if (meetingboard.getAttachList() == null || meetingboard.getAttachList().size() <= 0) {
			System.out.println("if문 안이야");
			return;
		}
		System.out.println("if문 밖이야");
		meetingboard.getAttachList().forEach(attach -> {
			System.out.println("meetingboard.getBoard_no 뭔데 : " + meetingboard.getBoard_no() );
			attach.setBoard_no(meetingboard.getBoard_no());
			attachMapper.insert(attach);
		});
		
	}


	@Override
	public boolean deleteMeetingBoard(Long board_no) {
		// 파일 첨부 후 트랜잭션 한다.
		
		log.info("remove...." + board_no);
		
		attachMapper.deleteAll(board_no);
		
		return mapper.deleteMeetingBoard(board_no) == 1;
	}


	@Override
	public List<MeetingBoardAttachDTO> attachListMeetingBoard(Long board_no) {
		
		log.info("get Attach list by board_no" + board_no);
		
		return attachMapper.attachListMeetingBoard(board_no);
	}


	// 게시판 글과 첨부파일 수정. 기존 첨부파일 관련 데이터 삭제 후에 다시 첨부파일 데이터 추가 방식
	@Override
	public boolean updateMeetingBoard(MeetingBoardDto meetingboard) {

		attachMapper.deleteAll(meetingboard.getBoard_no());
		
		boolean modifyResult = mapper.updateMeetingBoard(meetingboard) == 1;
		
		if(modifyResult && meetingboard.getAttachList() != null && meetingboard.getAttachList().size() > 0){
			meetingboard.getAttachList().forEach(attach -> { attach.setBoard_no(meetingboard.getBoard_no());
															 attachMapper.insert(attach);
															 });
		}
		
		return modifyResult;
	}


	

}
