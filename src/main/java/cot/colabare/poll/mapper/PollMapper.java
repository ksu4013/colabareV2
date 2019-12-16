package cot.colabare.poll.mapper;

import java.util.List;

import cot.colabare.poll.domain.PollAnswer;
import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItem;
import cot.colabare.poll.domain.PollJoiner;
import cot.colabare.poll.domain.PollQuestion;

public interface PollMapper {
//작성자 
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
//작성자	
	
	
//대상자	
/*	
	public void insertPollJoiner(PollJoiner joiner);
	public void insertPollAnswer(PollAnswer answer);
	
	public PollJoiner detailPollJoiner(int anum);
	public PollAnswer detailPollAnswer(int jnum);
	
	public PollJoiner updatePollJoiner(PollJoiner joiner);
	public PollAnswer updatePollAnswer(PollAnswer answer);
	
	public PollJoiner deletePollJoiner(PollJoiner joiner);
	public PollAnswer deletePollAnswer(PollAnswer answer);
*/	
//대상자	
	
}
