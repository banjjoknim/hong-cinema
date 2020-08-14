package org.gasan.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.gasan.domain.MovieVO;
import org.gasan.domain.ScheduleVO;
import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SeatVO;
import org.gasan.mapper.SeatServiceMapper;
import org.gasan.service.ListService;
import org.gasan.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/*")
@Log4j
public class AjaxController {
	@Setter(onMethod_ = @Autowired)
	private ListService listService;
	
	@Setter(onMethod_ = @Autowired)
	private SeatServiceMapper seatServiceMapper;
	
	@Setter(onMethod_ = @Autowired)
	private SeatService seatService;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	@GetMapping("/getScheduleByDate/{date}") //날짜별로 스케쥴표 얻어옴(기본값)
	public ResponseEntity<List<ScheduleVO>> getScheduleByDate(@PathVariable("date") String date) throws ParseException {
		
		return new ResponseEntity<>(listService.getScheduleListByDate(sdf.parse(date)), HttpStatus.OK);
	}
	
	@GetMapping("/getScheduleByAll/{date}/{movieName}") //날짜와 영화 모두 선택시 스케쥴표 얻어옴
	public ResponseEntity<List<ScheduleVO>> getScheduleByAll(@PathVariable("date") String date, @PathVariable("movieName") String movieName) throws ParseException {
		
		return new ResponseEntity<>(listService.getScheduleListByAll(sdf.parse(date), movieName), HttpStatus.OK);
	}
	
	@GetMapping("/getScheduleByName/{movieName}") //영화만 선택시 스케쥴표 얻어옴
	public ResponseEntity<List<ScheduleVO>> getScheduleByName(@PathVariable("movieName") String movieName) {
		
		return new ResponseEntity<>(listService.getScheduleListByName(movieName), HttpStatus.OK);
	}
	
	@GetMapping("/getMovieByDate/{date}")
	public ResponseEntity<List<MovieVO>> getMovieByDate(@PathVariable("date") String date) throws Exception{
		
		return new ResponseEntity<>(new ParseByDate().getMovieByDate(date), HttpStatus.OK);
	}
	
	@GetMapping("/getRemainedSeatCount/{scheduleCode}")
	public ResponseEntity<Integer> getRemainedSeatCount(@PathVariable("scheduleCode") int scheduleCode) {
		
		return new ResponseEntity<>(seatServiceMapper.showRemainedSeat(scheduleCode), HttpStatus.OK);
	}
	
	@GetMapping("/getEnabledSeatList/{scheduleCode}")
	public ResponseEntity<List<SeatVO>> getEnabledSeat(@PathVariable("scheduleCode") int scheduleCode) {
		
		return new ResponseEntity<>(seatServiceMapper.showEnabledSeat(scheduleCode), HttpStatus.OK);
	}
	
	@GetMapping("/reservationCancel")
	public void reservationCancel(HttpSession session, Model model) throws Exception {
		
		log.info("cancel.................................");
		log.info(session.getAttribute("seatReservation"));
		
		seatService.reserveCancel((SeatReservationVO) session.getAttribute("seatReservation"));
		
		session.removeAttribute("seatReservation");
		session.removeAttribute("movie");
		session.removeAttribute("scheduleCode");

	}
	
}
