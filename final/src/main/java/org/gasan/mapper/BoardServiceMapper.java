package org.gasan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gasan.domain.BoardVO;

public interface BoardServiceMapper {
	
	public void write(@Param("writer") String userId, @Param("category") String category, @Param("title") String title, @Param("contents") String contents);
	
	public void delete(@Param("boardNumber") int boardNumber);
	
	public void update(@Param("boardNumber") int boardNumber, @Param("newTitle") String newTitle, @Param("contents") String contents, @Param("updateDate") String updateDate);
	
	public BoardVO read(@Param("boardNumber") int boardNumber);
	
	public List<BoardVO> getBoardList();
	
	public List<BoardVO> getBoardListByCategory(@Param("category") String category);
	
	public List<BoardVO> getBoardListByWriter(@Param("writer") String writer);
	
	public List<BoardVO> getBoardListByDate(@Param("date") String date);
}
	
