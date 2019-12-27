package cot.colabare.poll.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import cot.colabare.poll.domain.PollAnswer;
import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollItemDTO;
import cot.colabare.poll.domain.PollJoiner;
import cot.colabare.poll.domain.PollQuestionDTO;
import cot.colabare.poll.domain.PollGetVO;
import cot.colabare.poll.domain.questionAnditemList;
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
	public String pollinsertform(PollDTO poll, HttpServletRequest request, HttpSession session, RedirectAttributes rttr){
		poll.setPoll_etime(poll.getPoll_etime().replace("T", " "));
		//세션값
//		poll.setPoll_writer((int) session.getAttribute("employee.employee_no"));
		service.insertPollService(poll);
		String[] pqNum = request.getParameterValues("poll_num_question_num");
		
		for (int i = 0; i < pqNum.length; i++) {
			
			String pnqn = request.getParameter("poll_num_question_num"+i);
			log.info("pnqnstring: "+pnqn.toString());
			String pqt = request.getParameter("poll_question_text"+i);
			log.info("pqtstring: "+pqt.toString());
			String pm =  request.getParameter("poll_multiple"+i);
			log.info("pmstring: "+pm.toString());
			char[] ch = pm.toCharArray();
			
			PollQuestionDTO question = new PollQuestionDTO();
			question.setPoll_num(poll.getPoll_num());
			question.setPoll_question_text(pqt);
			question.setPoll_multiple(ch[0]);
			question.setPoll_num_question_num(Integer.parseInt(pnqn));
			log.info("질문 스트링  :  "+question.toString());
			service.insertQuestionService(question);
			log.info("돌아온 q값"+question.getPoll_question_num());
			
			String[] Itext = request.getParameterValues("poll_item_text"+i);
			//삭제 예정
//			String[] Qnin = request.getParameterValues("question_num_item_num"+i);
			log.info("itext 길이: "+Itext.length);
			//삭제 예정
//			log.info("Qnin 길이: "+Qnin.length);
			
			for (int j = 0; j < Itext.length; j++) {
				PollItemDTO item = new PollItemDTO();
				item.setPoll_question_num(question.getPoll_question_num());
				item.setPoll_item_text(Itext[j]);
				//삭제 예정
//				item.setQuestion_num_item_num(Integer.parseInt(Qnin[j]));
				service.insertItemService(item);
			}
		}
		rttr.addFlashAttribute("result", poll.getPoll_num());
		return "redirect:/poll/polllistform";
	}

	
	@GetMapping("/polllistform")
	public void polllistform(Model model){
		log.error("리스트컨트롤러 in");
		model.addAttribute("PollList", service.listPollService());
		log.info("리스트 컨트롤러 out.");
	}
	
	@PostMapping("/detailform")
	public void polluserinputform(Model model){
		
	}
	
	@PostMapping("/modefyform")
	public void pollmodefy(){
		
	}
	
	@PostMapping("/delete")
	public void polldelete(){
		
	}

	@GetMapping("/polluserinsertform")
	public void polluserinsertform(@RequestParam("poll_num") int poll_num, Model model ){
		PollGetVO PUIF = new PollGetVO();
		List<questionAnditemList> qailist = new ArrayList<>();	//넣음
		List<PollItemDTO> pollitems = new ArrayList<>();
		
		PUIF.setPolllist(service.detailPollService(poll_num));
		List<PollQuestionDTO> plist =  service.detailQuestionService(poll_num);
		PUIF.setQilist(qailist);
		
		for (int i = 0; i < plist.size(); i++) {
			questionAnditemList qi = new questionAnditemList();
			qi.setQuestion(plist.get(i));
			int qnum = qi.getQuestion().getPoll_question_num();
			pollitems = service.detailItemService(qnum);
			qi.setItem(pollitems);
			qailist.add(qi);
		}
		model.addAttribute("poll", PUIF);
	}
	
	@PostMapping("/polluserinsertform")
	public String polluserinsertform(HttpServletRequest request , HttpSession session , RedirectAttributes rttr) {
		//배열로 넣으려는 시도
//		List<PollAnswer> anslist = new ArrayList<>();
		PollJoiner joiner = new PollJoiner();
		String pnum =  request.getParameter("poll_num");
		
//		테스트용 
//		String test =  request.getParameter("employee_no");
//		joiner.setEmployee_no(Integer.parseInt(test));
//		int id = (int)session.getAttribute("employee_no");
		joiner.setEmployee_no(0);
		joiner.setPoll_num(Integer.parseInt(pnum));
		log.info("☆☆☆joiner☆☆☆");
		service.insertPollJoiner(joiner);
		
		String[] pqNum = request.getParameterValues("poll_num_question_num");
		
		int num = request.getParameterValues("question_size").length;
		for (int i = 0; i < num ; i++) {
			log.info(i);
			log.info(num);
			String[] pInum = request.getParameterValues("poll_item_num_"+i);
			log.info("pInum: "+pInum.length);
			String[] pQnum = request.getParameterValues("poll_question_num_"+i);
			log.info("pQnum: "+pQnum.length);
			String[] pSnum = request.getParameterValues("poll_select_num_"+i);
			log.info("pSnum: "+pSnum.length);
			
			for (int j = 0; j < pInum.length; j++) {
				PollAnswer answer = new PollAnswer(); 
				answer.setPoll_item_num(Integer.parseInt(pInum[j]));
				answer.setPoll_question_num(Integer.parseInt(pQnum[j]));
				answer.setPoll_select_num(Integer.parseInt(pSnum[j]));
				answer.setPoll_joiner_num(joiner.getPoll_joiner_num());
				//배열용
//				anslist.add(answer);
				log.info(j+"번 "+answer.toString());
				service.insertPollAnswer(answer);
			}
		}
		log.info("◇◇◇◇◇◇◇◇");
		
		log.info(" !");
		return "redirect:/poll/polllistform";
	}
	
	
	
}
