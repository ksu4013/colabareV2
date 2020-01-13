package cot.colabare.poll.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cot.colabare.poll.domain.PollAnswer;
import cot.colabare.poll.domain.PollAnswerUserVO;
import cot.colabare.poll.domain.PollAnswerVO;
import cot.colabare.poll.domain.PollCriteria;
import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItemDTO;
import cot.colabare.poll.domain.PollJoiner;
import cot.colabare.poll.domain.PollListVO;
import cot.colabare.poll.domain.PollQuestionDTO;
import cot.colabare.poll.domain.PollVO;
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

//	@Override
//	public List<PollListVO> listPollService() {
//		List<PollListVO> list = mapper.listPoll();
//		return list;
//	}
	@Override
	public List<PollListVO> listPollService(PollCriteria cri) {
		List<PollListVO> poll = mapper.listPaging(cri);
		for (int i = 0; i < poll.size(); i++) {
			poll.get(i).setEtime(poll.get(i).getPoll_etime().substring(0, (poll.get(i).getPoll_etime().length()-2)).replace(":", "").replace("-", "").replace(" ", ""));
		}
		
		
		return poll;
	}

	@Override
	public PollVO detailPollService(int pnum) {
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
	public void insertJoinerService(PollJoiner joiner) {
		mapper.insertJoinerKey(joiner);
	}
	
	@Override
	public void insertAnswerService(PollAnswer answer) {
		mapper.insertAnswer(answer);
	}

	@Override
	public List<PollAnswerVO> detailAnswerService(PollAnswerUserVO pauv) {
		return mapper.detailAnswer(pauv);
	}

	@Override
	public void updateAnswerService(PollAnswer answer) {
		mapper.updateAnswer(answer);
	}

	@Override
	public boolean deletePollService(int i) {
		return mapper.deletePoll(i) == 1;
	}

	@Override
	public void updatePoll(PollDTO poll) {
		mapper.updatePoll(poll);
	}

	@Override
	public void updateQuestion(PollQuestionDTO question) {
		mapper.updateQuestion(question);
	}

	@Override
	public void updateItem(PollItemDTO item) {
		mapper.updateItem(item);
	}

	



}
