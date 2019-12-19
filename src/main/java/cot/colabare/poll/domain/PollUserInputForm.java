package cot.colabare.poll.domain;

import java.util.List;

import lombok.Data;

@Data
public class PollUserInputForm {

	private PollListVO polllist;
	private List<PollQuestionDTO> questions;
	private List<PollItemDTO> items;
}
