package org.gasan.domain;

import lombok.Data;

@Data
public class ScheduleVO { //영화 하나에 해당하는 스케쥴
	
//	private String startTime; //시작 시간
//	private String endTime; //마치는 시간
//	private String movieName; //영화제목
//	private String playDate; //상영 날짜
//	private int theaterNumber; //상영관번호
	
	private int theaterNumber; //상영관 번호(기본키)
	private String movieName;//영화제목
	private String movieCode;//+상영영화코드
	private String playDate;//상영 날짜
	private String startTime;//시작 시간
	private String endTime; //마치는 시간
	private int totalSeatCount; //총 좌석 갯수
	private int currentSeatCount; //현재 좌석 현황
	private String seatRow;//+좌석 행
	private int seatColumn;//+좌석 열

}
