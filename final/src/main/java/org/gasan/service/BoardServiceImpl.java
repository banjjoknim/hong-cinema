package org.gasan.service;

import java.security.Principal;
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
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardServiceMapper boardServiceMapper;

	@Override
	public void write(BoardVO board, Principal principal) {
		boardServiceMapper.write(principal.getName(), board.getCategory(), board.getTitle(), board.getContents());
	}

	@Override
	public void delete(BoardVO board, Principal principal) {
		if (principal.getName().equals(board.getWriter())) {
			boardServiceMapper.delete(board.getBoardNumber());
		}
	}

	@Override
	public void update(BoardVO board, Principal principal) {
		if (principal.getName().contentEquals(board.getWriter())) {
			boardServiceMapper.update(board.getBoardNumber(), board.getContents());
		}
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

		log.info("listByCategory...........");

		return boardServiceMapper.getBoardListByCategory(category);
	}

	@Override
	public List<BoardVO> getBoardListByWriter(String writer) {

		log.info("listByCategory...........");

		return boardServiceMapper.getBoardListByWriter(writer);
	}

	@Override
	public List<BoardVO> getBoardListByDate(String date) {

		log.info("listByCategory...........");

		return boardServiceMapper.getBoardListByDate(date);
	}

	@Override
	public BoardVO read(int boardNumber) {

		log.info("read.....");

		BoardVO board = boardServiceMapper.read(boardNumber);
		
		return board;
	}

	@Override
	public void hit(int boardNumber) {
		
		BoardVO board = boardServiceMapper.read(boardNumber);
		boardServiceMapper.hit(boardNumber, board.getHit() + 1);
		
	}

	@Override
	public List<BoardVO> getReviewBoardList() {
		
		return boardServiceMapper.getReviewBoardList();
	}

	@Override
	public List<BoardVO> getRecommandBoardList() {
		
		return boardServiceMapper.getRecommandBoardList();
	}

	@Override
	public List<BoardVO> getTalkBoardList() {
		
		return boardServiceMapper.getTalkBoardList();
	}

}
