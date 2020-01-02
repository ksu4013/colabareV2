package cot.colabare.poll.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.mapper.PollMapper;
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
public class delete {

	@Setter(onMethod_ = {@Autowired})
	private PollService service;
	private PollMapper mapper;
	
	@Test
	public void test() {
//		boolean i = 
		log.info("삭제: "+mapper.deletePoll(42)); 
		
	}

}
