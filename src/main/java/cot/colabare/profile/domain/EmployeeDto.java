package cot.colabare.profile.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class EmployeeDto implements Serializable{
	int employee_no;
	String department_id;
	String name;
	String e_mail;
	int position_id;
	String master;
	String approval_img;
	String exist;
	
}
