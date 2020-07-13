package com.nob.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nob.domain.Criteria;
import com.nob.domain.GroupReplyVO;
import com.nob.domain.ReplyVO;
import com.nob.persistence.BoardDAO;
import com.nob.persistence.GroupReplyDAO;
import com.nob.util.Hashtag;

@Service
public class GroupReplyServiceImpl implements GroupReplyService {

  @Inject
  private GroupReplyDAO grDAO;
  
  @Inject
  private BoardDAO bDAO;
@Override
public List<ReplyVO> list(Integer gb_no) throws Exception {
	
	return grDAO.list(gb_no);
}
@Transactional
@Override
public void create(GroupReplyVO grVO) throws Exception {
	

	String h_name1 = grVO.getH_name();
	int b_name = 6;
	Hashtag.extractHashTagTest(h_name1);
	ArrayList<String> getHashs = Hashtag.getHashtags();

	Iterator<String> it = getHashs.iterator();
	  grDAO.create(grVO);
	while (it.hasNext()) {
		String h_name = (String) it.next();

		/*bDAO.hashInsert(b_name, h_name);*/

	}
  	
	
}
@Transactional
@Override
public void update(GroupReplyVO grVO) throws Exception {
	grDAO.update(grVO);
	int h_bno = grVO.getGr_id();
	int b_name = 6;
	
	String h_name1 = grVO.getH_name();
	
	
	Hashtag.extractHashTagTest(h_name1);
	ArrayList<String> getHashs = Hashtag.getHashtags();

	Iterator<String> it = getHashs.iterator();
	
	while (it.hasNext()) {
		String h_name = (String) it.next();
		
		/*bDAO.hashModify(h_bno, b_name, h_name);*/

	}
	
}
@Transactional
@Override
public void delete(Integer gr_id) throws Exception {
	int h_bno = gr_id;
	int b_name = 6;
	/*bDAO.hashDelete(h_bno, b_name);*/
	grDAO.delete(gr_id);
	
}

@Override
public List<ReplyVO> listPage(Integer gb_no,Integer u_no ,Criteria cri) throws Exception {
	
	return grDAO.listPage(gb_no, u_no,cri);
}

@Override
public int count(Integer gb_no) throws Exception {
	
	return grDAO.count(gb_no);
}

@Override
public int getGid(Integer gb_no) throws Exception {
	// TODO Auto-generated method stub
	return grDAO.getGid(gb_no);
	
}
  


}
