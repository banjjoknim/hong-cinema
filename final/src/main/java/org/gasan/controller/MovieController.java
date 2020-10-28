package org.gasan.controller;



import javax.servlet.http.HttpSession;

import org.gasan.domain.MovieVO;
import org.gasan.service.MovieService;
import org.gasan.util.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/*")
public class MovieController {
	
	@Setter(onMethod_ = @Autowired)
	private MovieService movieService;
	
	
	// 영화등록 페이지 접근
	@GetMapping("/admin_mov")
	public String admin_mov() {

		log.info("영화등록 폼");

		return "/admin/admin_mov";
	}
	
	//관리자 예매내역 페이지 접근
	@GetMapping("/admin_res")
	public String admin_res() {

		log.info("예매내역 폼");

		return "/admin/admin_res";
	}
	
	//관리자 상영관리 페이지 접근
	@GetMapping("/admin_shw")
	public String admin_shw() {

		log.info("상영관리 폼");

		return "/admin/admin_shw";
	}
	
	//관리자 상영관관리 페이지 접근
	@GetMapping("/admin_scr")
	public String admin_scr() {

		log.info("상영관관리 폼");

		return "/admin/admin_scr";
	}
	
	// 새영화 등록 처리
	@PostMapping("/createMov")
	public String createMov(MovieVO mo) throws Exception {
	
		log.info(mo);
			
		movieService.createMov(mo);

		return "redirect:/admin_mov";
	}
	
	// 영화 관리 페이지
	@GetMapping("admin_movList")
	public String getMovieList(PagingVO po, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		log.info("getMovieList()....");
		
		int total = movieService.countMovie();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		po = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", po);
		model.addAttribute("viewAll", movieService.selectMovie(po));
		/* model.addAttribute("movieList", movieService.getMovieList()); */
		
		return "/admin/admin_movList";

	}
	

	
	// 영화 상세정보 조회
		@RequestMapping("/movieView")
		public String viewMovie(String movieCode, Model model) throws Exception {
			// 회원 정보를 model에 저장
			model.addAttribute("mo", movieService.viewMovie(movieCode));

			log.info("클릭한 아이디 : " + movieCode);

			
			return "/admin/movie_view";

		}
		
		
		// 영화 수정 처리
		@RequestMapping(value = "/movieUpdate", method = RequestMethod.POST)
		public String movieUpdate(MovieVO mo) throws Exception {
			log.info("movieUpdate....");
			
			movieService.movieUpdate(mo);

			return "redirect:/admin_movList";
		}
		
		// 회원 수정 처리
		@RequestMapping(value = "/posterUpdate", method = RequestMethod.POST)
		public String posterUpdate(MovieVO mo) throws Exception {
			
			log.info("posterUpdate....");
					
			movieService.posterUpdate(mo);

			return "redirect:/admin_movList";
		}
		
		
		// 관리자 영화정보수정 페이지 접근
		@RequestMapping(value = "/admin_posterModify", method = RequestMethod.GET)
		public String admin_posterModify(Model model, String movieCode, HttpSession session) throws Exception {


			model.addAttribute("mo", movieService.viewMovie(movieCode));

			log.info("클릭한 영화 번호 : " + movieCode);

			return "/admin/admin_posterModify";

		}
		
		// 관리자 영화정보수정 페이지 접근
		@RequestMapping(value = "/admin_movModify", method = RequestMethod.GET)
		public String admin_movModify(Model model, String movieCode, HttpSession session) throws Exception {
			
			
			model.addAttribute("mo", movieService.viewMovie(movieCode));

			log.info("클릭한 영화 번호 : " + movieCode);

			return "/admin/admin_movModify";

		}
		
		// 영화 정보 삭제 처리
		@RequestMapping(value = "/movieDelete", method = RequestMethod.POST)
		public String movieDelete(MovieVO mo) throws Exception {

			movieService.movieDelete(mo);

			return "redirect:/admin_movList";
		}

		// 영화 정보 삭제 처리
		@RequestMapping(value = "/movieDelete", method = RequestMethod.GET)
		public String Delete(MovieVO mo) throws Exception {

			movieService.movieDelete(mo);

			return "redirect:/admin_movList";
		}

	
	
}
