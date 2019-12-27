package cot.colabare.meetingboard.domain;

import lombok.Data;

@Data
public class MeetingBoardAttachDto {

  private String uuid;			// uuid가 포함 된 이름을 pk로 하는 컬럼
  private String uploadPath;	// 실제 파일이 업로드 된 경로
  private String fileName;		// 파일 이름
  private boolean fileType;		// 이미지 파일 여부
  
  private Long board_no;		// 해당 게시물 번호 저장
  
}
