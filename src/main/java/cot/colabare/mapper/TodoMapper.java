package cot.colabare.mapper;

import java.util.List;

import cot.colabare.domain.TodoDto;
import cot.colabare.domain.TodotypeDto;

public interface TodoMapper {


	public void insertTodo(TodoDto todo);
	
	public int deleteTodo(int todo_no);
	
	public int updateTodo(TodoDto todo);
	
	public List<TodoDto> getTodoList();
	
	public TodoDto detail(int todo_no);
	
	
	public void insertType(TodotypeDto type);
	
	public int deleteType(int todo_type_no);
	
	public int updateType(TodotypeDto type);
	
	public List<TodotypeDto> getTypeList();
	
	public TodotypeDto detailType(int todo_type_no);
}
