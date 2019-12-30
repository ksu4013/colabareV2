package cot.colabare.approval.domain;

import lombok.Data;

@Data
public class ApprovalDto {

	private   Long approval_no;			// 전자결재번호
	private   Long employee_no;			// 사원번호
	private String department_id;		// 부서번호
	private   Long document_no;			// 문서번호
	private String title;				// 제목
	private String content;				// 내용
	private String write_date;			// 등록일
	private String delete_date;			// 삭제일
	private   char temporary_save;		// 임시저장여부
	private String approval_img;		// 전자결재이미지
	private   char active;				// 공개여부
	private String content2;
	private String content3;
	private String content4;
	private String content5;
	private String content6;
	private String content7;
	private String content8;
	private String content9;
	private String content10;
	
	private String name;				// 사원명
	private String department_name;		// 부서명
	private String dtitle;				// 문서 제목
}
