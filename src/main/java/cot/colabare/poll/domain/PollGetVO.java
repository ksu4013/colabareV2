package cot.colabare.poll.domain;

import java.util.List;


import lombok.Data;

@Data
public class PollGetVO {

	private PollVO pollVO;
	private List<PollAnswerVO> answer;
	private List<questionAnditemList> qilist;
	
}
