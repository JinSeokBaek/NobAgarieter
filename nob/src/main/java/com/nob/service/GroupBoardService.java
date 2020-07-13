package com.nob.service;

import java.util.List;

import com.nob.domain.Criteria;
import com.nob.domain.GroupBoardVO;


public interface GroupBoardService {

	  public void create(GroupBoardVO gbVO) throws Exception;

	  public List<GroupBoardVO> listPage(Integer g_id, Integer u_no,Criteria cri) throws Exception;

	  public int count(Integer g_id) throws Exception;
	  
	  public void update(GroupBoardVO gbVO) throws Exception;

	  public void delete(Integer g_id, Integer gb_no) throws Exception;

}
