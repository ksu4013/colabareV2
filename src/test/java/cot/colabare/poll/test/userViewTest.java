package cot.colabare.poll.test;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cot.colabare.poll.service.PollService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class userViewTest {

	@Setter(onMethod_ = {@Autowired})
	private PollService service;
	
	
	@Test
	public void test()throws Exception{
		//서비스 - 매퍼 확인 완료
//		log.info(service.detailPollService(2));
//		log.info(service.detailQuestionService(2));
//		log.info(service.detailItemService(3));
	}

}
