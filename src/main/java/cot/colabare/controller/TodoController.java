package cot.colabare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cot.colabare.domain.TodoDto;
import cot.colabare.service.TodoService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/todo/*")
@AllArgsConstructor
public class TodoController {

	private TodoService service;
	
	/*@GetMapping("/todolist")
	public void list(Model model) {
		log.info("todolist");
		model.addAttribute("todolist", service.getList());
	}*/
	
	

	@GetMapping("/typelist")
	public void listType(Model model) {
		log.info("typelist");
		model.addAttribute("typelist", service.getTypeList());
	}

	/*@RequestMapping(value = "/todoinsertform", method = RequestMethod.POST)
	@PostMapping("/todoinsertform")
	public String register(TodoDto todo, RedirectAttributes rttr) {
		log.info("register: " + todo);
		service.register(todo);
		rttr.addFlashAttribute("result", todo.getTodo_no());
		return "redirect:/todo/todolist";
	}
*/
}
