package org.gasan.domain;

import lombok.Data;

@Data
public class ScheduleVO { //영화 하나에 해당하는 스케쥴
	
	private String startTime; //시작 시간
	private String endTime; //마치는 시간
	private String movieName; //영화제목
	private String playDate; //상영 날짜
	private int theaterNumber; //상영관번호

}
