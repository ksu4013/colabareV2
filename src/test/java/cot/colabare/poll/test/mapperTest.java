package cot.colabare.poll.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cot.colabare.poll.domain.PollCriteria;
import cot.colabare.poll.domain.PollDTO;
import cot.colabare.poll.domain.PollListVO;
import cot.colabare.poll.domain.PollVO;
import cot.colabare.poll.mapper.PollMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class mapperTest {

	@Setter(onMethod_ = @Autowired)
	private PollMapper mapper;
	
	@Test
	public void test() {
		PollCriteria cri = new PollCriteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		List<PollListVO> list = mapper.listPaging(cri);
		list.forEach(PollListVO -> log.info(PollListVO.getPoll_num()));

	}

}
