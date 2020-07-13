package com.nob.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.nob.domain.Criteria;
import com.nob.domain.GroupReplyVO;
import com.nob.domain.ReplyVO;

@Repository
public class GroupReplyDAOImpl implements GroupReplyDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "com.nob.mapper.groupReplyMapper";
  

  @Override
  public List<ReplyVO> list(Integer gb_no) throws Exception {

    return session.selectList(namespace + ".list", gb_no);
  }

@Override
public void create(GroupReplyVO grVO) throws Exception {
	session.insert(namespace + ".create", grVO);
	
	
}

@Override
public void update(GroupReplyVO grVO) throws Exception {
	session.update(namespace + ".update", grVO);
	
}

@Override
public void delete(Integer gr_id) throws Exception {
	session.delete(namespace + ".delete", gr_id);
}

@Override
public List<ReplyVO> listPage(Integer gb_no,Integer u_no, Criteria cri) throws Exception {
	 Map<String, Object> paramMap = new HashMap<>();
	    
	    
	    paramMap.put("gb_no", gb_no);
	    paramMap.put("cri", cri);
	    paramMap.put("u_no", u_no);
	    return session.selectList(namespace + ".listPage", paramMap);
}

@Override
public int count(Integer gb_no) throws Exception {

  return session.selectOne(namespace + ".count", gb_no);

}

@Override
public int getGid(Integer gb_no) throws Exception {

  return session.selectOne(namespace + ".getGid", gb_no);
}

}
