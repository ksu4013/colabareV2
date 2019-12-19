package cot.colabare.master.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class PositionDto implements Serializable{
	private int position_id;
	private String position_name;
	
}
