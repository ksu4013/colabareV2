package cot.colabare.poll.domain;

import lombok.Data;

@Data
public class PollAnswer {

	private int poll_answer_num;
	private int poll_item_num;
	private int poll_joiner_num;
	private int poll_question_num;
	private int poll_select_num;
}
