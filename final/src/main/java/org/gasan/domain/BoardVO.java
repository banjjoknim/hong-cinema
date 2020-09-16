package org.gasan.domain;

import lombok.Data;

@Data
public class BoardVO {

	private int boardNumber;
	private String category;
	private String title;
	private String writer;
	private String writeDate;
	private String updateDate;
	private String contents;
	private int hit;
}
