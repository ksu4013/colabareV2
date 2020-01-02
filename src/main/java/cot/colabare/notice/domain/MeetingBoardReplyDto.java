package cot.colabare.notice.domain;

import lombok.Data;

@Data
public class MeetingBoardReplyDto {

	private   Long reply_no;		// 댓글 번호
	private   Long board_no;		// 글 번호
	private String write_date;		// 작성일
	private String content;			// 내용
	private    int employee_no;		// 사원번호
	
	private String name;			// 사원이름
	
	
	

}
