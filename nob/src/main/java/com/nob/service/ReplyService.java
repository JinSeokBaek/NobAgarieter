package com.nob.service;

import java.util.List;

import com.nob.domain.Criteria;
import com.nob.domain.ReplyVO;

public interface ReplyService {

  public void addReply(ReplyVO rVO) throws Exception;

  public List<ReplyVO> listReply(Integer b_no) throws Exception;

  public void modifyReply(ReplyVO rVO) throws Exception;

  public void removeReply(Integer r_id) throws Exception;

  public List<ReplyVO> listReplyPage(String tbl_name, Integer b_no,Integer u_no, Criteria cri) 
      throws Exception;

  public int count(Integer b_no,String tbl_name) throws Exception;
}
