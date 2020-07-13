package com.nob.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nob.domain.Criteria;
import com.nob.domain.GroupBoardVO;

@Repository
public class GroupBoardDAOImpl implements GroupBoardDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "com.nob.mapper.GroupMapper";



  @Override
  public void create(GroupBoardVO gbVO) throws Exception {

    session.insert(namespace + ".create", gbVO);
  }


  @Override
  public List<GroupBoardVO> listPage(Integer g_id,Integer u_no ,Criteria cri) throws Exception {

    Map<String, Object> paramMap = new HashMap<>();
    
    paramMap.put("g_id", g_id);
    paramMap.put("cri", cri);
    paramMap.put("u_no", u_no);
    return session.selectList(namespace + ".listPage", paramMap);
  }

  @Override
  public int count(Integer g_id) throws Exception {

    return session.selectOne(namespace + ".count", g_id);

  }

@Override
public void update(GroupBoardVO gbVO) throws Exception {
	
    session.update(namespace + ".update", gbVO);
    
	
}



@Override
public void delete(Integer g_id, Integer gb_no) throws Exception {
	  Map<String, Object> paramMap = new HashMap<>();
	    
	    paramMap.put("g_id", g_id);
	    paramMap.put("gb_no", gb_no);
	
	session.delete(namespace + ".delete", paramMap);
	
	
}


  
}
