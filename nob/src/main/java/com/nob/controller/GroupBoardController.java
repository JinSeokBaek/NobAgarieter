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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nob.domain.Criteria;
import com.nob.domain.GroupBoardVO;
import com.nob.domain.GroupVO;
import com.nob.domain.PageMaker;
import com.nob.domain.SearchCriteria;
import com.nob.domain.UserVO;
import com.nob.service.BoardService;
import com.nob.service.GroupBoardService;

@Controller
@RequestMapping("/groupBoard/*")
public class GroupBoardController {
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Inject
	GroupBoardService gbService;
	private BoardService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody GroupBoardVO gbVO) {

		ResponseEntity<String> entity = null;
		try {
			gbService.create(gbVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value = "/{g_id}/{gb_no}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("gb_no") Integer gb_no, @PathVariable("g_id") Integer g_id,
			@RequestBody GroupBoardVO gbVO) {

		ResponseEntity<String> entity = null;
		try {
			gbVO.setG_id(g_id);
			gbService.update(gbVO);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	@RequestMapping(value = "/{g_id}/{gb_no}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("gb_no") Integer gb_no, @PathVariable("g_id") Integer g_id) {

		ResponseEntity<String> entity = null;
		try {
			gbService.delete(g_id, gb_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}


	
	
	//2018_07_04 modify
	@RequestMapping(value = "/{g_id}/{u_no}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("g_id") Integer g_id,
			@PathVariable("u_no") Integer u_no, @PathVariable("page") Integer page, Model model, @ModelAttribute("cri") SearchCriteria cri
	/* HttpSession session */) {

		logger.info(g_id + "" + page);
		ResponseEntity<Map<String, Object>> entity = null;

		try {

			
			cri.setPage(page);
			

			Map<String, Object> map = new HashMap<String, Object>();
			
			
		
		
			logger.info("키워드!!!!!!!!!!!!!!!!!!!!" + cri.getKeyword());
			List<GroupBoardVO> list = gbService.listPage(g_id, u_no, cri);
			logger.info(list.toString());
			logger.info("VO占쏙옙占쏙옙!");
			map.put("list", list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			

			map.put("pageMaker", pageMaker);

			/* gbService.replycntupdate(); */
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String tipBoard(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		
		return "/group/listAll";
	}
	
	

}