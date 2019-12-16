package cot.colabare.poll.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItem;
import cot.colabare.poll.domain.PollQuestion;

public interface PollService {

	public void insertPoll(PollDTO poll);
	public int insertQuestion(PollQuestion question);
	public int insertItem(PollItem item);
	
	public List<PollDTO> listPoll();
	
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
