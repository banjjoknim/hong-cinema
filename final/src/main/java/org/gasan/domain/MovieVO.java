package org.gasan.domain;

import java.util.List;

import lombok.Data;

@Data
public class MovieVO {

	private String movieName; //영화제목
	private String genre; //장르
	private String director; //감독
	private String openDate; //개봉일
	private String showTime; //러닝타임
	private String nationName; //국가
	private List<String> actors; //배우 리스트
	
}
