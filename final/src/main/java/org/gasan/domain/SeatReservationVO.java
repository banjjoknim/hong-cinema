package org.gasan.domain;

import java.util.List;

import lombok.Data;

@Data
public class SeatReservationVO {

	private int adultType;
	private int youthType;
	private int preferentialType;
	private int totalPeople;
	private int payAmount;
	private List<String> selectedSeatList;
	
}
