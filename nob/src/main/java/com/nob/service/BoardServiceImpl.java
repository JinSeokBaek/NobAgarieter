package com.nob.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.nob.domain.BoardVO;
import com.nob.domain.Criteria;
import com.nob.domain.LikeVO;
import com.nob.domain.NoticeVO;
import com.nob.domain.SearchCriteria;
import com.nob.persistence.BoardDAO;
import com.nob.util.Hashtag;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO bDAO;

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return bDAO.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return bDAO.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri, String tbl_name) throws Exception {
		return bDAO.listSearch(cri, tbl_name);
	}

	@Override
	public int listSearchCount(SearchCriteria cri,String tbl_name) throws Exception {
		return bDAO.listSearchCount(cri,tbl_name);
	}

	@Override
	public List<BoardVO> likeTotal(String tbl_name) throws Exception {

		return bDAO.likeTotal(tbl_name);
	}

	@Override
	public List<BoardVO> hashTotal() throws Exception {

		return bDAO.hashTotal();
	}
	@Override
	public List<BoardVO> hashBoard(String tbl_name) throws Exception {

		return bDAO.hashBoard(tbl_name);
	}


	@Override
	public List<BoardVO> newAll() throws Exception {

		return bDAO.newAll();
	}

	@Override
	public List<BoardVO> likeTotalAll() throws Exception {
		// TODO Auto-generated method stub
		return bDAO.likeTotalAll();
	}
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer b_no, String tbl_name) throws Exception {
		bDAO.updateViewCnt(b_no,tbl_name);
		return bDAO.read(b_no, tbl_name);
	}

	@Override
	public void replycntupdate(String tbl_name) throws Exception {

		bDAO.replycntupdate(tbl_name);
	}

	@Override
	public void modify(BoardVO bVO, String tbl_name) throws Exception {
		bDAO.update(bVO, tbl_name);
	}

	@Override
	public void remove(Integer b_no, String tbl_name) throws Exception {
		bDAO.delete(b_no, tbl_name);
	}

	// 2018_06_14 트랜잭션 설정
	@Transactional
	@Override
	public void regist(BoardVO bVO, String tbl_name) throws Exception {
		bDAO.create(bVO, tbl_name);
		// 해시태그 기능 추가

		String h_name1 = bVO.getH_name();

		Hashtag.extractHashTagTest(h_name1);
		ArrayList<String> getHashs = Hashtag.getHashtags();

		Iterator<String> it = getHashs.iterator();
		while (it.hasNext()) {
			String h_name = (String) it.next();

			bDAO.hashInsert(tbl_name, h_name);

		}

		String[] files = bVO.getFiles();
		if (files == null) {
			return;
		}
		for (String fileName : files) {
			bDAO.addAttach(fileName);
		}

	}

	// 2018_06_18 추가
	@Override
	public void like(LikeVO lVO) throws Exception {

		bDAO.like(lVO);

	}

	// 2018_06_18 추가
	@Override
	public LikeVO liketest(LikeVO lVO) throws Exception {
		return bDAO.liketest(lVO);

	}

	@Override
	public List<LikeVO> likeReadTotal(String tbl_name, Integer l_bno) throws Exception {
		return bDAO.likeReadTotal(tbl_name, l_bno);
	}

	@Override
	public List<BoardVO> main_sti() throws Exception {
		return bDAO.main_sti();
	}

	@Override
	public List<BoardVO> hashList(Integer b_no) throws Exception {
		return bDAO.hashList(b_no);
	}

	@Override
	public List<LikeVO> likeTotal3(String tbl_name, Integer l_bno) throws Exception {
		return bDAO.likeTotal3(tbl_name, l_bno);
	}

	@Override
	public List<BoardVO> noticeList(SearchCriteria cri) throws Exception {
		return bDAO.noticeList(cri);
	}
	//2018_07_04 modify
		@Override
		public void likedelete(String tbl_name, Integer l_bno, Integer u_no) throws Exception {
			bDAO.likedelete(tbl_name, l_bno, u_no);
		}
		//2018_07_04 modify
		@Override
		public List<LikeVO> likeReplyTotal(String tbl_name, Integer l_bno) throws Exception {

			return bDAO.likeReplyTotal(tbl_name, l_bno);
		}
		//2018_07_04 modify
		@Override
		public void likeReplyInsert(LikeVO lVO) throws Exception {
			bDAO.likeReplyInsert(lVO);
			
		}
		//2018_07_04 modify
		@Override
		public void likeReplyDelete(String tbl_name, Integer l_bno, Integer u_no) throws Exception {
			bDAO.likeReplyDelete(tbl_name, l_bno, u_no);
			
		}
		

}
