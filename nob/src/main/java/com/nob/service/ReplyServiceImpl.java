package com.nob.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nob.domain.Criteria;
import com.nob.domain.ReplyVO;
import com.nob.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

  @Inject
  private ReplyDAO rDAO;
  
//  @Inject
//  private BoardDAO bDAO;

//  @Transactional
  @Override
  public void addReply(ReplyVO rVO) throws Exception {

    rDAO.create(rVO);
//    bDAO.updateReplyCnt(rVO.getB_no(), 1);
  }
  
//  @Transactional
  @Override
  public void removeReply(Integer r_id) throws Exception {

//    int b_no = rDAO.getBno(r_id);
    rDAO.delete(r_id);
//    bDAO.updateReplyCnt(b_no, -1);
  }   



  @Override
  public List<ReplyVO> listReply(Integer b_no) throws Exception {

    return rDAO.list(b_no);
  }

  @Override
  public void modifyReply(ReplyVO rVO) throws Exception {

    rDAO.update(rVO);
  }



  @Override
  public List<ReplyVO> listReplyPage(String tbl_name, Integer b_no,Integer u_no, Criteria cri) 
      throws Exception {

    return rDAO.listPage(tbl_name, b_no,u_no, cri);
  }

  @Override
  public int count(Integer b_no,String tbl_name) throws Exception {

    return rDAO.count(b_no,tbl_name);
  }

}
