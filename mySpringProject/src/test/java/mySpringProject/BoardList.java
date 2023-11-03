package mySpringProject;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myProject.www.domain.BoardVO;
import com.myProject.www.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.myProject.www.config.RootConfig.class})
public class BoardList {

	@Inject
	private BoardDAO bdao;
	
	@Test
	public void insertBoard() {
		for(int i=0; i<300; i++) {	
			BoardVO bvo = new BoardVO();
			bvo.setTitle("TEST TITLE"+i);
			bvo.setWriter("TEST WRITER"+(int)(Math.random()*30)+1);
			bvo.setContent("TEST CONTENT"+i);
			bdao.insert(bvo);
		}
	}
}
