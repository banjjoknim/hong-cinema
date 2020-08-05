package org.gasan.mapper;

import java.util.ArrayList;
import java.util.List;

import org.gasan.domain.ScheduleVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ListMapperTests {

	private ListMapper listMapper;


	@Test
	public void getScheduleByMovieTest() {//scheduleList는 이미 저장되어 있어야한다.

	}
}