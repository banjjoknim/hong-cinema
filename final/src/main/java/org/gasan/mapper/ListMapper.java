package org.gasan.mapper;

import java.util.List;

import org.gasan.domain.ScheduleVO;

import lombok.AllArgsConstructor;

public interface ListMapper {
	
	public List<ScheduleVO> getScheduleListByMovie();
	
	public List<ScheduleVO> getScheduleListByDate();

}
