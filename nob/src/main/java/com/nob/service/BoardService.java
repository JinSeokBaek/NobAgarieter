package com.nob.service;

import java.util.List;

import com.nob.domain.BoardVO;
import com.nob.domain.Criteria;
import com.nob.domain.LikeVO;
import com.nob.domain.NoticeVO;
import com.nob.domain.SearchCriteria;

public interface BoardService {
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;

	public List<BoardVO> listSearchCriteria(SearchCriteria cri, String tbl_name) throws Exception;

	public int listSearchCount(SearchCriteria cri, String tbl_name) throws Exception;

	public List<BoardVO> likeTotal(String tbl_name) throws Exception;

	public List<BoardVO> hashTotal() throws Exception;

	public List<BoardVO> hashBoard(String tbl_name) throws Exception;

	public List<BoardVO> newAll() throws Exception;

	public List<BoardVO> likeTotalAll() throws Exception;

	public BoardVO read(Integer b_no, String tbl_name) throws Exception;

	public void replycntupdate(String tbl_name) throws Exception;

	public void modify(BoardVO bVO, String tbl_name) throws Exception;

	public void remove(Integer b_no, String tbl_name) throws Exception;

	public void regist(BoardVO bVO, String tbl_name) throws Exception;

	public void like(LikeVO lVO) throws Exception; // 2018_06_18 Ãß°¡

	public LikeVO liketest(LikeVO lVO) throws Exception; // 2018_06_18 Ãß°¡

	public List<LikeVO> likeReadTotal(String tbl_name, Integer l_bno) throws Exception;

	public List<BoardVO> main_sti() throws Exception;

	public List<BoardVO> hashList(Integer b_no) throws Exception;
	
	public List<LikeVO> likeTotal3(String tbl_name, Integer l_bno) throws Exception;
	
	public List<BoardVO> noticeList(SearchCriteria cri) throws Exception;
	
	public void likedelete(String tbl_name, Integer l_bno, Integer u_no) throws Exception;//2018_07_04 modify
	
	public List<LikeVO> likeReplyTotal(String tbl_name, Integer l_bno) throws Exception;//2018_07_04 modify

	public void likeReplyInsert(LikeVO lVO) throws Exception;//2018_07_04 modify

	public void likeReplyDelete(String tbl_name, Integer l_bno, Integer u_no) throws Exception;//2018_07_04 modify
	
}
