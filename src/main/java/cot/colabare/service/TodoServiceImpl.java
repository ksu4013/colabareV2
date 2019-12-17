package cot.colabare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import cot.colabare.domain.TodoDto;
import cot.colabare.domain.TodotypeDto;
import cot.colabare.mapper.TodoMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@Repository
public class TodoServiceImpl implements TodoService {

	@Setter(onMethod_ = @Autowired)
	private TodoMapper mapper;

	@Override
	public void register(TodoDto todo) {
		log.info("register..." + todo);

		mapper.insertTodo(todo);

	}

	@Override
	public TodoDto get(int todo_no) {
		log.info("get...." + todo_no);

		return mapper.detail(todo_no);
	}

	@Override
	public boolean modify(TodoDto todo) {
		log.info("modify..." + todo);

		return mapper.updateTodo(todo) == 1;
	}

	@Override
	public boolean remove(int todo_no) {
		log.info("delete...." + todo_no);
		return mapper.deleteTodo(todo_no) == 1;
	}

	@Override
	public List<TodoDto> getList() {
		log.info("getList....");

		return mapper.getTodoList();
	}

	@Override
	public void registerType(TodotypeDto type) {
		log.info("typeregister..." + type);
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
		return mapper.updateType(type) == 1;
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
