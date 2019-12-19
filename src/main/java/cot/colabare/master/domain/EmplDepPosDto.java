package cot.colabare.master.domain;

import java.io.Serializable;

import lombok.Data;


@Data
public class EmplDepPosDto implements Serializable{
	int employee_no;
	String department_id;
	String name;
	String e_mail;
	int position_id;
	String master;
	String department_name;
	String position_name;
	
}
