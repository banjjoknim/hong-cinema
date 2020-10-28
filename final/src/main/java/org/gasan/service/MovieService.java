package org.gasan.service;

import java.util.List;

import org.gasan.domain.MemberVO;
import org.gasan.domain.MovieVO;
import org.gasan.util.PagingVO;

public interface MovieService {

	//새 영화 등록
	public void createMov(MovieVO mo) throws Exception;
	
	//영화 목록
	public List<MovieVO> getMovieList() throws Exception;
	
	//영화정보수정
	public void movieUpdate(MovieVO mo) throws Exception;
	
	
	public void posterUpdate(MovieVO mo)throws Exception;
	
	
	//영화정보삭제
	public void movieDelete(MovieVO mo) throws Exception;
	
	
	public MovieVO viewMovie(String movieCode) throws Exception;

	//영화 정보 총 갯수
	public int countMovie() throws Exception;

	//페이징 처리 영화리스트 조회
	public List<MovieVO> selectMovie(PagingVO po) throws Exception;

	


}
