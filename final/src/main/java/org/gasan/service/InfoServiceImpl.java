package org.gasan.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class InfoServiceImpl implements InfoService {

	@Override
	public String getMovieName(String movieName) {
		
		return movieName;
	}                                                                                                                                                                                                                                                                                                                                                                                              

	@Override
	public String getTheaterCode() {
		return null;
	}

	@Override
	public String getStartTime() {
		return null;
	}

	@Override
	public String getEndTime() {
		return null;
	}

}
