package org.gasan.domain;

import lombok.Data;

@Data
public class ReplyVO {
	private int replyNumber;
	private int repliedBoardNumber;
	private String replier;
	private String replied_Time;
	private String comments;
}
