package org.gasan.service;

import java.util.List;

import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SeatVO;
import org.gasan.domain.SelectedScheduleVO;

public interface SeatService {
	
	public void reserve(SelectedScheduleVO selectedScheduleVO, SeatVO seatVO);
	
	public void reserveCancel(SelectedScheduleVO selectedScheduleVO, SeatVO seatVO);
	
	public void preventReservation(SeatReservationVO seatReservationVO);
}
