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
	public List<TodoDto> getTodoList(int todo_type_no);
	
	//할일 카운트
	public int cntTodo(int todo_type_no);
	
	//할일 유형
	
	//유형 등록
	public void registerType(TodotypeDto type);

	//유형 상세
	public TodotypeDto getType(int todo_type_no);

	//유형 수정
	public boolean modifyType(TodotypeDto type);

	//유형 삭제
	public boolean removeType(int todo_type_no);

	//유형 목록 조회
	public List<TodotypeDto> getTypeList();
	
	
}
