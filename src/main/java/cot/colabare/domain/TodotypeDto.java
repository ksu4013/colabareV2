package cot.colabare.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class TodotypeDto {

	private int todo_type_no;
	private String todo_type_title;
	private String todo_type_contents;
	
	
}
