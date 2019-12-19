package cot.colabare.profile.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ProfileDto implements Serializable{
	int employee_no;
	String employee_img;
	String employee_greeting;
	
}
