package cot.colabare.poll.domain;

import lombok.Data;

@Data
public class PollListVO {

	private int poll_num;
	private int poll_writer;
	private char poll_type;
	private String poll_title;
	private String poll_contents;
	private String poll_stime;
	private String poll_etime;
	private String name;
	private String department_name;
}
