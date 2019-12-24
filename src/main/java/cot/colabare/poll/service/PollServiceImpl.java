package cot.colabare.poll.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItemDTO;
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
		log.info("인서트 poll메퍼 IN");
		mapper.insertPollKey(poll);
		log.info("인서트 poll메퍼 OUT");
	}

	@Override
	public void insertQuestionService(PollQuestionDTO question) {
		log.info("인서트question 메퍼 IN");
		mapper.insertQuestion(question);
		log.info("인서트 question메퍼 OUT");
	}

	@Override
	public void insertItemService(List<PollItemDTO> item) {
		mapper.insertItem(item);
	}

	@Override
	public List<PollListVO> listPollService() {
		log.info("리스트 서비스 갑니다.");
		return mapper.listPoll();
	}

}
