package org.gasan.service;

import java.security.Principal;
import java.util.List;

import org.gasan.domain.BoardVO;
import org.gasan.domain.ReplyVO;
import org.gasan.mapper.ReplyServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyServiceMapper replyServiceMapper;

	@Override
	public void write(Principal principal, int boardNumber, String comments) {
		replyServiceMapper.write(principal.getName(), boardNumber, comments);
	}

	@Override
	public void delete(Principal principal, ReplyVO reply) {
		if (principal.getName().equals(reply.getReplier())) {
			replyServiceMapper.delete(reply.getReplyNumber());
		}
	}

	@Override
	public void update(Principal principal, ReplyVO reply) {
		if (principal.getName().equals(reply.getReplier())) {
			replyServiceMapper.update(reply.getReplyNumber());
		}
	}

	@Override
	public List<ReplyVO> getReplies(int boardNumber) {
		return replyServiceMapper.getReplies(boardNumber);
	}

}
