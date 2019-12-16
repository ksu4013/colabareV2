package cot.colabare.poll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItem;
import cot.colabare.poll.domain.PollQuestion;
import cot.colabare.poll.service.PollService;

@Controller
@RequestMapping("/poll/*")
public class PollController {

	private PollService service;
	
	@GetMapping("/insertform")
	public void pollinsertform(){}
	
	@PostMapping("/insertform")
	public String pollinsertform(PollDTO poll, PollQuestion question , PollItem item, RedirectAttributes rttr){
		service.insertPoll(poll);
		service.insertQuestion(question);
		service.insertItem(item);
		
		rttr.addFlashAttribute("result", poll);
		return "redirect:/poll/listform";
	}
	
	@PostMapping("/listform")
	public void polllistform(){
		
	}
	
	@PostMapping("/detailform")
	public void polluserinputform(){
		
	}
	
	@PostMapping("/modefyform")
	public void pollmodefy(){
		
	}
	
	@PostMapping("/delete")
	public void polldelete(){
		
	}
	
}
