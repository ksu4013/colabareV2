package cot.colabare.todolist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cot.colabare.todolist.domain.TodoDto;
import cot.colabare.todolist.domain.TodotypeDto;
import cot.colabare.todolist.mapper.TodoMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class TodoServiceImpl implements TodoService {

	@Setter(onMethod_ = @Autowired)
	private TodoMapper mapper;
	
	public void registerTodo(TodoDto todo) {
		log.info("register..."+todo);
		mapper.insertTodo(todo);

	}

	@Override
	public TodoDto getTodo(int todo_no) {
		log.info("get...." + todo_no);

		return mapper.detail(todo_no);
	}

	@Override
	public boolean modifyTodo(TodoDto todo) {
		log.info("modify..." + todo);

		return mapper.updateTodo(todo) == 1;
	}

	@Override
	public boolean removeTodo(int todo_no) {
		log.info("delete...." + todo_no);
		return mapper.deleteTodo(todo_no) == 1;
	}

	@Override
	public List<TodoDto> getTodoList(int todo_type_no) {
		log.info("getList....");

		return mapper.getTodoList(todo_type_no);
	}

	
	
	
	
	@Override
	public void registerType(TodotypeDto type) {
		log.info("registerType..." + type);
		mapper.insertType(type);

	}

	@Override
	public TodotypeDto getType(int todo_type_no) {
		log.info("getType..." + todo_type_no);
		return mapper.detailType(todo_type_no);
	}

	@Override
	public boolean modifyType(TodotypeDto type) {
		log.info("modifyType..." + type);
		return mapper.updateType(type)==1;
	}

	@Override
	public boolean removeType(int todo_type_no) {
		log.info("removeType..." + todo_type_no);
		return mapper.deleteType(todo_type_no) == 1;
	}

	@Override
	public List<TodotypeDto> getTypeList() {
		log.info("getTypeList....");
		return mapper.getTypeList();
	}

}