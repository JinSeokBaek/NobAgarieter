package com.nob.persistence;

import java.util.List;

import com.nob.domain.Criteria;
import com.nob.domain.ReplyVO;

public interface ReplyDAO {

  public List<ReplyVO> list(Integer b_no) throws Exception;

  public void create(ReplyVO rVO) throws Exception;

  public void update(ReplyVO rVO) throws Exception;

  public void delete(Integer r_id) throws Exception;

  public List<ReplyVO> listPage(String tbl_name, Integer b_no,Integer u_no, Criteria cri) throws Exception;

  public int count(Integer b_no,String tbl_name) throws Exception;

  public int getBno(Integer r_id) throws Exception;

}
