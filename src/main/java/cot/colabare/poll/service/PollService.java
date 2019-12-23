package cot.colabare.poll.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItemDTO;
import cot.colabare.poll.domain.PollListVO;
import cot.colabare.poll.domain.PollQuestionDTO;

public interface PollService {

	public void insertPollService(PollDTO poll);
	public void insertQuestionService(PollQuestionDTO question);
	public void insertItemService(List<PollItemDTO> item);
	
	public List<PollListVO> listPollService();
	
//	public PollDTO detailPoll(int pnum);
//	public PollQuestion detailQuestion(int pnum);
//	public PollItem detailItem(int qnum);
//	
//	public PollDTO updatePoll(PollDTO poll);
//	public PollQuestion updateQuestion(PollQuestion question);
//	public PollItem updateItem(PollItem item);
//
//	public PollDTO deletePoll(PollDTO poll);
//	public PollQuestion deleteQuestion(PollQuestion question);
//	public PollItem deleteItem(PollItem item);
}
