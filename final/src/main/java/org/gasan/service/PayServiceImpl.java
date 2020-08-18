package org.gasan.service;

import javax.servlet.http.HttpSession;

import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SelectedScheduleVO;
import org.gasan.mapper.PayServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PayServiceImpl implements PayService {
	
	@Setter(onMethod_ = @Autowired)
	private PayServiceMapper payServiceMapper;

	@Override
	public void pay(SelectedScheduleVO selectedScheduleVO, SeatReservationVO seatReservationVO, String seatList) {
		payServiceMapper.registPaymentHistory("userId", selectedScheduleVO, seatReservationVO, seatList);
	}

}