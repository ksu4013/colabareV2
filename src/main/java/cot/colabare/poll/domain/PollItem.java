package cot.colabare.poll.domain;

import lombok.Data;

@Data
public class PollItem {

	private int poll_item_num;
	private int poll_question_num;
	private String poll_item_text;
	private String poll_item_other;
}
