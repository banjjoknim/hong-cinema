package org.gasan.service;

import java.security.Principal;
import java.util.List;

import org.gasan.domain.BoardVO;

public interface BoardService {

	public void write(BoardVO board, Principal principal);

	public void delete(BoardVO board, Principal principal);

	public void update(BoardVO board, Principal principal);
	
	public BoardVO read(int boardNumber);

	public List<BoardVO> getBoardList();

	public List<BoardVO> getBoardListByCategory(String category);

	public List<BoardVO> getBoardListByWriter(String userId);

	public List<BoardVO> getBoardListByDate(String date);

}
