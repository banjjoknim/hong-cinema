package org.gasan.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gasan.domain.MovieVO;
import org.gasan.util.PagingVO;
import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;


@Log4j
@Repository
public class MovieDAOImpl implements MovieDAO {

	@Inject SqlSession sql;
	
	private String namespace = "org.gasan.mapper.MovieMapper";
	
	@Override
	public void createMov(MovieVO mo) throws Exception {
		sql.insert(namespace + ".createMov", mo);

	}
	
	@Override
	public List<MovieVO> getMovieList() throws Exception{
		
		return sql.selectList(namespace + ".getMovieList");
	
	}
	
	@Override
	public void movieUpdate(MovieVO mo)throws Exception {
		
		sql.update(namespace + ".movieUpdate", mo);
	}
	
	@Override
	public void posterUpdate(MovieVO mo)throws Exception{
		
		sql.update(namespace + ".posterUpdate", mo);
	}

	
	@Override
	public void movieDelete(MovieVO mo) throws Exception{
		
		sql.delete(namespace + ".movieDelete", mo);
	}
	
	
	@Override
	public MovieVO viewMovie(String movieCode) throws Exception{
		
		return sql.selectOne(namespace + ".viewMovie", movieCode);
	}
	
	@Override
	public int countMovie() throws Exception{
		return sql.selectOne(namespace + ".countMovie");
	}
	
	@Override
	public List<MovieVO> selectMovie(PagingVO po) throws Exception{
		return sql.selectList(namespace + ".selectMovie", po);
	}
}
