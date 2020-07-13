package com.nob.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nob.domain.BoardVO;
import com.nob.domain.Criteria;
import com.nob.domain.HashtagVO;
import com.nob.domain.LikeVO;
import com.nob.domain.NoticeVO;
import com.nob.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession session;

	private static String namespace = "com.nob.mapper.BoardMapper";

	@Override
	public List<BoardVO> listPage(Integer page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri, String tbl_name) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("tbl_name", tbl_name);
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("cri", cri);
		System.out.print(cri.toString());
		return session.selectList(namespace + ".listSearch", paramMap);
	}

	@Override
	public int listSearchCount(SearchCriteria cri,String tbl_name) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("tbl_name", tbl_name);
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("cri", cri);
		return session.selectOne(namespace + ".listSearchCount", paramMap);
	}

	@Override
	public List<BoardVO> likeTotal(String tbl_name) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("tbl_name", tbl_name);
		return session.selectList(namespace + ".likeTotal", paramMap);
	}

	@Override
	public List<BoardVO> hashTotal() throws Exception {
		return session.selectList(namespace + ".hashTotal");
	}
	@Override
	public List<BoardVO> hashBoard(String tbl_name) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("tbl_name", tbl_name);
		
		return session.selectList(namespace + ".hashBoard",paramMap);
	}

	@Override
	public List<BoardVO> likeTotalAll() throws Exception {

		return session.selectList(namespace + ".likeTotalAll");
	}

	@Override
	public List<BoardVO> newAll() throws Exception {

		return session.selectList(namespace + ".newAll");
	}

	@Override
	public BoardVO read(Integer b_no, String tbl_name) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("tbl_name", tbl_name);
		paramMap.put("b_no", b_no);
		
		return session.selectOne(namespace + ".read", paramMap);
	}

	@Override
	public void replycntupdate(String tbl_name) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("tbl_name", tbl_name);
		session.update(namespace + ".replycntupdate",paramMap);

	}

	@Override
	public void update(BoardVO bVO, String tbl_name) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("tbl_name", tbl_name);
		paramMap.put("bVO", bVO);
		session.update(namespace + ".update", paramMap);
	}

	@Override
	public void delete(Integer b_no,String tbl_name) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("tbl_name", tbl_name);
		paramMap.put("b_no", b_no);
		session.delete(namespace + ".delete", paramMap);
	}

	@Override
	public void create(BoardVO bVO,String tbl_name) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("tbl_name", tbl_name);
		paramMap.put("bVO", bVO);
		session.insert(namespace + ".create", paramMap);
	}
	
	
	//2018_06_14 추가
	@Override
	public void addAttach(String fullName) throws Exception {

		session.insert(namespace + ".addAttach", fullName);

	}
	
	//2018_06_14 추가
	@Override
	public void deleteAttach(Integer b_no) throws Exception {

		session.delete(namespace + ".deleteAttach", b_no);

	}
	//2018_06_14 추가
	@Override
	public void replaceAttach(String fullName, Integer b_no) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("b_no", b_no);
		paramMap.put("fullName", fullName);

		session.insert(namespace + ".replaceAttach", paramMap);

	}
	//좋아요
	//2018_06_18 추가
	@Override
	public void like(LikeVO lVO) throws Exception {
		
		session.insert(namespace + ".like", lVO);
		
	}
	//2018_06_18 추가 
	@Override
	public LikeVO liketest(LikeVO lVO) throws Exception {
		
		return session.selectOne(namespace + ".liketest", lVO);
		
	}
	@Override
	public List<LikeVO> likeReadTotal(String tbl_name, Integer l_bno) throws Exception {
		
	Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("tbl_name",tbl_name);
	    paramMap.put("l_bno", l_bno);
	 
	    return session.selectList(namespace + ".likeReadTotal", paramMap);
	}
	
	
	// Hash tag
	//2018_06_19 추가
		@Override
		public void hashInsert(String tbl_name, String h_name) throws Exception {
			Map<String, Object> paramMap = new HashMap<String, Object>();

			paramMap.put("tbl_name", tbl_name);
			paramMap.put("h_name", h_name);
			session.insert(namespace + ".hashInsert", paramMap);

		}
		//2018_06_19 추가
		@Override
		public List<HashtagVO> hashSelect(Integer h_bno, String tbl_name) throws Exception {
			// TODO Auto-generated method stub
			Map<String, Object> paramMap = new HashMap<String, Object>();

			paramMap.put("h_bno", h_bno);
			paramMap.put("tbl_name", tbl_name);
			return session.selectList(namespace + ".hashSelect", paramMap);
		}
		//2018_06_19 추가
		@Override
		public void hashModify(Integer h_bno, String tbl_name, String h_name) throws Exception {
			Map<String, Object> paramMap = new HashMap<String, Object>();

			paramMap.put("h_bno", h_bno);
			paramMap.put("tbl_name", tbl_name);
			paramMap.put("h_name", h_name);
			session.update(namespace + ".hashModify", paramMap);

		}
		//2018_06_19 추가
		@Override
		public void hashDelete(Integer h_bno, String tbl_name) throws Exception {
			Map<String, Object> paramMap = new HashMap<String, Object>();

			paramMap.put("h_bno", h_bno);
			paramMap.put("tbl_name", tbl_name);
			session.update(namespace + ".hashDelete", paramMap);

		}

		@Override
		public void updateViewCnt(Integer b_no,String tbl_name) throws Exception {
			Map<String, Object> paramMap = new HashMap<String, Object>();

			paramMap.put("b_no", b_no);
			paramMap.put("tbl_name", tbl_name);
			session.update(namespace+".updateViewCnt",paramMap);
			
		}

		@Override
		public List<BoardVO> main_sti() throws Exception {
			return session.selectList(namespace+".main_sti");
		}

		@Override
		public List<BoardVO> hashList(Integer b_no) throws Exception {
			return session.selectList(namespace+".hashList",b_no);
		}

		@Override
		public List<LikeVO> likeTotal3(String tbl_name, Integer l_bno) throws Exception {
			Map<String, Object> paramMap = new HashMap<String, Object>();

			paramMap.put("tbl_name", tbl_name);
			paramMap.put("l_bno", l_bno);
			return session.selectList(namespace + ".likeTotal3", paramMap);
			}

		@Override
		public List<BoardVO> noticeList(SearchCriteria cri) throws Exception {
			return session.selectList(namespace+".noticeList",cri);
		}
		//2018_07_04 modify
				@Override
				public void likedelete(String tbl_name, Integer l_bno, Integer u_no) throws Exception {
					Map<String, Object> paramMap = new HashMap<String, Object>();

					paramMap.put("tbl_name", tbl_name);
					paramMap.put("l_bno", l_bno);
					paramMap.put("u_no", u_no);
					session.delete(namespace + ".likedelete", paramMap);
				}
				
				//2018_07_04 modify
				@Override
				public List<LikeVO> likeReplyTotal(String tbl_name, Integer l_bno) throws Exception {
					Map<String, Object> paramMap = new HashMap<String, Object>();

					paramMap.put("tbl_name", tbl_name);
					paramMap.put("l_bno", l_bno);
					return session.selectList(namespace + ".likeReplyTotal", paramMap);
				}
				//2018_07_04 modify
				@Override
				public void likeReplyInsert(LikeVO lVO) throws Exception {
					session.insert(namespace + ".likeReplyInsert", lVO);
				}
				//2018_07_04 modify
				@Override
				public void likeReplyDelete(String tbl_name, Integer l_bno, Integer u_no) throws Exception {
					Map<String, Object> paramMap = new HashMap<String, Object>();

					paramMap.put("tbl_name", tbl_name);
					paramMap.put("l_bno", l_bno);
					paramMap.put("u_no", u_no);
				
					session.delete(namespace + ".likeReplyDelete", paramMap);
				}

}
