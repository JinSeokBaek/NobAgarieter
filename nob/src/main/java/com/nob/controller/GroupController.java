package com.nob.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nob.domain.BoardVO;
import com.nob.domain.GroupMemberVO;
import com.nob.domain.GroupVO;
import com.nob.domain.LikeVO;
import com.nob.domain.SearchCriteria;
import com.nob.domain.UserVO;
import com.nob.service.BoardService;
import com.nob.service.GroupService;

@Controller
@RequestMapping("/group/*")
public class GroupController {
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Inject
	private GroupService service;
	@Inject
	private BoardService bservice;
	//�׷����������
	@RequestMapping(value = "/groupMain", method = RequestMethod.GET)
	public void groupMain(Model model,HttpSession session) throws Exception {
		logger.info("group page");
		Object obj=session.getAttribute("login");
		List<GroupVO> gVO;
		if(obj!=null) {
			UserVO uVO=(UserVO)obj;
			logger.info(uVO.getU_no().toString());
			gVO= service.groupList2(uVO.getU_no());
			model.addAttribute("grouplist",gVO);
			model.addAttribute("grouplist2",service.groupList(uVO.getU_no()));
			logger.info(gVO.toString());
		}else {
		/*model.addAttribute("grouplist",service.groupList());*/
		}
		
	}
	
	//�׷�������
	@RequestMapping(value = "/group", method = RequestMethod.GET)
	public String group(@RequestParam("gid") Integer gid,Model model) throws Exception {
		logger.info("group page");
		model.addAttribute("gid",gid);
		SearchCriteria cri= new SearchCriteria();
		String tbl_name="tbl_notice";
		cri.setPage(0);
		cri.setPerPageNum(5);
		model.addAttribute("notice", bservice.listSearchCriteria(cri,tbl_name));
		return "/group/listAll";
	}
	
	//�׷���� ������
	@RequestMapping(value = "/groupUser", method = RequestMethod.POST)
	public void groupUser(@RequestParam("gid") Integer gid,@RequestParam("uno") Integer uno,Model model) throws Exception{
		logger.info("groupUser page");
		model.addAttribute("gid",gid);
		model.addAttribute("admin",service.isAdmin(uno, gid));
		model.addAttribute("mainadmin",service.isMainAdmin(uno, gid));
		model.addAttribute("memberlist",service.getGroupMember(gid));
	}
	
	//�׷� ����������
	@RequestMapping(value = "/makeGroup", method = RequestMethod.GET)
	public void makeGroup()  throws Exception{
		logger.info("make group page");
	}
	//�׷����
	@RequestMapping(value = "/makeGroup", method = RequestMethod.POST)
	public String makeGroup(GroupVO gVO,Model model)  throws Exception{
		logger.info("making group");
		service.makeGroup(gVO);
		//���� �׷����� �̵�
		return "redirect:/group/groupMain";
	}
	
	//�̸��ߺ�Ȯ��
	@ResponseBody
	@RequestMapping(value = "/checkName", method = RequestMethod.POST)
	public int checkName(@RequestParam("gname") String gname) throws Exception {
		return service.checkName(gname);
	}
	//�׷�� Ȯ��
	@ResponseBody
	@RequestMapping(value = "/isGroupMember", method = RequestMethod.POST)
	public int isGroupMember(@RequestParam("uno") int uno,@RequestParam("gid") int gid) throws Exception {
		return service.isGroupMember(uno, gid);
	}
	
	//�׷����
	@ResponseBody
	@RequestMapping(value = "/delGroup", method = RequestMethod.POST)
	public void delGroup(@RequestParam("gid") int gid,Model model)  throws Exception{
		
		service.delGroup(gid);
	}
	//�׷�����
	@ResponseBody
	@RequestMapping(value = "/joinGroup", method = RequestMethod.POST)
	public int joinGroup(@RequestParam("uno") int uno,@RequestParam("gid") int gid,Model model)  throws Exception{
		logger.info("joining group");
		GroupMemberVO gmVO=new GroupMemberVO();
		gmVO.setG_id(gid);
		gmVO.setU_no(uno);
		service.joinGroup(gmVO);
		return gid;
	}
	
	//�׷�� ����Ȯ��
	@ResponseBody
	@RequestMapping(value = "/isAdmin", method = RequestMethod.POST)
	public String isAdmin(@RequestParam("uno") int uno,@RequestParam("gid") int gid) throws Exception {
		return service.isAdmin(uno, gid);
	}
	
	//�׷�� ����Ȯ��
	@ResponseBody
	@RequestMapping(value = "/isMainAdmin", method = RequestMethod.POST)
		public int isMainAdmin(@RequestParam("uno") int uno,@RequestParam("gid") int gid) throws Exception {
		return service.isMainAdmin(uno, gid);
	}
	
	//�׷�� ���Ѽ���
	@ResponseBody
	@RequestMapping(value = "/setAdmin", method = RequestMethod.POST)
	public void setAdmin(@RequestParam("uno") int uno,@RequestParam("gid") int gid,@RequestParam("gmgrant") String gmgrant) throws Exception {
		service.setAdmin(uno, gid,gmgrant);
	}
	
	//�׷�� Ż��
	@ResponseBody
	@RequestMapping(value = "/delMember", method = RequestMethod.POST)
	public void delMember(@RequestParam("uno") int uno,@RequestParam("gid") int gid) throws Exception {
		service.delMember(uno, gid);
	}
	
	
	
	
	
		
	
}
