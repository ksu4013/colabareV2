package cot.colabare.approval.domain;

import lombok.Data;

@Data
public class ApprovalViewerDto {

	private Long apprviewer;
	private Long approval_no;
	private Long employee_no;
	
	private String name;
	private String department_name;
}
