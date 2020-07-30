package org.gasan.domain;

import java.util.List;

import lombok.Data;

@Data
public class TheaterVO { //상영관 하나가 갖고 있는 정보.

	private int theaterNumber; //상영관 번호
	private int currentSeat; //현재 좌석 현황
	private List<ScheduleVO> timeTable; //상영관에 해당하는 상영시간표 => 영화, 시작시간, 마치는시간, 날짜
}
