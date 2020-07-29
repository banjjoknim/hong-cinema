package org.gasan.domain;

import java.util.List;

import lombok.Data;

@Data
public class MovieVO {

	private String movieName;
	private String genre;
	private String director;
	private String openDate;
	private String showTime;
	private String nationName;
	private List<String> actors;
	
}
