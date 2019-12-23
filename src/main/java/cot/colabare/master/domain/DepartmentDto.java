package cot.colabare.master.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class DepartmentDto implements Serializable {
	private String department_id;
	private String department_name;
	
}
