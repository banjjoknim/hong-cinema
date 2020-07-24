package org.gasan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/*")
@Log4j
@AllArgsConstructor
public class GasanController {

	
	@GetMapping("/movieList")
	public String getMovieList() {
		
		log.info("movieList");
		
		return "movieList";
	}
	
	@GetMapping("/seatList")
	public String getSeatList() {
		
		log.info("seatList");
		
		return "seatList";
	}
}
