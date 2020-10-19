package org.gasan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gasan.domain.ReplyVO;

public interface ReplyServiceMapper {

	public void write(@Param("replier") String replier, @Param("boardNumber") int boardNumber, @Param("comments") String comments);

	public void delete(@Param("replyNumber") int replyNumber);

	public void update(@Param("replyNumber") int replyNumber);
	
	public List<ReplyVO> getReplies(@Param("boardNumber") int boardNumber);
}
