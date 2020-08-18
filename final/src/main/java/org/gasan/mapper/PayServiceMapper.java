package org.gasan.mapper;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SelectedScheduleVO;

public interface PayServiceMapper {

	public void registPaymentHistory(@Param("userId") String userId, @Param("schedule") SelectedScheduleVO selectedScheduleVO,
			@Param("seat") SeatReservationVO seatReservationVO, @Param("seatList") String seatList);
}
