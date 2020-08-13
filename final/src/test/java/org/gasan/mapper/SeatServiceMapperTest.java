package org.gasan.mapper;

import org.gasan.domain.SeatVO;
import org.gasan.domain.SelectedScheduleVO;
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
public class SeatServiceMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private SeatServiceMapper mapper;
	

	@Test
	public void selectTest() {
//		mapper.select();
		SelectedScheduleVO selectedScheduleVO = new SelectedScheduleVO();
		selectedScheduleVO.setSelectedTheaterNumber(1);
		selectedScheduleVO.setSelectedScheduleCode(1);
		SeatVO seatVO = new SeatVO();
		seatVO.setSeat("A1");
		mapper.select(selectedScheduleVO, seatVO);
	}
	
	@Test
	public void deleteTest() {
//		mapper.delete();
		SelectedScheduleVO selectedScheduleVO = new SelectedScheduleVO();
		selectedScheduleVO.setSelectedTheaterNumber(1);
		selectedScheduleVO.setSelectedScheduleCode(1);
		SeatVO seatVO = new SeatVO();
		seatVO.setSeat("A1");
		mapper.delete(selectedScheduleVO, seatVO);
	}
	
	@Test
	public void showTotalSeatTest() {
		mapper.showRemainedSeat(1);
	}
	
	@Test
	public void showRemainedSeatTest() {
		mapper.showRemainedSeat(1);
	}
	
	@Test
	public void preventTest() {
	}
	
}
