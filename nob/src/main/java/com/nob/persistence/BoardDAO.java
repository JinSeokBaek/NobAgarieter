package com.nob.persistence;

import java.util.List;

import com.nob.domain.BoardVO;
import com.nob.domain.Criteria;
import com.nob.domain.HashtagVO;
import com.nob.domain.LikeVO;
import com.nob.domain.NoticeVO;
import com.nob.domain.SearchCriteria;

public interface BoardDAO {
	public List<BoardVO> listPage(Integer page) throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	public List<BoardVO> listSearch(SearchCriteria cri, String tbl_name) throws Exception;

	public int listSearchCount(SearchCriteria cri, String tbl_name) throws Exception;

	public List<BoardVO> likeTotal(String tbl_name) throws Exception;

	public List<BoardVO> hashTotal() throws Exception;

	public List<BoardVO> hashBoard(String tbl_name) throws Exception;

	public List<BoardVO> likeTotalAll() throws Exception;

	public List<BoardVO> newAll() throws Exception;

	public BoardVO read(Integer b_no, String tbl_name) throws Exception;

	public void replycntupdate(String tbl_name) throws Exception;

	public void update(BoardVO bVO, String tbl_name) throws Exception;

	public void delete(Integer b_no, String tbl_name) throws Exception;

	public void create(BoardVO bVO, String tbl_name) throws Exception;

	public void updateViewCnt(Integer b_no, String tbl_name) throws Exception;

	public void addAttach(String fullName) throws Exception; // 2018_06_14 추

	public void deleteAttach(Integer b_no) throws Exception; // 2018_06_14 추가

	public void replaceAttach(String fullName, Integer b_no) throws Exception; // 2018_06_14 추가

	public void like(LikeVO lVO) throws Exception; // 2018_06_18 추가

	public LikeVO liketest(LikeVO lVO) throws Exception; // 2018_06_18 추가

	public List<LikeVO> likeReadTotal(String tbl_name, Integer l_bno) throws Exception;

	public void hashInsert(String tbl_name, String h_name) throws Exception; // 2018_06_19 추가

	public List<HashtagVO> hashSelect(Integer h_bno, String tbl_name) throws Exception;// 2018_06_19 추가

	public void hashModify(Integer h_bno, String tbl_name, String h_name) throws Exception;// 2018_06_19 추가

	public void hashDelete(Integer h_bno, String tbl_name) throws Exception;// 2018_06_19 추가

	public List<BoardVO> main_sti() throws Exception;

	public List<BoardVO> hashList(Integer b_no) throws Exception;
	
	public List<LikeVO> likeTotal3(String tbl_name, Integer l_bno) throws Exception;
	
	public List<BoardVO> noticeList(SearchCriteria cri) throws Exception;
	
	public void likedelete(String tbl_name, Integer l_bno, Integer u_no) throws Exception;//2018_07_04 modify

	public List<LikeVO> likeReplyTotal(String tbl_name, Integer l_bno) throws Exception;//2018_07_04 modify

	public void likeReplyInsert(LikeVO lVO) throws Exception;//2018_07_04 modify

	public void likeReplyDelete(String tbl_name, Integer l_bno, Integer u_no) throws Exception;//2018_07_04 modify
}
