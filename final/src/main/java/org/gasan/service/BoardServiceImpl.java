package org.gasan.service;

import java.util.List;

import org.gasan.domain.BoardVO;
import org.gasan.mapper.BoardServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired )
	private BoardServiceMapper boardServiceMapper;

	@Override
	public void write(BoardVO board) {
		boardServiceMapper.write("userId", board.getCategory(), board.getTitle(), board.getContents());
	}

	@Override
	public void delete() {
		boardServiceMapper.delete(1);
	}

	@Override
	public void update() {
		
	}

	@Override
	public List<BoardVO> getBoardList() {
		
		List<BoardVO> boards = boardServiceMapper.getBoardList();
		log.info("getBoardList");
		log.info(boards);
		
		return boards;
		
	}

	@Override
	public List<BoardVO> getBoardListByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> getBoardListByWriter(String writer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> getBoardListByDate(String date) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO read(int boardNumber) {
		
		log.info("read.....");
		
		BoardVO board = boardServiceMapper.read(boardNumber);
		
		return board;
	}


}
