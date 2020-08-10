package org.gasan.service;

import org.gasan.domain.SeatVO;
import org.gasan.domain.SelectedScheduleVO;
import org.springframework.ui.Model;

public interface SeatService {
	
	public void select(SelectedScheduleVO selectedScheduleVO, SeatVO seatVO);
	
	public void remove(SelectedScheduleVO selectedScheduleVO, SeatVO seatVO);
	

}
