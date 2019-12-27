package cot.colabare.poll.test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class ControllerTest {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mock;
	
	@Before
	public void setup(){
		this.mock  = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void test()throws Exception{
		String resultPage = mock.perform(MockMvcRequestBuilders.post("/poll/pollinsertform")
				
				.param("poll_writer", "0")
				.param("poll_type","1")
				.param("poll_title", "스프링테스터1")
				.param("poll_contents", "스프링테스트내용1")
				.param("poll_etiem", "2019-12-23T01:00")
				
				
				
				
				
				//테스트 왼료
//				.param("poll_num_question_num", "0")
//				.param("poll_num_question_num", "0")
//				
//				.param("poll_question_text0", "dddd")
//				.param("poll_multiple0", "5")
//				.param("poll_num_question_num0", "4")
//				
//				.param("poll_item_text0", "아이템텍스트0-1")
//				.param("question_num_item_num0", "1")
//				.param("poll_item_text0", "아이템텍스트0-2")
//				.param("question_num_item_num0", "2")
//				/*질문 구분선*/				
//				.param("poll_question_text1", "dddd2")
//				.param("poll_multiple1", "7")
//				.param("poll_num_question_num1", "5")
//				
//				.param("poll_item_text1", "아이템텍스트1-1")
//				.param("question_num_item_num1", "1")
//				.param("poll_item_text1", "아이템텍스트1-2")
//				.param("question_num_item_num1", "2")
				
				
//				
				).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
//	poll.setPoll_writer(0);
//	poll.setPoll_type('1');
//	poll.setPoll_title("테스트 제목5");
//	poll.setPoll_contents("테스트 내용5");

}
