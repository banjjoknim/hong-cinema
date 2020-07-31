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
	
	@GetMapping("/movieList") 
	public String getAllList(Model model) throws Exception { //영화리스트를 얻어온다.
		
		log.info("getAllList ..... movieList");
		
		List<MovieVO> movieList = new ArrayList<MovieVO>(); //영화 리스트
        movieList = listService.getMovieList();
		model.addAttribute("movieList", movieList);
		
//		--------------------------------------------------------------------
		
		log.info("getAllList ....... dateList");
		
		List<DateVO> dateList = new ArrayList<DateVO>(); //날짜 리스트
		dateList = listService.getDateList();
		model.addAttribute("dateList", dateList);
		
//		--------------------------------------------------------------------
		
		return "movieList";
	}
	
	@GetMapping("/scheduleListByTitle")
	public String getMovieListByTitle(@RequestParam("movieTitle") String title, Model model) throws Exception {
		
        log.info("get ..... movieList");
		
		List<MovieVO> movieList = new ArrayList<MovieVO>(); //영화 리스트
        movieList = listService.getMovieList();
		model.addAttribute("movieList", movieList);
		
//		--------------------------------------------------------------------
		
		log.info("get ....... dateList");
		
		List<DateVO> dateList = new ArrayList<DateVO>(); //날짜 리스트
		dateList = listService.getDateList();
		model.addAttribute("dateList", dateList);
		
//		--------------------------------------------------------------------
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>(); //상영시간표 리스트
		scheduleList = listService.getScheduleByMovie(title);
		model.addAttribute("scheduleList", scheduleList);
		
		return "scheduleListByTitle";
	}
	
	@GetMapping("/scheduleListByDate")
	public String getScheduleListByDate() {
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
//		scheduleList = listService
		
		return "scheduleListByDate";
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
	
}
