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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ListServiceImpl implements ListService {

	@Setter(onMethod_ = @Autowired)
	private ListMapper listMapper;

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
	public List<ScheduleVO> getScheduleByMovie(String movieName) { //특정날짜에 영화제목 선택시 상영시간표 얻어옴.
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>(); //scheduleList는 이미 저장되어 있어야한다.
		List<ScheduleVO> listFromDB = listMapper.getScheduleListByMovie();
		for(int i = 0; i< listFromDB.size(); i++) {

				if(movieName.equals(listFromDB.get(i).getMovieName())) {
					ScheduleVO scheduleVO = new ScheduleVO();
					scheduleVO.setMovieName(movieName);
					scheduleVO.setStartTime(listFromDB.get(i).getStartTime());
					scheduleVO.setEndTime(listFromDB.get(i).getEndTime());
					scheduleVO.setTheaterNumber(listFromDB.get(i).getTheaterNumber());
					scheduleList.add(scheduleVO);
				}
			}
		return scheduleList;
	}

	@Override
	public List<ScheduleVO> getScheduleByDate(String date) { //날짜만 선택한 상태에서 상영중인 영화리스트 얻어옴.
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
		List<ScheduleVO> listFromDB = listMapper.getScheduleListByDate();
		
		
		return scheduleList;
	}


}
