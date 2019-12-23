package cot.colabare.poll.domain;

import lombok.Data;

@Data
public class PollDTO {

	private int poll_num;
	private int poll_writer;
	private int employee_no;
	private char poll_type;
	private String poll_title;
	private String poll_contents;
	private String poll_stime;
	private String poll_etime;
}
