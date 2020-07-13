package com.nob.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nob.domain.GroupMemberVO;
import com.nob.domain.GroupVO;

@Repository
public class GroupDAOImpl implements GroupDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace="com.nob.mapper.GroupMapper"; 
	
	
	@Override
	public void makeGroup(GroupVO gVO) throws Exception {
		gVO.toString();
		session.insert(namespace+".makeGroup",gVO);		
	}


	@Override
	public void joinMakedGroup(GroupMemberVO gmVO) throws Exception {
		session.insert(namespace+".joinMakedGroup",gmVO);
		
	}
	
	
	@Override
	public void joinGroup(GroupMemberVO gmVO) throws Exception {
		session.insert(namespace+".joinGroup",gmVO);
	}

	@Override
	public List<GroupMemberVO> getGroupMember(Integer gid) throws Exception {
		return session.selectList(namespace+".getGroupMember", gid);
	}
	

	
	@Override
	public int isGroupMember(Integer uno, Integer gid) throws Exception {
		Map<String, Object> param=new HashMap<>();
		param.put("uno", uno);
		param.put("gid", gid);
		return session.selectOne(namespace+".isGroupMember",param);
	}

	@Override
	public int checkName(String gname) throws Exception {
		return session.selectOne(namespace+".checkName", gname);
	}

	@Override
	public List<GroupVO> groupList(Integer u_no) throws Exception {
		return session.selectList(namespace+".groupList",u_no);
	}


	@Override
	public void delGroup(Integer gid) throws Exception {
		session.delete(namespace+".delGroup",gid);
	}
	@Override
	public void delGroupMember(Integer gid) throws Exception {
		session.delete(namespace+".delGroupMember", gid);
	}

	@Override
	public String isAdmin(Integer uno, Integer gid) throws Exception {
		Map<String, Object> param=new HashMap<>();
		param.put("uno", uno);
		param.put("gid", gid);
		return session.selectOne(namespace+".isAdmin", param);
	}


	@Override
	public void delMember(Integer uno, Integer gid) throws Exception {
		Map<String, Object> param=new HashMap<>();
		param.put("uno", uno);
		param.put("gid", gid);
		session.delete(namespace+".delMember", param);
	}



	@Override
	public void setAdmin(Integer uno, Integer gid,String gmgrant) throws Exception {
		Map<String, Object> param=new HashMap<>();
		param.put("uno", uno);
		param.put("gid", gid);
		param.put("gmgrant", gmgrant);
		session.delete(namespace+".setAdmin", param);
	}


	@Override
	public int isMainAdmin(Integer uno, Integer gid) throws Exception {
		Map<String, Object> param=new HashMap<>();
		param.put("uno", uno);
		param.put("gid", gid);
		return session.selectOne(namespace+".isMainAdmin", param);
	}


	@Override
	public List<GroupVO> groupList2(Integer u_no) throws Exception {
		return session.selectList(namespace+".groupList2",u_no);
	}


	@Override
	public List<GroupVO> groupListCategory(Integer u_no, String g_category) throws Exception {
		Map<String, Object> param=new HashMap<>();
		param.put("u_no", u_no);
		param.put("g_category", g_category);
		return session.selectList(namespace+".groupListCategory",param);
	}
	
	@Override
	public void delBoard(Integer gid) throws Exception {
		session.delete(namespace+".delBoard", gid);
	}


	@Override
	public void delReply(Integer gid) throws Exception {
		session.delete(namespace+".delReply", gid);
	}
	


}
