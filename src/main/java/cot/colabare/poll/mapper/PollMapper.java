package cot.colabare.poll.mapper;

import java.util.List;

import cot.colabare.poll.domain.PollAnswer;
import cot.colabare.poll.domain.PollAnswerUserVO;
import cot.colabare.poll.domain.PollAnswerVO;
import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItemDTO;
import cot.colabare.poll.domain.PollJoiner;
import cot.colabare.poll.domain.PollListVO;
import cot.colabare.poll.domain.PollQuestionDTO;
import cot.colabare.poll.domain.PollVO;

public interface PollMapper {
//?��?��?��
	public void insertPoll(PollDTO polldto);
	public void insertPollKey(PollDTO polldto);
	public void insertQuestion(PollQuestionDTO questiondto);
	public void insertQuestionKey(PollQuestionDTO questiondto);
	public void insertItem(PollItemDTO itemdto);
	
	public void insertJoinerKey(PollJoiner joiner);
	public void insertAnswer(PollAnswer answer);
	
	public List<PollListVO> listPoll();
	
	public PollVO detailPoll(int pnum);
	public List<PollQuestionDTO> detailQuestion(int pnum);
	public List<PollItemDTO> detailItem(int qnum);
	public List<PollAnswerVO> detailAnswer(PollAnswerUserVO pauv);
//	public PollJoiner detailPollJoiner(int anum);
	
//	public PollDTO updatePoll(PollDTO poll);
//	public PollQuestion updateQuestion(PollQuestion question);
//	public PollItem updateItem(PollItem item);
	public void updateAnswer(PollAnswer answer);
//	public PollJoiner updateJoiner(PollJoiner joiner);
	
	
//	public PollDTO deletePoll(PollDTO poll);
//	public PollQuestion deleteQuestion(PollQuestion question);
//	public PollItem deleteItem(PollItem item);
	

	
	
//	public PollJoiner deletePollJoiner(PollJoiner joiner);
//	public PollAnswer deletePollAnswer(PollAnswer answer);
	
}
