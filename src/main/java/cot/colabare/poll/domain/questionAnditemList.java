package cot.colabare.poll.domain;

import java.util.List;

import lombok.Data;

@Data
public class questionAnditemList {

	private PollQuestionDTO question;
	private List<PollItemDTO> item;
}
