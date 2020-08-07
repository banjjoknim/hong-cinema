package org.gasan.service;

import javax.servlet.http.HttpServletRequest;

public interface InfoService {

	public String getMovieName(String movieName);
	
	public String getTheaterCode();
	
	public String getStartTime();
	
	public String getEndTime();
}
