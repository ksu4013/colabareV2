package cot.colabare.todolist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cot.colabare.todolist.domain.TodoDto;
import cot.colabare.todolist.domain.TodotypeDto;
import cot.colabare.todolist.service.TodoService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/todo/*")
@AllArgsConstructor
public class TodoController {

	private TodoService service;
	
	@GetMapping("/todostyle")
	public void todostyle (){
		
	}
	
	@GetMapping("/todolist")
	public void listTodo(@RequestParam(value="todo_type_no")int todo_type_no,Model model){
		log.info("todolist");
		model.addAttribute("todolist", service.getTodoList(todo_type_no));
		model.addAttribute("todo_type_no", todo_type_no);
	}
	
	@GetMapping("/todoinsertform")
	public void registerTodo(@RequestParam(value="todo_type_no") int todo_type_no, Model model,RedirectAttributes rttr){
		log.info("todoinsertform");
		model.addAttribute("todolist", service.getType(todo_type_no));
	}
	
	@PostMapping("/registerTodo")
	public String registerTodo(TodoDto todo, RedirectAttributes rttr) {
		log.info("registerTodo: " + todo);
		service.registerTodo(todo);
		rttr.addFlashAttribute("result", todo.getTodo_no());
		
		return "redirect:/todo/todolist?todo_type_no="+todo.getTodo_type_no(); 
	}
	
	@GetMapping("/getTodo")
	public void getTodo(@RequestParam("todo_no")int todo_no,Model model){
		
		log.info("/getTodo");
		model.addAttribute("type", service.getType(todo_no));
	}
	
	
	@GetMapping({"/getTodo","/todoupdateform"})
	public void modifyTodo(@RequestParam(value="todo_no") int todo_no,@RequestParam(value="todo_type_no") int todo_type_no, Model model){
		
		log.info("/getTodo or /modifyTodo");
		model.addAttribute("todolist", service.getType(todo_type_no));
		model.addAttribute("todo",service.getTodo(todo_no));
		
		//투두 하나로 가보자,, 지금 타입에 해당되는 투두 다 불러ㅇ와서 안된다구 지수가 그래따 
	}
	
	//할일 수정
	@PostMapping("/modifyTodo")
	public String modifyTodo(TodoDto todo,RedirectAttributes rttr){
		log.info("modifyTodo: " + todo);
		
		
		if(service.modifyTodo(todo)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/todo/todolist?todo_type_no="+todo.getTodo_type_no();
	}
	
	
	//할일 삭제
	
	@RequestMapping(value="/deleteTodo", method ={RequestMethod.GET,RequestMethod.POST})
	public String deleteTodo(@RequestParam("todo_no")int todo_no,@RequestParam(value="todo_type_no") int todo_type_no,RedirectAttributes rttr,TodoDto todo){
		
		log.info("deleteTodo..." + todo_no);
		if(service.removeTodo(todo_no)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/todo/todolist?todo_type_no="+todo.getTodo_type_no(); 
	}

	//할일 카운트
	@RequestMapping(value= "/cntTodo",method={RequestMethod.GET,RequestMethod.POST})
	public void cntTodo(@RequestParam(value="todo_type_no")int todo_type_no,Model model){
		log.info("cntTodo");
		model.addAttribute("cnt",service.cntTodo(todo_type_no));
	}
	
	
	/*TODO TYPE*/
	
	@GetMapping("/typelist")
	public void listType(Model model) {
		log.info("typelist");
		model.addAttribute("typelist", service.getTypeList());
	}
	
	
	
	@GetMapping("/typeinsertform")
	public void registerType(){
		
	}
	
	
	@PostMapping("/registerType")
	public String registerType(TodotypeDto type, RedirectAttributes rttr) {
		
		log.info("registerType: " + type);
		
		service.registerType(type);
		
		rttr.addFlashAttribute("result", type.getTodo_type_no());
		
		return "redirect:/todo/typelist";
	}
	
	
	@GetMapping("/getType")
	public void getType(@RequestParam("todo_type_no")int todo_type_no,Model model){
		
		log.info("/getType");
		model.addAttribute("type", service.getType(todo_type_no));
	}
	
	
	@GetMapping({"/getType","/typeupdateform"})
	public void modifyType(@RequestParam(value="todo_type_no",required=false) int todo_type_no,Model model,RedirectAttributes rttr){
		
		log.info("/getType or modifyType");
		model.addAttribute("type", service.getType(todo_type_no));
		
	}
	
	@PostMapping("/modifyType")
	public String modifyType(TodotypeDto type,@ModelAttribute("todo_type_no")TodotypeDto todo_type_no,RedirectAttributes rttr){
		log.info("modifyType: " + type);
		
		if(service.modifyType(type)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/todo/typelist";
	}
	
	@RequestMapping(value="/deleteType", method ={RequestMethod.GET,RequestMethod.POST})
	public String deleteType(@RequestParam("todo_type_no")int todo_type_no,RedirectAttributes rttr){
		log.info("deleteType..." + todo_type_no);
		if(service.removeType(todo_type_no)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/todo/typelist";
	}

}
