package cot.colabare.meetingboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cot.colabare.meetingboard.domain.MeetingBoardReplyDto;
import cot.colabare.meetingboard.domain.MeettingBoardCriteria;
import cot.colabare.meetingboard.domain.ReplyPageDTO;
import cot.colabare.meetingboard.mapper.MeetingBoardMapper;
import cot.colabare.meetingboard.mapper.MeetingBoardReplyMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MeetingBoardReplyServiceImpl implements MeetingBoardReplyService {

	@Setter(onMethod_ = @Autowired)
	private MeetingBoardReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private MeetingBoardMapper mbMapper;
	
	
	@Override
	public MeetingBoardReplyDto detailMBReply(Long reply_no) {
		log.info("get......" + reply_no);

		return mapper.detailMBReply(reply_no);	
	}

	@Override
	public List<MeetingBoardReplyDto> mbReplyList(MeettingBoardCriteria cri, Long board_no) {
		log.info("get Reply List of a MBoard " + board_no);

		return mapper.mbReplyList(cri, board_no);
	}

	// 댓글 리스트와 페이징
	@Override
	public ReplyPageDTO getListPage(MeettingBoardCriteria cri, Long board_no) {
		
		return new ReplyPageDTO(mapper.countMBReply(board_no), mapper.mbReplyList(cri, board_no));
	}

	@Override
	public int insertMBReply(MeetingBoardReplyDto mbReply) {

		log.info("register......" + mbReply);
		
		mbMapper.updateReplyCnt(mbReply.getBoard_no(), 1);
		
		return mapper.insertMBReply(mbReply);
	}

}
