package org.gasan.controller;

import java.util.List;

import org.gasan.domain.ScheduleVO;
import org.gasan.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

	@GetMapping("/getScheduleByDate/{date}") //날짜별로 스케쥴표 얻어옴(기본값)
	public ResponseEntity<List<ScheduleVO>> getScheduleByDate(@PathVariable("date") String date) {
		
		return new ResponseEntity<>(listService.getScheduleListByDate(date), HttpStatus.OK);
	}
	
	@GetMapping("/getScheduleByAll/{date}/{movieName}") //날짜와 영화 모두 선택시 스케쥴표 얻어옴
	public ResponseEntity<List<ScheduleVO>> getScheduleByAll(@PathVariable("date") String date, @PathVariable("movieName") String movieName) {
		
		return new ResponseEntity<>(listService.getScheduleListByAll(date, movieName), HttpStatus.OK);
	}
	
	@GetMapping("/getScheduleByName/{movieName}") //영화만 선택시 스케쥴표 얻어옴
	public ResponseEntity<List<ScheduleVO>> getScheduleByName(@PathVariable("movieName") String movieName) {
		
		return new ResponseEntity<>(listService.getScheduleListByName(movieName), HttpStatus.OK);
	}
}