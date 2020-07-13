package com.nob.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.nob.domain.Criteria;
import com.nob.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "com.nob.mapper.ReplyMapper";

  @Override
  public List<ReplyVO> list(Integer b_no) throws Exception {

    return session.selectList(namespace + ".list", b_no);
  }

  @Override
  public void create(ReplyVO rVO) throws Exception {

    session.insert(namespace + ".create", rVO);
  }

  @Override
  public void update(ReplyVO rVO) throws Exception {

    session.update(namespace + ".update", rVO);
  }

  @Override
  public void delete(Integer r_id) throws Exception {

    session.update(namespace + ".delete", r_id);
  }

  @Override
  public List<ReplyVO> listPage(String tbl_name, Integer b_no,Integer u_no, Criteria cri) throws Exception {

    Map<String, Object> paramMap = new HashMap<>();
    
    paramMap.put("tbl_name", tbl_name);
    paramMap.put("b_no", b_no);
    paramMap.put("cri", cri);
    paramMap.put("u_no", u_no);
    
    return session.selectList(namespace + ".listPage", paramMap);
  }

  @Override
  public int count(Integer b_no,String tbl_name) throws Exception {
	  Map<String, Object> paramMap = new HashMap<>();
	    
	    paramMap.put("tbl_name", tbl_name);
	    paramMap.put("b_no", b_no);

    return session.selectOne(namespace + ".count", paramMap);

  }

  @Override
  public int getBno(Integer r_id) throws Exception {

    return session.selectOne(namespace + ".getBno", r_id);
  }
  
  
}
