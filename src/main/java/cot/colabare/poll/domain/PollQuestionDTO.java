package cot.colabare.poll.domain;

import lombok.Data;

@Data
public class PollQuestionDTO {
	private int poll_question_num;
	private int poll_num;
	private String poll_question_text;
	private char poll_multiple;
	private int poll_num_question_num;
}
