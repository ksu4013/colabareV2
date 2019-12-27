package cot.colabare.profile.domain;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Data
@Getter
@ToString
public class ProfileAttachDto {

	  private String p_uuid;			// uuid가 포함 된 이름을 pk로 하는 컬럼
	  private String p_uploadPath;	// 실제 파일이 업로드 된 경로
	  private String p_fileName;		// 파일 이름
	  private int employee_no;				// 해당 게시물 번호 저장
}
