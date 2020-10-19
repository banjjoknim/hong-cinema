package org.gasan.service;

import java.security.Principal;
import java.util.List;

import org.gasan.domain.ReplyVO;

public interface ReplyService {

	public void write(Principal principal, int boardNumber, String comments);

	public void delete(Principal principal, ReplyVO reply);

	public void update(Principal principal, ReplyVO reply);
	
	public List<ReplyVO> getReplies(int boardNumber);
}
