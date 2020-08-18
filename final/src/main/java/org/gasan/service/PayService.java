package org.gasan.service;

import javax.servlet.http.HttpSession;

import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SelectedScheduleVO;

public interface PayService {
	
	public void pay(SelectedScheduleVO selectedScheduleVO, SeatReservationVO seatReservationVO, String seatList);

}
