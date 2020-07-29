package org.gasan.controller;

import java.util.ArrayList;
import java.util.List;

import org.gasan.domain.MovieVO;
import org.gasan.service.ListService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/*")
@Log4j
@AllArgsConstructor
public class GasanController {

	private ListService listService;
	
	@GetMapping("/movieList")
	public String getMovieList(Model model) {
		
		List<MovieVO> movieList = new ArrayList<MovieVO>(); 
        movieList = listService.getMovieList();
		model.addAttribute("movieList", movieList);
		
		log.info("get ..... movieList");
		
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
}
