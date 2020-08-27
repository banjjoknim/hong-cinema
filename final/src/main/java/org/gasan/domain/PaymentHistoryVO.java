package org.gasan.domain;

import lombok.Data;

@Data
public class PaymentHistoryVO {
	private String paymentNumber;
	private String movieName;
	private int theaterNumber;
	private String playDate;
	private String payDate;
	private int adultType;
	private int youthType;
	private int preferentialType;
	private int totalPeople;
	private String seatList;
	private int payAmount;
	private String poster;
	private String cancelable;
	
}
