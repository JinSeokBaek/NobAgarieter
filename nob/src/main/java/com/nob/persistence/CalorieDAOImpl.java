package com.nob.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nob.domain.CalorieVO;

@Repository
public class CalorieDAOImpl implements CalorieDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace="com.nob.mapper.ServiceMapper"; 
	
	
	@Override
	public List<CalorieVO> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}

	@Override
	public CalorieVO read(Integer cno) throws Exception {
		return session.selectOne(namespace+".read", cno);
	}

	@Override
	public List<CalorieVO> autocomplete(String keyword) throws Exception {
		return session.selectList(namespace+".autocomplete", keyword);
	}

}
