package org.gasan.mapper;

import java.util.List;

import org.gasan.domain.MovieVO;
import org.gasan.util.PagingVO;

public interface MovieMapper {

	public void createMov(MovieVO mo);
	
	public List<MovieVO> getMovieList();
	
	public void movieDelete(MovieVO mo);
	
	public void movieUpdate(MovieVO mo);
	
	public void posterUpdate(MovieVO mo);
	
	public MovieVO viewMovie(String movieCode);
	
	public int countMovie();

	public List<MovieVO> selectMovie(PagingVO po);
}
