package com.nob.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nob.domain.VideoVO;

@Repository
public class VideoDAOImpl implements VideoDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace="com.nob.mapper.ServiceMapper"; 
	
	@Override
	public List<VideoVO> listMoive() throws Exception {
		return session.selectList(namespace+".listVideo");
	}

	@Override
	public void create(VideoVO mVO) throws Exception {
		session.insert(namespace+".insertVideo", mVO);

	}

	@Override
	public void update(VideoVO mVO) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer vno) throws Exception {
		session.delete(namespace+".delVideo", vno);

	}

}
