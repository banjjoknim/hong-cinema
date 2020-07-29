package org.gasan.domain;

import java.util.List;

import lombok.Data;

@Data
public class TheaterVO {

	private String theaterName; //영화관 이름
	private List<String> movieList; //상영 영화 리스트
	private List<String> timeTable; //상영시간 리스트
	private String location; //위치?
}
