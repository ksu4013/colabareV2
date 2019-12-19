package cot.colabare.poll.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.jsonPath;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParser;

import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItemDTO;
import cot.colabare.poll.domain.PollQuestionDTO;
import cot.colabare.poll.service.PollService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/poll/*")
@AllArgsConstructor
public class PollController {

	private PollService service;
	
	@GetMapping("/pollinsertform")
	public void pollinsertform(){}
	
	@PostMapping("/pollinsertform")
	public String pollinsertform(PollDTO poll, HttpServletRequest request, RedirectAttributes rttr){
		
		service.insertPollService(poll);
		
		log.info("돌아온 값: " +poll.getPoll_num());
		String[] pqt = request.getParameterValues("poll_question_text");
		String[] pm =  request.getParameterValues("poll_multiple");
		char[] chpm = null; 
		for (int i = 0; i < pm.length; i++) {
			char[] ch = pm[i].toCharArray();
			 chpm[i] = ch[0];
		}
		
		String[] pnqn = request.getParameterValues("poll_num_question_num");
		
		for (int i = 0; i < pnqn.length; i++) {
		PollQuestionDTO question = new PollQuestionDTO();
		question.setPoll_num(poll.getPoll_num());
		question.setPoll_question_text(pqt[i]);
		question.setPoll_multiple(chpm[i]);
		question.setPoll_num_question_num(Integer.parseInt(pnqn[i]));
		service.insertQuestionService(question);
		
		}
		
		
		
//		service.insertItemService(item);
		
//		rttr.addFlashAttribute("result", poll.getPoll_num());
		return "redirect:/poll/listform";
	}
	
//	@PostMapping("/pollinsertform")
//	public String pollinsertform(PollDTO poll, List<PollQuestionDTO> question, List<PollItemDTO> item, RedirectAttributes rttr){
////		PollDTO poll, List<PollQuestionDTO> question, List<PollItemDTO> item
//		service.insertPollService(poll);
//		service.insertQuestionService(question);
//		service.insertItemService(item);
//		
//		rttr.addFlashAttribute("result", question.get(1).toString());
//		log.info("리스트1번 값:"+question.get(1).toString());
//		return "redirect:/poll/listform";
//	}
	
	@GetMapping("/polllistform")
	public void polllistform(Model model){
		log.error("서비스in");
		model.addAttribute("polllist", service.listPollService());
		log.info("서비스out.");
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
