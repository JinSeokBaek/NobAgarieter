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

import com.nob.domain.LikeVO;
import com.nob.service.BoardService;
import com.nob.service.ReplyService;

@RestController
@RequestMapping("/likeReply")
public class LikeReplyController {
	
  @Inject
  private ReplyService Rservice;
  @Inject
  private BoardService Bservice;
 
  //Copy All 
  
  private static final Logger logger = LoggerFactory.getLogger(LikeController.class);
  
  @RequestMapping(value = "", method = RequestMethod.POST)
  public ResponseEntity<String> register(@RequestBody LikeVO lVO) {

    ResponseEntity<String> entity = null;
    try {
    	LikeVO vo = Bservice.liketest(lVO);
    	int test = vo.getT_total();
    	if(test > 0) {
    		logger.info("ì¤‘ë³µì¤‘ë³µ");
    		entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
    	}else {
    	
    	Bservice.likeReplyInsert(lVO);
    	entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    	}
      
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }
  
  
  @RequestMapping(value = "/{tbl_name}/{l_bno}/{u_no}", method = RequestMethod.DELETE)
  public ResponseEntity<String> remove(@PathVariable("tbl_name") String tbl_name, @PathVariable("l_bno") Integer l_bno,
		  @PathVariable("u_no") Integer u_no) {

    ResponseEntity<String> entity = null;
    try {
    	logger.info(l_bno + "Ãâ·Â");
    	Bservice.likeReplyDelete(tbl_name, l_bno, u_no);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }



  @RequestMapping(value = "/{tbl_name}/{l_bno}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
      @PathVariable("tbl_name") String tbl_name,
      @PathVariable("l_bno") Integer l_bno) {
	  
	 
   ResponseEntity<Map<String, Object>> entity = null;
    
    try {
      Map<String, Object> map = new HashMap<String, Object>();
      List<LikeVO> list;
      
      list = Bservice.likeReplyTotal(tbl_name, l_bno);
      
      map.put("list", list);
      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
      logger.info(entity.toString()+"***********=entity");
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

}
