package cot.colabare.service;

import java.util.List;

import cot.colabare.domain.TodoDto;
import cot.colabare.domain.TodotypeDto;

public interface TodoService {

	// 할일 
	
	//할일 등록
	public void register(TodoDto todo);
	
	//할일 상세보기
	public TodoDto get(int todo_no);
	
	//할일 수정
	public boolean modify(TodoDto todo);
	
	//할일 삭제
	public boolean remove(int todo_no);
	
	//할일 목록 조회
	public List<TodoDto> getList();
	
	
	
	//할일 유형
	
	public void registerType(TodotypeDto type);
	
	public TodotypeDto getType(int todo_type_no);
	
	public boolean modifyType(TodotypeDto type);
	
	public boolean removeType(int todo_type_no);
	
	public List<TodotypeDto> getTypeList();
	
	
}
