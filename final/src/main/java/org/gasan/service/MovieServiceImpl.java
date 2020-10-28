package org.gasan.service;

import java.util.List;

import javax.inject.Inject;

import org.gasan.dao.MovieDAO;
import org.gasan.domain.MovieVO;
import org.gasan.util.PagingVO;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MovieServiceImpl implements MovieService {
	
	@Inject MovieDAO dao;

	//영화등록
	@Override 
	public void createMov(MovieVO mo) throws Exception{
		dao.createMov(mo);
	}
	
	//영화목록
	@Override
	public List<MovieVO> getMovieList() throws Exception{
		return dao.getMovieList(); 
	}
	
	@Override
	public void movieUpdate(MovieVO mo) throws Exception {
		
		dao.movieUpdate(mo);
	}
	
	@Override
	public void posterUpdate(MovieVO mo)throws Exception{
		
		dao.posterUpdate(mo);
	
	}
	
	@Override
	public void movieDelete(MovieVO mo) throws Exception{
		
		dao.movieDelete(mo);
	}
	
	
	@Override
	public MovieVO viewMovie(String movieCode) throws Exception {
		MovieVO result = dao.viewMovie(movieCode);
		return result;
	}
	
	@Override
	public int countMovie() throws Exception{
		 
		return dao.countMovie();
		
	}
	
	@Override
	public List<MovieVO> selectMovie(PagingVO po) throws Exception{
		
		return dao.selectMovie(po);
		
	}


}
