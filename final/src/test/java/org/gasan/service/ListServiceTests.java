package org.gasan.service;

import java.util.ArrayList;
import java.util.List;

import org.gasan.controller.WebConnection;
import org.gasan.domain.MovieVO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ListServiceTests {

	@Test
	public void getMoiveListTest() {
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
				System.out.println(movieList.get(i).getMovieName());
			}
			
			log.info("getMovieListTest..............");
		} catch (Exception e) {
			log.info("WebConnection error");
		}
		
		
	}
}
