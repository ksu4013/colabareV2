package cot.colabare.poll.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PollCriteria {
	private int pageNum;
	private int amount;
	
	public PollCriteria(){
		this(1,10); 
	}
	
	public PollCriteria(int pageNum,int amount){
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
