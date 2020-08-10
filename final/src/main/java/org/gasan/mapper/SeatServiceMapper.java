package org.gasan.mapper;

import org.apache.ibatis.annotations.Param;
import org.gasan.domain.SeatVO;
import org.gasan.domain.SelectedScheduleVO;

public interface SeatServiceMapper {

	public void select(@Param("schedule") SelectedScheduleVO selectedScheduleVO, @Param("seat") SeatVO seatVO);


	public void delete(@Param("schedule") SelectedScheduleVO selectedScheduleVO, @Param("seat") SeatVO seatVO);
}
