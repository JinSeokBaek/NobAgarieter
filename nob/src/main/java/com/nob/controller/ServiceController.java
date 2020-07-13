package com.nob.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nob.domain.CalorieVO;
import com.nob.domain.VideoVO;
import com.nob.service.CalorieService;
import com.nob.service.VideoService;



@Controller
@RequestMapping("/service/*")
public class ServiceController {
	private static final Logger logger = LoggerFactory.getLogger(ServiceController.class);

	@Inject
	private CalorieService service;
	
	@Inject
	private VideoService service2;
	
	/**
	 * 칼로리 서비스 페이지
	 * @throws Exception 
	 */
	@RequestMapping(value = "/calorie", method = RequestMethod.GET)
	public void calorie(Model model) throws Exception {
		logger.info("calorie page");
		model.addAttribute("list", service.listAll());
	}
	
	@ResponseBody
	@RequestMapping(value = "/calorieSearch", method = RequestMethod.POST)
	public List<CalorieVO> calorieSearch(@RequestParam("keyword") String keyword) throws Exception {
		logger.info("calorie search");
		return service.autocomplete(keyword);
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void test() throws Exception {
		logger.info("test");
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCalorie", method = RequestMethod.POST)
	public CalorieVO getCalorie(@RequestParam("cno") int cno,Model model) throws Exception {
		logger.info("getCalorie");
		return service.read(cno);
	}
	
	/**
	 * 동영상 서비스 페이지
	 * @throws Exception 
	 */
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public void video(Model model) throws Exception {
		logger.info("video page");
		model.addAttribute("list", service2.listMoive());
	}
	
	@RequestMapping(value = "/video", method = RequestMethod.POST)
	public String video(VideoVO vVO,Model model) throws Exception {
		logger.info("insert Video");
		service2.create(vVO);
		return "redirect:/service/video";
	}
	
	@RequestMapping(value = "/delVideo", method = RequestMethod.POST)
	public String delVideo(@RequestParam("vid") int vid,Model model) throws Exception {
		logger.info("del Video");
		service2.delete(vid);
		return "redirect:/service/video";
	}
	
}
