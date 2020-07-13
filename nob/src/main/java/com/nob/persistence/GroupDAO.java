package com.nob.persistence;

import java.util.List;

import com.nob.domain.GroupMemberVO;
import com.nob.domain.GroupVO;

public interface GroupDAO {
	
	//�׷����
	public void makeGroup(GroupVO gVO) throws Exception;
	//�׷� �����ϸ鼭 ����
	public void joinMakedGroup(GroupMemberVO gmVO) throws Exception;
	
	//�׷� ����
	public void joinGroup(GroupMemberVO gmVO) throws Exception;
	
	//�׷�� ���
	public List<GroupMemberVO> getGroupMember(Integer gid) throws Exception;
	
	//�׷�� üũ
	public int isGroupMember(Integer uno,Integer gid) throws Exception; 
	
	//�׷�� üũ
	public int checkName(String gname) throws Exception; 
	
	//�׷���
	public List<GroupVO> groupList(Integer u_no) throws Exception;
	//tak 버튼 필터 테스트
	public List<GroupVO> groupList2(Integer u_no) throws Exception;
	//�׷����
	public void delGroup(Integer gid) throws Exception;
	public void delGroupMember(Integer gid) throws Exception;
	public void delBoard(Integer gid) throws Exception;
	public void delReply(Integer gid) throws Exception;
	//������ Ȯ��
	public String isAdmin(Integer uno,Integer gid) throws Exception; 
	
	//�׷��� Ȯ��
	public int isMainAdmin(Integer uno,Integer gid) throws Exception;
	
	//�׷�� Ż��
	public void delMember(Integer uno,Integer gid) throws Exception;
	
	//���Ѻο�
	public void setAdmin(Integer uno,Integer gid,String gmgrant) throws Exception;
	
	public List<GroupVO> groupListCategory(Integer u_no,String g_category) throws Exception;
	
}
