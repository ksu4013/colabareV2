package cot.colabare.poll.service;

import java.util.List;

import cot.colabare.poll.domain.PollAnswer;
import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItemDTO;
import cot.colabare.poll.domain.PollJoiner;
import cot.colabare.poll.domain.PollListVO;
import cot.colabare.poll.domain.PollQuestionDTO;

public interface PollService {

	public void insertPollService(PollDTO poll);
	public void insertQuestionService(PollQuestionDTO question);
	public void insertItemService(PollItemDTO item);
	
	public List<PollListVO> listPollService();
	
	public PollListVO detailPollService(int pnum);
	public List<PollQuestionDTO> detailQuestionService(int pnum);
	public List<PollItemDTO> detailItemService(int qnum);
	
	public void insertPollAnswer(PollAnswer answer);
	public void insertPollJoiner(PollJoiner joiner);
	
	
//	public PollDTO updatePoll(PollDTO poll);
//	public PollQuestion updateQuestion(PollQuestion question);
//	public PollItem updateItem(PollItem item);
//
//	public PollDTO deletePoll(PollDTO poll);
//	public PollQuestion deleteQuestion(PollQuestion question);
//	public PollItem deleteItem(PollItem item);
}
