package cot.colabare.todolist.domain;

import lombok.Data;

@Data
public class TodoDto {

	private int todo_no;
	private String todo_title;
	private String todo_contents;
	private String regdate;
	private String deldate;
	private String todo_complete;
	private String todo_priority;
	private int employee_no;
	private int todo_type_no;
	private String upload_on_cal;
	private String startdate;
	private String enddate;
	
	
}
