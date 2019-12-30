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
import cot.colabare.poll.domain.PollAnswerUserVO;
import cot.colabare.poll.domain.PollAnswerVO;
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
	public String pollinsertform(PollDTO poll, HttpServletRequest request, RedirectAttributes rttr){
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
	
	@PostMapping("/updateform")
	public void pollmodefy(){
		
	}
	
	

	@GetMapping("/polluserinsertform")
	public void polluserinsertform(@RequestParam("poll_num") int poll_num, HttpSession session, Model model ){
		PollGetVO PUIF = new PollGetVO();
		List<questionAnditemList> qailist = new ArrayList<>();
		List<PollItemDTO> pollitems = new ArrayList<>();
		List<PollAnswerVO> answerget = new ArrayList<>();
		List<PollAnswerVO> answerset = new ArrayList<>();
		PollAnswerUserVO pauv = new PollAnswerUserVO();
		int end = 0;
		
		String[] eno = session.getAttribute("meminfo").toString().split("=");
		for (int j = 0; j < eno.length; j++) {
			if (eno[j].contains("employee_no")) {
				++j;
				String[] eno1 = eno[j].split(",");
				end = Integer.parseInt(eno1[0]);
				break;
			}
		}
		
		pauv.setPoll_num(poll_num);
		pauv.setEmployee_no(end);
		PUIF.setPollVO(service.detailPollService(poll_num));
		List<PollQuestionDTO> plist =  service.detailQuestionService(poll_num);
		PUIF.setQilist(qailist);
		
		for (int i = 0; i < plist.size(); i++) {
			questionAnditemList qi = new questionAnditemList();
//			pauv = new PollAnswerUserVO();
			
			qi.setQuestion(plist.get(i));
			int qnum = qi.getQuestion().getPoll_question_num();
			pollitems = service.detailItemService(qnum);
			qi.setItem(pollitems);
			
			pauv.setPoll_question_num(qnum);
			pauv.setEmployee_no(end);
			answerget = service.detailAnswerService(pauv);
			qailist.add(qi);
			for (int j = 0; j < answerget.size(); j++) {
				answerset.add(answerget.get(j));	
			}
		}
		PUIF.setAnswer(answerset);
		 
		log.info("nit");
		model.addAttribute("poll", PUIF);
	}
	
	@PostMapping("/polluserinsertform")
	public String polluserinsertform(HttpServletRequest request, RedirectAttributes rttr) {
		//배열로 넣으려는 시도
//		List<PollAnswer> anslist = new ArrayList<>();
		PollJoiner joiner = new PollJoiner();
		String pnum =  request.getParameter("poll_num");
		
		int joinnum = Integer.parseInt(request.getParameter("employee_no"));
		joiner.setEmployee_no(joinnum);
		joiner.setPoll_num(Integer.parseInt(pnum));
		log.info("☆☆☆joiner☆☆☆");
		service.insertJoinerService(joiner);
		
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
				service.insertAnswerService(answer);
			}
		}
		
		return "redirect:/poll/polllistform";
	}
	
	@PostMapping("/polluserupdate")
	public String polluserupdate(HttpServletRequest request, RedirectAttributes rttr){
//		List<PollAnswer> panswer = new ArrayList<>();
		String[] span = request.getParameterValues("poll_answer_num");
		int spjn = Integer.parseInt(request.getParameter("poll_joiner_num"));
		int s = 0;
		int count = request.getParameterValues("question_size").length;
		for (int i = 0; i < count; i++) {
			
			String[] spin = request.getParameterValues("poll_item_num_"+i);
			String[] spqn = request.getParameterValues("poll_question_num_"+i);
			String[] spsn = request.getParameterValues("poll_select_num_"+i);
			
			for (int j = 0; j < spin.length; j++) {
				PollAnswer pa = new PollAnswer();
				
				pa.setPoll_answer_num(Integer.parseInt(span[s]));
				s++;
				pa.setPoll_joiner_num(spjn);
				pa.setPoll_item_num(Integer.parseInt(spin[j]));
				pa.setPoll_question_num(Integer.parseInt(spqn[j]));
				pa.setPoll_select_num(Integer.parseInt(spsn[j]));
				
				service.updateAnswerService(pa);
//				panswer.add(pa);
//				${poll.poll_num}"
				
			}
		}
		String re = "redirect:/poll/polluserinsertform?poll_num="+request.getParameter("poll_num");
		return re;
	}
	
	
}
