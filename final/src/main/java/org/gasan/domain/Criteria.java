package org.gasan.domain;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;
	private int amount;
	private int startPageNum;
	private int endPageNum;
	
	public Criteria(int pageNum, int amount, int startPageNum, int endPageNum) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.startPageNum = startPageNum;
		this.endPageNum = endPageNum;
	}
	
	
	
	
}
