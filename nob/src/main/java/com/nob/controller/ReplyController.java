package com.nob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.nob.domain.BoardVO;
import com.nob.domain.Criteria;
import com.nob.domain.GroupVO;
import com.nob.domain.PageMaker;
import com.nob.domain.ReplyVO;
import com.nob.domain.UserVO;
import com.nob.service.BoardService;
import com.nob.service.GroupService;
import com.nob.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
  @Inject
  private ReplyService Rservice;
  @Inject
  private BoardService Bservice;
  @Inject
private GroupService service;
  
  private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
  
  @RequestMapping(value = "/", method = RequestMethod.POST)
  public ResponseEntity<String> register(@RequestBody ReplyVO rVO) {
	logger.info(rVO.toString());
    ResponseEntity<String> entity = null;
    try {
    	Rservice.addReply(rVO);
    	Bservice.replycntupdate(rVO.getTbl_name());
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/all/{b_no}", method = RequestMethod.GET)
  public ResponseEntity<List<ReplyVO>> list(@PathVariable("b_no") Integer b_no) {

    ResponseEntity<List<ReplyVO>> entity = null;
    try {
      entity = new ResponseEntity<>(Rservice.listReply(b_no), HttpStatus.OK);
      
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    return entity;
  }
  
  @RequestMapping(value = "/tip_hash/{b_no}", method = RequestMethod.GET)
  public ResponseEntity<List<BoardVO>> hash(@PathVariable("b_no") Integer b_no) {

    ResponseEntity<List<BoardVO>> entity = null;
    try {
      entity = new ResponseEntity<>(Bservice.hashList(b_no), HttpStatus.OK);
      
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    return entity;
  }
  
  
  
  @RequestMapping(value = "/{r_id}", method = { RequestMethod.PUT, RequestMethod.PATCH })
  public ResponseEntity<String> update(@PathVariable("r_id") Integer r_id, @RequestBody ReplyVO rVO) {

    ResponseEntity<String> entity = null;
    try {
    	rVO.setR_id(r_id);
    	Rservice.modifyReply(rVO);

      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/{r_id}", method = RequestMethod.DELETE)
  public ResponseEntity<String> remove(@PathVariable("r_id") Integer r_id) {

    ResponseEntity<String> entity = null;
    try {
    	Rservice.removeReply(r_id);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  /*@RequestMapping(value = "/{tbl_name}/{b_no}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
      @PathVariable("tbl_name") String tbl_name,
	  @PathVariable("b_no") Integer b_no,
      @PathVariable("page") Integer page) {
	  
	  logger.info(tbl_name+""+b_no+""+page);
    ResponseEntity<Map<String, Object>> entity = null;
    
    try {
      
      Criteria cri = new Criteria();
      cri.setPage(page);

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);

      Map<String, Object> map = new HashMap<String, Object>();
      List<ReplyVO> list = Rservice.listReplyPage(tbl_name, b_no, cri);

      map.put("list", list);
      logger.info(list.toString());
      Bservice.replycntupdate(tbl_name);
      int replyCount = Rservice.count(b_no,tbl_name);
      pageMaker.setTotalCount(replyCount);

      map.put("pageMaker", pageMaker);

      
      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }*/
//2018_07_04 modify
  @RequestMapping(value = "/{tbl_name}/{b_no}/{u_no}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
      @PathVariable("tbl_name") String tbl_name,
	  @PathVariable("b_no") Integer b_no,
      @PathVariable("page") Integer page,
      @PathVariable("u_no") Integer u_no) {
	  
	  logger.info(tbl_name+""+b_no+""+page);
    ResponseEntity<Map<String, Object>> entity = null;
    
    try {
      
      Criteria cri = new Criteria();
      cri.setPage(page);

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);

      Map<String, Object> map = new HashMap<String, Object>();
      List<ReplyVO> list = Rservice.listReplyPage(tbl_name, b_no, u_no, cri);

      map.put("list", list);
      logger.info(list.toString());
      Bservice.replycntupdate(tbl_name);
      int replyCount = Rservice.count(b_no,tbl_name);
      pageMaker.setTotalCount(replyCount);

      map.put("pageMaker", pageMaker);

      
      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }
  
  @RequestMapping(value = "/category/{g_category}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> groupCategory(HttpSession session,@PathVariable("g_category") String g_category) {
	ResponseEntity<Map<String, Object>> entity = null;
    Map<String, Object> map = new HashMap<String, Object>();
    List<GroupVO> gVO;
    try {
      Object obj=session.getAttribute("login");
		if(obj!=null) {
			UserVO uVO=(UserVO)obj;
			gVO = service.groupListCategory(uVO.getU_no(),g_category);
			map.put("gVO",gVO);
		}
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
    return entity;
  }

}
