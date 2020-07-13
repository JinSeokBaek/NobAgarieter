package com.nob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.nob.domain.Criteria;
import com.nob.domain.GroupReplyVO;
import com.nob.domain.PageMaker;
import com.nob.domain.ReplyVO;
import com.nob.service.BoardService;
import com.nob.service.GroupReplyService;
import com.nob.service.ReplyService;

@RestController
@RequestMapping("/groupReplies/*")
public class GroupReplyController {
	
  @Inject
  private ReplyService Rservice;
  @Inject
  private BoardService Bservice;
  @Inject
  private GroupReplyService GRservice;
  
  private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
  
  @RequestMapping(value = "", method = RequestMethod.POST)
  public ResponseEntity<String> register(@RequestBody GroupReplyVO grVO) {

    ResponseEntity<String> entity = null;
    try {
    	GRservice.create(grVO);
    	
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/all/{gb_no}", method = RequestMethod.GET)
  public ResponseEntity<List<ReplyVO>> list(@PathVariable("gb_no") Integer gb_no) {

    ResponseEntity<List<ReplyVO>> entity = null;
    try {
      entity = new ResponseEntity<>(GRservice.list(gb_no), HttpStatus.OK);
      
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    return entity;
  }

  @RequestMapping(value = "/{gr_id}", method = { RequestMethod.PUT, RequestMethod.PATCH })
  public ResponseEntity<String> update(@PathVariable("gr_id") Integer gr_id, @RequestBody GroupReplyVO grVO) {

    ResponseEntity<String> entity = null;
    try {
    	grVO.setGr_id(gr_id);
    	GRservice.update(grVO);

      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/{gr_id}", method = RequestMethod.DELETE)
  public ResponseEntity<String> remove(@PathVariable("gr_id") Integer gr_id) {

    ResponseEntity<String> entity = null;
    try {
    	GRservice.delete(gr_id);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }


  
 /* @RequestMapping(value = "/{gb_no}/{u_no}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
	  @PathVariable("gb_no") Integer gb_no,
	  @PathVariable("u_no") Integer u_no,
      @PathVariable("page") Integer page) {
	  
	  logger.info(gb_no+""+page);
    ResponseEntity<Map<String, Object>> entity = null;
    
    try {
      
      Criteria cri = new Criteria();
      cri.setPage(page);

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);

      Map<String, Object> map = new HashMap<String, Object>();
      List<ReplyVO> list = GRservice.listPage(gb_no, u_no, cri);

      map.put("list", list);

      int replyCount = GRservice.count(gb_no);
      pageMaker.setTotalCount(replyCount);

      map.put("pageMaker", pageMaker);

      Bservice.replycntupdate();
      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }*/

  @RequestMapping(value = "/{gb_no}/{u_no}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
	  @PathVariable("gb_no") Integer gb_no,
	  @PathVariable("u_no") Integer u_no,
      @PathVariable("page") Integer page) {
	  
	  logger.info(gb_no+""+page);
    ResponseEntity<Map<String, Object>> entity = null;
    
    try {
      
      Criteria cri = new Criteria();
      cri.setPage(page);

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);

      Map<String, Object> map = new HashMap<String, Object>();
      List<ReplyVO> list = GRservice.listPage(gb_no, u_no, cri);

      map.put("list", list);

      int replyCount = GRservice.count(gb_no);
      pageMaker.setTotalCount(replyCount);

      map.put("pageMaker", pageMaker);

     /* Bservice.replycntupdate();*/
      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }
}
