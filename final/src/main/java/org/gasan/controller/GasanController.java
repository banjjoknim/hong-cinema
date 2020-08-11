package org.gasan.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.gasan.domain.DateVO;
import org.gasan.domain.MovieVO;
import org.gasan.domain.ScheduleVO;
import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SelectedScheduleVO;
import org.gasan.service.ListService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/*")
@Log4j
@AllArgsConstructor
public class GasanController {

	private ListService listService;

	@GetMapping(value = "/movieList/{date}") 
	public String getAllListBySelectedDate(@PathVariable("date") String date, Model model) throws Exception { //영화리스트를 얻어온다.
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		//Calendar cal = Calendar.getInstance();
		//cal.set(2020 , 06 , 20);
		//log.info("Calendar : "+cal.getTime());
		log.info("getAllList ..... movieList");

		List<MovieVO> movieList = new ArrayList<MovieVO>(); //영화 리스트(미선택)
		movieList = listService.getMovieList(sdf.parse(date));
		model.addAttribute("movieList", movieList);

		//		--------------------------------------------------------------------

		log.info("getAllList ....... dateList");
		String month = null;
		String day = null;
		List<DateVO> dateList = new ArrayList<DateVO>(); //날짜 리스트(현재날짜)
		dateList = listService.getDateList(sdf.parse(date));
		if(dateList.get(0).getMonth()<10) {
			 month = "0"+dateList.get(0).getMonth();
		} else {
			month = Integer.toString(dateList.get(0).getMonth());
		}
		if(dateList.get(0).getDay()<10) {
			day = "0"+dateList.get(0).getDay();
		} else {
			day = Integer.toString(dateList.get(0).getDay());
		}
		
		model.addAttribute("today", Integer.toString(dateList.get(0).getYear())+
				month+day);
		model.addAttribute("dateList", dateList);

		//		--------------------------------------------------------------------

		log.info("getAllList ....... scheduleList");

		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>(); //현재날짜 기준 상영시간표 리스트
		scheduleList = listService.getScheduleListByDate(sdf.parse(date));
		model.addAttribute("scheduleList", scheduleList);

		return "movieList";
	}
	
	


	@PostMapping("/seatList")
	public String getSeatList(SelectedScheduleVO selectedScheduleVO, HttpSession session, Model model) {

		model.addAttribute("schedule", selectedScheduleVO);
		session.setAttribute("movie", selectedScheduleVO);
		

		log.info("getList .............. seatList");
		log.info(selectedScheduleVO);

		return "seatList";
	}

	@PostMapping("/payment")
	public String getPayment(SeatReservationVO seatReservationVO, HttpSession session, Model model) {

		model.addAttribute("seatReservation", seatReservationVO);
		log.info("payment");
		log.info(seatReservationVO);
		log.info(session.getAttribute("movie"));

		return "payment";
	}
	
	@GetMapping("/ajax") //ajax 연습용
	public String getAjax() {
		
		log.info("ajax");
		
		return "ajax";
	}
	
	@GetMapping("/index") //페이지 기능 동작 확인용
	public String index() {
		
		return "index";
	}

}
