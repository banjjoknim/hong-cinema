package org.gasan.service;

import java.util.ArrayList;
import java.util.List;

import org.gasan.controller.WebConnection;
import org.gasan.domain.MovieVO;
import org.gasan.domain.TheaterVO;
import org.gasan.domain.TimeTableVO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ListServiceImpl implements ListService {

	@Override
	public List<MovieVO> getMovieListByDate(TheaterVO theater, String date) {
		
		log.info("get movie list by date" + date);
		return null;
	}

	@Override
	public List<MovieVO> getMovieListByTheater(TheaterVO theater) {
		
		log.info("get movie list by theater" + theater);
		return null;
	}

	@Override
	public List<TimeTableVO> getTimeTableByMovie(TheaterVO theater, MovieVO movieName) {
		
		log.info("get timeTable by movie" + movieName);
		return null;
	}

	@Override
	public List<TheaterVO> getTheaterListByMovie(MovieVO movieName) {
		
		log.info("get theater list by movie" + movieName);
		return null;
	}

	@Override
	public List<TheaterVO> getTheaterList() {
		return null;
	}

	@Override
	public List<MovieVO> getMovieList() {
		ArrayList<MovieVO> movieList = new ArrayList<MovieVO>();
		MovieVO movieVO = new MovieVO();
		try {
			
			WebConnection wc = new WebConnection();
			JSONParser parser = new JSONParser();
			JSONObject obj = new JSONObject();
			obj = (JSONObject) parser.parse(wc.json);
//			System.out.println(obj.get("boxOfficeResult"));
			JSONObject boxOfficeResult = (JSONObject) obj.get("boxOfficeResult");
			JSONArray array = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");
			
			for(int i = 0; i< array.size(); i++) {
				JSONObject movie = (JSONObject) array.get(i);
				movieVO.setMovieName((String)movie.get("movieNm"));
				movieVO.setOpenDate((String)movie.get("openDt"));
				movieList.add(movieVO);
//				System.out.println(i+1+"번째 영화 : "+movie.get("movieNm")+
//						" 개봉일 : "+movie.get("openDt"));
			}
			
			log.info("getMovieListTest..............");
		} catch (Exception e) {
			log.info("WebConnection error");
		}
		return movieList;
	}

}
