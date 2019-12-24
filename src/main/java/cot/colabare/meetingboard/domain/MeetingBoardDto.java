package cot.colabare.meetingboard.domain;

import java.util.List;

import lombok.Data;

@Data
public class MeetingBoardDto {

	private   Long board_no;			// 글번호 int로 했었는데 Long으로 따라바꿈(책)
	private String title;				// 글제목
	private String content;				// 내용
	private    int employee_no;			// 사원번호
	private    int read_count;			// 조회수
	private String write_date;			// 작성일
	private String original_file_name;	// 원본파일명
	private String rename_file_name;	// 수정된파일명
	private   char active;				// 공개여부
	private    int replyCnt;			// 해당 글 댓글 갯수
	
	private String name;				// 사원이름
	
	private List<MeetingBoardAttachDTO> attachList;
	
	
	
		
}
