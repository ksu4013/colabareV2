package cot.colabare.poll.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cot.colabare.poll.domain.PollAnswer;
import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItemDTO;
import cot.colabare.poll.domain.PollJoiner;
import cot.colabare.poll.domain.PollListVO;
import cot.colabare.poll.domain.PollQuestionDTO;
import cot.colabare.poll.mapper.PollMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class PollServiceImpl implements PollService {
	
	@Setter(onMethod_ = {@Autowired})
	private PollMapper mapper;

	@Override
	public void insertPollService(PollDTO poll) {
		mapper.insertPollKey(poll);
	}

	@Override
	public void insertQuestionService(PollQuestionDTO question) {
		mapper.insertQuestionKey(question);
	}

	@Override
	public void insertItemService(PollItemDTO item) {
		mapper.insertItem(item);
	}

	@Override
	public List<PollListVO> listPollService() {
		List<PollListVO> list = mapper.listPoll();
		return list;
	}

	@Override
	public PollListVO detailPollService(int pnum) {
		return mapper.detailPoll(pnum); 
	}

	@Override
	public List<PollQuestionDTO> detailQuestionService(int pnum) {
		return mapper.detailQuestion(pnum);
	}

	@Override
	public List<PollItemDTO> detailItemService(int qnum) {
		return mapper.detailItem(qnum);
	}
	
	@Override
	public void insertPollJoiner(PollJoiner joiner) {
		mapper.insertPollJoinerKey(joiner);
	}
	
	@Override
	public void insertPollAnswer(PollAnswer answer) {
		log.info("메퍼 전.......................");
		mapper.insertPollAnswer(answer);
	}



}
