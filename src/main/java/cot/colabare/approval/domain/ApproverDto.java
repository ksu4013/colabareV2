package cot.colabare.approval.domain;

import lombok.Data;

@Data
public class ApproverDto {
	
	private   Long no;				// 결재승인자번호
	private   Long approval_no;		// 전자결재번호
	private   Long employee_no;		// 사원번호
	private   char approval_active;	// 가결여부
	private    int  approval_level;	// 결재단계
	private String approval_date;	// 결재일
	private    int approvercnt;		// 결재순서
	
	private String name;
	private String department_name;
	private   Long document_no;
	private String title;
	private String write_date;
	private String dtitle;
	
	private String employee_img;
	private String profilepic;

}
