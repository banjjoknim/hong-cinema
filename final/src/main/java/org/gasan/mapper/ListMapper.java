package org.gasan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gasan.domain.ScheduleVO;

public interface ListMapper {
	
	public List<ScheduleVO> getScheduleListAll();
	
	public List<ScheduleVO> getScheduleListByName(@Param("date") String date, @Param("movieName") String movieName);
	
	public List<ScheduleVO> getScheduleListByDate(@Param("date") String date, @Param("movieName") String movieName);
	

}
