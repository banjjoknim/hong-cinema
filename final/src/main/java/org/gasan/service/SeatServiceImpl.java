package org.gasan.service;

import java.util.ArrayList;
import java.util.List;

import org.gasan.domain.SeatVO;
import org.gasan.domain.SelectedScheduleVO;
import org.gasan.mapper.SeatServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;

public class SeatServiceImpl implements SeatService {

	@Setter(onMethod_ = @Autowired)
	private SeatServiceMapper seatServiceMapper;
	
	@Override
	public void select(SelectedScheduleVO selectedScheduleVO, SeatVO seatVO) {
		List<SeatVO> selectedSeatList = new ArrayList<SeatVO>();
		SeatVO seat = new SeatVO();
		seat.setScheduleCode(selectedScheduleVO.getSelectedScheduleCode());
		seat.setTheaterCode(selectedScheduleVO.getSelectedTheaterNumber());
		seat.setEnabled(false);
		seat.setSeatRow(seatVO.getSeatRow());
		seat.setSeatColumn(seatVO.getSeatColumn());
		selectedSeatList.add(seat);
		seatServiceMapper.select(selectedScheduleVO, seatVO);
	}

	@Override
	public void remove(SelectedScheduleVO selectedScheduleVO, SeatVO seatVO) {
		List<SeatVO> selectedSeatList = new ArrayList<SeatVO>();
		seatVO.setEnabled(true);
		selectedSeatList.remove(seatVO);
	}



}
