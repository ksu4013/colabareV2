package cot.colabare.poll.domain;

import java.util.List;


import lombok.Data;

@Data
public class PollGetVO {

	private PollListVO polllist;
	private List<questionAnditemList> qilist;
}
