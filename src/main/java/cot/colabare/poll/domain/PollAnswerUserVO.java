package cot.colabare.poll.domain;

import lombok.Data;

@Data
public class PollAnswerUserVO {
	private int poll_num;
	private int poll_question_num;
	private int employee_no;
}
