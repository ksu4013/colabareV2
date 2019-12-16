package cot.colabare.poll.service;

import java.util.List;

import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItem;
import cot.colabare.poll.domain.PollQuestion;
import cot.colabare.poll.mapper.PollMapper;
import lombok.Setter;

public class PollServiceImpl implements PollService {
	
	@Setter
	private PollMapper mapper;

	@Override
	public void insertPoll(PollDTO poll) {
		mapper.insertPoll(poll);
	}

	@Override
	public int insertQuestion(PollQuestion question) {
		return mapper.insertQuestion(question);
	}

	@Override
	public int insertItem(PollItem item) {
		return mapper.insertItem(item);
	}

	@Override
	public List<PollDTO> listPoll() {
		return null;
	}

}
