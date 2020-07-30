package org.gasan.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.gasan.controller.WebConnection;
import org.gasan.domain.DateVO;
import org.gasan.domain.MovieVO;
import org.gasan.domain.ScheduleVO;
import org.gasan.mapper.ListMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ListServiceImpl implements ListService {
	
	ListMapper listMapper;

	@Override
	public List<MovieVO> getMovieList() throws Exception { //아무것도 선택하지 않은상태의 영화 리스트
			
	    log.info("getMovieList..............");
			
		ArrayList<MovieVO> movieList = new ArrayList<MovieVO>();

		Calendar cal = Calendar.getInstance();
		//시스템상의 날짜는 2020.04.25로 설정.
		cal.set(2020, 03, 25);
		WebConnection wc = new WebConnection();
		movieList = (ArrayList<MovieVO>) wc.parseBoxOffice(/* cal.getTime() */);
		
		return movieList;
	}

	@Override
	public List<DateVO> getDateList() { //예매가능 날짜 얻어오기.
		List<DateVO> dateList = new ArrayList<DateVO>();
		DateVO dateVO = null;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String[] dayOfWeek = new String[] {"일", "월", "화", "수", "목", "금", "토"};
		for(int i = 0; i<15; i++) {
			dateVO = new DateVO();
			cal.set(2020, 03, 25);
			cal.add(Calendar.DATE, +i);
			dateVO.setYear(cal.get(Calendar.YEAR));
			dateVO.setMonth(cal.get(Calendar.MONTH)+1);
			dateVO.setDay(cal.get(Calendar.DATE));
			dateVO.setDayOfWeek(dayOfWeek[cal.get(Calendar.DAY_OF_WEEK)-1]);
			dateList.add(dateVO);
		}
		
		return dateList;
	}

	@Override
	public List<MovieVO> getMovieListByDate(String date) {
		return null;
	}

	@Override
	public List<ScheduleVO> getScheduleByMovie(String movieName, String date) { //특정날짜에 영화제목 선택시 상영시간표 얻어옴.
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>(); //scheduleList는 이미 저장되어 있어야한다.
//		scheduleList = listMapper.getScheduleList();
//		MovieVO movieVO = new MovieVO();
//		movieVO.setMovieName(movieName);
		for(int i = 0; i< scheduleList.size(); i++) {
			if(movieName.equals(scheduleList.get(i).getMovieName())) {
				ScheduleVO scheduleVO = new ScheduleVO();
				scheduleVO.setMovieName(movieName);
				scheduleVO.setStartTime("17:10");
				scheduleVO.setEndTime("19:12");
				scheduleVO.setDate(date);
				scheduleList.add(scheduleVO);
			}
		}
		return null;
	}


}
