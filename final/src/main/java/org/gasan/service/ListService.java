package org.gasan.service;

import java.util.List;

import org.gasan.domain.MovieVO;
import org.gasan.domain.TheaterVO;
import org.gasan.domain.TimeTableVO;
import org.springframework.ui.Model;

public interface ListService {
	
	public List<TheaterVO> getTheaterList();
	
	public List<MovieVO> getMovieList();

	public List<MovieVO> getMovieListByDate(TheaterVO theater, String date); //날짜별 상영하는 영화리스트

	public List<MovieVO> getMovieListByTheater(TheaterVO theater); //영화관별 영화리스트

	public List<TimeTableVO> getTimeTableByMovie(TheaterVO theater, MovieVO movieName); //영화별 상영시간표 리스트

	public List<TheaterVO> getTheaterListByMovie(MovieVO movieName); //해당 영화 상영극장 리스트
	
}
