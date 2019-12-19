package cot.colabare.profile.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ModifyRequestDto implements Serializable{
	private int modify_no;
	private int employee_no;
	private String modify_info;
	private String request_date;
	
}
