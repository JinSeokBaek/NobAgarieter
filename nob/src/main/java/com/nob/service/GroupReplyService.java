package com.nob.service;

import java.util.List;

import com.nob.domain.Criteria;
import com.nob.domain.GroupReplyVO;
import com.nob.domain.ReplyVO;

public interface GroupReplyService {

  public List<ReplyVO> list(Integer gb_no) throws Exception;

  public void create(GroupReplyVO grVO) throws Exception;

  public void update(GroupReplyVO grVO) throws Exception;

  public void delete(Integer gr_id) throws Exception;

  public List<ReplyVO> listPage(Integer gb_no,Integer u_no, Criteria cri) throws Exception;

  public int count(Integer gb_no) throws Exception;

  public int getGid(Integer gb_no) throws Exception;

}
