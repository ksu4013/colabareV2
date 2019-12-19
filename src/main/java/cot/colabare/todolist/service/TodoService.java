package cot.colabare.todolist.service;

import java.util.List;

import cot.colabare.todolist.domain.TodoDto;
import cot.colabare.todolist.domain.TodotypeDto;

public interface TodoService {

	// 할일 
	
	//할일 등록
	public void registerTodo(TodoDto todo);
	
	//할일 상세보기
	public TodoDto getTodo(int todo_no);
	
	//할일 수정
	public boolean modifyTodo(TodoDto todo);
	
	//할일 삭제
	public boolean removeTodo(int todo_no);
	
	//할일 목록 조회
	public List<TodoDto> getTodoList();
	
	
	
	//할일 유형
	
	public void registerType(TodotypeDto type);
	
	public TodotypeDto getType(int todo_type_no);
	
	public boolean modifyType(TodotypeDto type);
	
	public boolean removeType(int todo_type_no);
	
	public List<TodotypeDto> getTypeList();
	
	
}
