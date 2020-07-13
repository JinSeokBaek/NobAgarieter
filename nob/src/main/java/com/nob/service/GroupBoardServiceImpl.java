package com.nob.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nob.domain.Criteria;
import com.nob.domain.GroupBoardVO;
import com.nob.persistence.BoardDAO;
import com.nob.persistence.GroupBoardDAO;
import com.nob.util.Hashtag;

@Service
public class GroupBoardServiceImpl implements GroupBoardService {

  @Inject
  private GroupBoardDAO gbDAO;
  
  @Inject
  private BoardDAO bDAO;

  @Transactional
  @Override
  public void create(GroupBoardVO gbVO) throws Exception {
	  gbDAO.create(gbVO);
  
		/*String h_name1 = gbVO.getH_name();
		int b_name = 5;
		Hashtag.extractHashTagTest(h_name1);
		ArrayList<String> getHashs = Hashtag.getHashtags();

		Iterator<String> it = getHashs.iterator();
		
		while (it.hasNext()) {
			String h_name = (String) it.next();

			bDAO.hashInsert(b_name, h_name);

		}*/
	  	
  }

@Override
public List<GroupBoardVO> listPage(Integer g_id,Integer u_no, Criteria cri) throws Exception {
	
	return gbDAO.listPage(g_id,u_no, cri);
}

@Override
public int count(Integer g_id) throws Exception {
	// TODO Auto-generated method stub
	return gbDAO.count(g_id);
}

@Transactional
@Override
public void update(GroupBoardVO gbVO) throws Exception {
	gbDAO.update(gbVO);
	int h_bno = gbVO.getGb_no();
	int b_name = 5;
	
	String h_name1 = gbVO.getH_name();
	
	
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
public void delete(Integer g_id, Integer gb_no) throws Exception {
	int h_bno = gb_no;
	int b_name = 5;
	/*bDAO.hashDelete(h_bno, b_name);*/
	gbDAO.delete(g_id, gb_no);
	
}




}
