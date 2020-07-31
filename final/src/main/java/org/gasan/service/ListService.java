package org.gasan.service;


import java.util.List;

import org.gasan.domain.DateVO;
import org.gasan.domain.MovieVO;
import org.gasan.domain.ScheduleVO;

public interface ListService {
	
	public List<MovieVO> getMovieList() throws Exception; //영화 리스트

	public List<MovieVO> getMovieListByDate(String date); //날짜별 상영하는 영화리스트
	
	public List<ScheduleVO> getScheduleByDate(String date);

	public List<ScheduleVO> getScheduleByMovie(String movieName); //영화별, 날짜별 상영시간표 리스트

	public List<DateVO> getDateList(); //현재 4월 25일로 설정해둔 상태 추후 매개변수 추가할 것, +15일까지 표시.
	
}
