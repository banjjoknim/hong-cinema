package org.gasan.service;

import java.util.List;

import org.gasan.domain.BoardVO;

public interface BoardService {

	public void write(BoardVO board);

	public void delete();

	public void update();
	
	public BoardVO read(int boardNumber);

	public List<BoardVO> getBoardList();

	public List<BoardVO> getBoardListByCategory(String category);

	public List<BoardVO> getBoardListByWriter(String userId);

	public List<BoardVO> getBoardListByDate(String date);

}
