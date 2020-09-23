package org.gasan.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.gasan.domain.BoardVO;
import org.gasan.domain.Criteria;
import org.gasan.service.BoardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/*")
@Log4j
@AllArgsConstructor
public class BoardController {

	private BoardService boardService;

	@GetMapping(value = "/board/boardList/total/{pageNum}")
	public String totalBoard(Model model, @PathVariable("pageNum") int pageNum) {

		log.info("boardList.....");
		Criteria criteria = new Criteria(pageNum, 10, 1 + ((pageNum - 1) / 10) * 10, ((pageNum - 1) / 10) * 10 + 10);
		List<BoardVO> boards = new ArrayList<BoardVO>();
		boards = boardService.getBoardList();
		model.addAttribute("boards", boards);
		model.addAttribute("criteria", criteria);

		log.info(criteria);

		return "/board/boardList";
	}
	
	@GetMapping(value = "/board/boardList/review/{pageNum}")
	public String reviewBoard(Model model, @PathVariable("pageNum") int pageNum) {

		log.info("boardList.....");
		Criteria criteria = new Criteria(pageNum, 10, 1 + ((pageNum - 1) / 10) * 10, ((pageNum - 1) / 10) * 10 + 10);
		List<BoardVO> boards = new ArrayList<BoardVO>();
		boards = boardService.getReviewBoardList();
		model.addAttribute("boards", boards);
		model.addAttribute("criteria", criteria);

		log.info(criteria);

		return "/board/boardListReview";
	}
	
	@GetMapping(value = "/board/boardList/recommand/{pageNum}")
	public String recommandBoard(Model model, @PathVariable("pageNum") int pageNum) {

		log.info("boardList.....");
		Criteria criteria = new Criteria(pageNum, 10, 1 + ((pageNum - 1) / 10) * 10, ((pageNum - 1) / 10) * 10 + 10);
		List<BoardVO> boards = new ArrayList<BoardVO>();
		boards = boardService.getRecommandBoardList();
		model.addAttribute("boards", boards);
		model.addAttribute("criteria", criteria);

		log.info(criteria);

		return "/board/boardListRecommand";
	}
	
	@GetMapping(value = "/board/boardList/talk/{pageNum}")
	public String talkBoard(Model model, @PathVariable("pageNum") int pageNum) {

		log.info("boardList.....");
		Criteria criteria = new Criteria(pageNum, 10, 1 + ((pageNum - 1) / 10) * 10, ((pageNum - 1) / 10) * 10 + 10);
		List<BoardVO> boards = new ArrayList<BoardVO>();
		boards = boardService.getTalkBoardList();
		model.addAttribute("boards", boards);
		model.addAttribute("criteria", criteria);

		log.info(criteria);

		return "/board/boardListTalk";
	}
	

	@GetMapping(value = "/getBoardList")
	public ResponseEntity<List<BoardVO>> getBoardList() {

		List<BoardVO> boardList = boardService.getBoardList();
		
		return new ResponseEntity<>(boardList, HttpStatus.OK);
	}

	@GetMapping(value = "/board/boardList/{boardNumber}", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<BoardVO> getBoardByNumber(@PathVariable int boardNumber) {

		boardService.hit(boardNumber);

		return new ResponseEntity<>(boardService.read(boardNumber), HttpStatus.OK);
	}

	@GetMapping(value = "/board/write")
	public String startWriting() {
		return "/board/write";
	}

	@PostMapping(value = "/write.do")
	public String writingComplete(BoardVO board, Principal principal) {

		log.info("writing......");

		boardService.write(board, principal);

		return "redirect:/board/boardList/total/1";
	}

	@GetMapping(value = "/board/read")
	public String readingBoard() {

		log.info("reading.......");

		return "/board/read";
	}

	@GetMapping(value = "/board/modify/{boardNumber}", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<BoardVO> updateBoard(@PathVariable("boardNumber") int boardNumber) {

		return new ResponseEntity<>(boardService.read(boardNumber), HttpStatus.OK);
	}

	@GetMapping(value = "/board/modify")
	public String modifyPage() {

		return "/board/modify";
	}

	@GetMapping(value = "/getBoardList/{category}")
	@ResponseBody
	public ResponseEntity<List<BoardVO>> getBoardListByCategory(@PathVariable("category") String category) {
		if ("review".equals(category)) {
			category = "영화 리뷰";
		}
		if ("recommand".equals(category)) {
			category = "영화 추천";
		}
		if("talk".equals(category)) {
			category = "잡담";
		}

		return new ResponseEntity<>(boardService.getBoardListByCategory(category), HttpStatus.OK);
	}

	@PostMapping(value = "/modify.do")
	public String modifyComplete(BoardVO board, Principal principal) {

		boardService.update(board, principal);

		return "redirect:/board/boardList";
	}

	@PostMapping(value = "/delete.do")
	public String delete(BoardVO board, Principal principal) {

		boardService.delete(board, principal);

		return "redirect:/board/boardList";
	}
	
	@GetMapping(value = "/board/search.do")
	@ResponseBody
	public ResponseEntity<BoardVO> searchBoard(){
		
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
