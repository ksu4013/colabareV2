package cot.colabare.contact.domain;

import java.io.Serializable;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class ContactEmplDto implements Serializable{
	private int employee_no;
	private String department_id;
	private String department_name;
	private String position_id;
	private String position_name;
	private String name;
	private String employee_img;
	private String employee_greeting;
	private String e_mail;
	
	private String profile_pic;
}
