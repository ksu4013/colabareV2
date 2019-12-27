package cot.colabare.approval.domain;

import lombok.Data;

@Data
public class AEmployeeDto {

	private Long employee_no;
	private String department_id;
	private String name;
	private String e_mail;
	private Long position_id;
	
	private String query;
	
}
