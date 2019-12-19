package cot.colabare.master.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class SecurityAuthDto implements Serializable{
	private int employee_id;
	private String reference_cud;
	private String meeting_cud;
	private String notice_cud;
	private String project_c;
	
}
