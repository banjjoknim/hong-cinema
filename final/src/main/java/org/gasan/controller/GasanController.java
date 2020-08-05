package org.gasan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.gasan.domain.DateVO;
import org.gasan.domain.MovieVO;
import org.gasan.domain.ScheduleVO;
import org.gasan.service.ListService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

		log.info("getAllList ..... movieList");

		List<MovieVO> movieList = new ArrayList<MovieVO>(); //영화 리스트(미선택)
		movieList = listService.getMovieList();
		model.addAttribute("movieList", movieList);

		//		--------------------------------------------------------------------

		log.info("getAllList ....... dateList");

		List<DateVO> dateList = new ArrayList<DateVO>(); //날짜 리스트(현재날짜)
		dateList = listService.getDateList();
		model.addAttribute("today", Integer.toString(dateList.get(0).getYear())+
				Integer.toString(dateList.get(0).getMonth())+Integer.toString(dateList.get(0).getDay()));
		model.addAttribute("dateList", dateList);

		//		--------------------------------------------------------------------

		log.info("getAllList ....... scheduleList");

		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>(); //현재날짜 기준 상영시간표 리스트
		scheduleList = listService.getScheduleListByDate(date);
		model.addAttribute("scheduleList", scheduleList);

		return "movieList";
	}
	
	@GetMapping(value= "/movieList/{date}/{movieName}")
	public String getScheduleListBySelectedAll(@PathVariable("date") String date, @PathVariable("movieName") String movieName, Model model) throws Exception {
		
		log.info("get ....... movieList");
		
		List<MovieVO> movieList = new ArrayList<MovieVO>(); //영화 리스트(미선택)
		movieList = listService.getMovieList();
		model.addAttribute("movieList", movieList);
		
		//---------------------------------------------------
		
		log.info("get ....... dateList");
		
		List<DateVO> dateList = new ArrayList<DateVO>(); //날짜 리스트(현재날짜기준)
		dateList = listService.getDateList();
		model.addAttribute("today", Integer.toString(dateList.get(0).getYear())+
				Integer.toString(dateList.get(0).getMonth())+Integer.toString(dateList.get(0).getDay()));
		model.addAttribute("dateList", dateList);

		//		--------------------------------------------------------------------
		
		log.info("get ....... scheduleList");

		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>(); //현재날짜 기준 상영시간표 리스트
		scheduleList = listService.getScheduleListByAll(date, movieName);
		model.addAttribute("scheduleList", scheduleList);
		
		
		return "movieList";
		
	}
	


	@GetMapping("/seatList")
	public String getSeatList() {

		log.info("seatList");

		return "seatList";
	}

	@GetMapping("/payment")
	public String getPayment() {

		log.info("payment");

		return "payment";
	}
	
	@GetMapping("/ajax")
	public String getAjax() {
		
		log.info("ajax");
		
		return "ajax";
	}

}
