package org.gasan.controller;

import java.util.ArrayList;
import java.util.List;

import org.gasan.domain.BoardVO;
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

	@GetMapping(value = "/board/write")
	public String startWriting() {
		return "/board/write";
	}

	@GetMapping(value = "/board/boardList")
	public String board(Model model) {

		log.info("boardList.....");

		List<BoardVO> boards = new ArrayList<BoardVO>();
		boards = boardService.getBoardList();
		model.addAttribute("boards", boards);

		return "/board/boardList";
	}

	@PostMapping(value = "/write.do")
	public String writingComplete(BoardVO board) {

		log.info("writing......");
		
		boardService.write(board);

		return "redirect:/board/boardList";
	}
	
	@GetMapping(value = "/getBoardList")
	public ResponseEntity<List<BoardVO>> getBoardList(){
		
		List<BoardVO> boardList = boardService.getBoardList();
		
		return new ResponseEntity<>(boardList, HttpStatus.OK);
	}
	
	@GetMapping(value="/board/boardList/{boardNumber}")
	@ResponseBody
	public ResponseEntity<BoardVO> getBoardByNumber(@PathVariable int boardNumber){
		
		BoardVO board = boardService.read(boardNumber);
		
		return new ResponseEntity<>(board, HttpStatus.OK);
	}
}
