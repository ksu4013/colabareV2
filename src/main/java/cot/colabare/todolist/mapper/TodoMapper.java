package cot.colabare.todolist.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import cot.colabare.todolist.domain.TodoDto;
import cot.colabare.todolist.domain.TodotypeDto;

@Repository
public interface TodoMapper {

	//할일 등록
	public void insertTodo(TodoDto todo);
	
	//할일 삭제
	public int deleteTodo(int todo_no);
	
	//할일 수정
	public int updateTodo(TodoDto todo);
	
	//할일 조회
	public List<TodoDto> getTodoList(int todo_type_no);
	
	//할일 상세
	public TodoDto detailTodo(int todo_no);
	
	//할일 카운트
	public int cntTodo(int todo_type_no);
	
	//유형 등록
	public void insertType(TodotypeDto type); 
	
	//유형 삭제
	public int deleteType(int todo_type_no);
	
	//유형 수정
	public int updateType(TodotypeDto type);
	
	//유형 목록
	public List<TodotypeDto> getTypeList();
	
	//유형 상세
	public TodotypeDto detailType(int todo_type_no);
}
