package com.nob.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nob.domain.GroupMemberVO;
import com.nob.domain.GroupVO;
import com.nob.persistence.GroupDAO;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Inject
	private GroupDAO gDAO;
	
	@Transactional
	@Override
	public void makeGroup(GroupVO gVO) throws Exception {
		gDAO.makeGroup(gVO);
		GroupMemberVO gmVO=new GroupMemberVO();
		gmVO.setU_no(gVO.getU_no());
		gDAO.joinMakedGroup(gmVO);
	}

	@Override
	public void joinGroup(GroupMemberVO gmVO) throws Exception {
		gDAO.joinGroup(gmVO);
	}

	@Override
	public List<GroupMemberVO> getGroupMember(Integer gid) throws Exception {
		return gDAO.getGroupMember(gid);
	}

	@Override
	public int isGroupMember(Integer uno, Integer gid) throws Exception {
		return gDAO.isGroupMember(uno, gid);
	}

	@Override
	public int checkName(String gname) throws Exception {
		return gDAO.checkName(gname);
	}

	@Override
	public List<GroupVO> groupList(Integer u_no) throws Exception {
		return gDAO.groupList(u_no);
	}

	@Override
	public void delGroup(Integer gid) throws Exception {
		gDAO.delReply(gid);
		gDAO.delBoard(gid);
		gDAO.delGroupMember(gid);
		gDAO.delGroup(gid);
	}

	@Override
	public String isAdmin(Integer uno, Integer gid) throws Exception {
		return gDAO.isAdmin(uno, gid);
	}

	@Override
	public void delMember(Integer uno, Integer gid) throws Exception {
		gDAO.delMember(uno, gid);
	}

	@Override
	public void setAdmin(Integer uno, Integer gid,String gmgrant) throws Exception {
		gDAO.setAdmin(uno, gid,gmgrant);
	}

	@Override
	public int isMainAdmin(Integer uno, Integer gid) throws Exception {
		return gDAO.isMainAdmin(uno, gid);
	}

	@Override
	public List<GroupVO> groupList2(Integer u_no) throws Exception {
		return gDAO.groupList2(u_no);
	}

	@Override
	public List<GroupVO> groupListCategory(Integer u_no, String g_category) throws Exception {
		return gDAO.groupListCategory(u_no,g_category);
	}

}
