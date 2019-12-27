package cot.colabare.master.domain;

import lombok.Data;

@Data
public class UserDto {
	private String userid;
	private String userpw;
	private int employee_no;
	private String enabled;
	
}
