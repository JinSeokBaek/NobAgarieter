package com.nob.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nob.domain.BoardVO;
import com.nob.domain.Criteria;
import com.nob.domain.PageMaker;
import com.nob.domain.SearchCriteria;
import com.nob.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String event(Model model,@ModelAttribute("cri") SearchCriteria cri) throws Exception {
		String tbl_name="tbl_event";
		
		model.addAttribute("list", service.listSearchCriteria(cri,tbl_name));
		model.addAttribute("tbl_name",tbl_name);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri,tbl_name));
		model.addAttribute("pageMaker", pageMaker);
		
		return "/board/event";
	}
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Model model,@ModelAttribute("cri") SearchCriteria cri) throws Exception {
		String tbl_name="tbl_notice";
		model.addAttribute("newAll",service.newAll());
		model.addAttribute("likeTotalAll",service.likeTotalAll());
		model.addAttribute("list", service.listSearchCriteria(cri,tbl_name));
		model.addAttribute("tbl_name",tbl_name);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri,tbl_name));
		model.addAttribute("pageMaker", pageMaker);
		return "/board/notice";
	}
	
	@RequestMapping(value = "/registerNE", method = RequestMethod.GET)
	  public void registNEGET(Model model,@RequestParam("tbl_name") String tbl_name) throws Exception {
		model.addAttribute("tbl_name",tbl_name);
		model.addAttribute("newAll",service.newAll());
		model.addAttribute("likeTotalAll",service.likeTotalAll());
		
	    logger.info("regist get ...........");
	  }
	 @RequestMapping(value = "/registerNE", method = RequestMethod.POST)
	  public String registNEPOST(BoardVO bVO,@RequestParam("tbl_name2") String tbl_name, RedirectAttributes rttr) throws Exception {
	    String loca="notice";
		 service.regist(bVO,tbl_name);
	    if(tbl_name.equals("tbl_event")){
	    	loca="event";
	    }
	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/board/"+loca+"";
	  }	
	
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String allBoard(@ModelAttribute("cri") SearchCriteria cri, Model model,@RequestParam("tbl_name") String tbl_name) throws Exception {
		if(tbl_name.equals("tbl_stiboard")){
				cri.setPerPageNum(6);
				}
		else if(tbl_name.equals("tbl_tipboard")){
					cri.setPerPageNum(4);
				};
		model.addAttribute("list", service.listSearchCriteria(cri,tbl_name));
		model.addAttribute("tbl_name",tbl_name);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri,tbl_name));
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("like",service.likeTotal(tbl_name));
		
		model.addAttribute("hash",service.hashBoard(tbl_name));
		return "/board/listAll";
	}
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	  public void read(@RequestParam("tbl_name") String tbl_name,@RequestParam("b_no") int b_no, @ModelAttribute("cri") SearchCriteria cri, Model model)
	      throws Exception {
		
	    model.addAttribute(service.read(b_no,tbl_name));
	    model.addAttribute("tbl_name",tbl_name);
	    model.addAttribute("b_no",b_no);
	    model.addAttribute("like2",service.likeTotal(tbl_name));
		model.addAttribute("hash",service.hashBoard(tbl_name));
	    
	    int l_bno = b_no;
		 
	    model.addAttribute("like",service.likeReadTotal(tbl_name, l_bno));
	    
	   model.addAttribute("l_total2",service.likeReadTotal(tbl_name, l_bno));
	    logger.info(service.likeReadTotal(tbl_name, l_bno).toString());
	  }
	  
	  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	  public String modifyPagingPOST(@RequestParam("tbl_name") String tbl_name,BoardVO bVO, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("modifyPP : "+bVO.toString());
		logger.info("tbl_name : "+tbl_name);
	    logger.info(cri.toString());
	    service.modify(bVO,tbl_name);

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    rttr.addAttribute("tbl_name",tbl_name);
	    
	    rttr.addFlashAttribute("msg", "SUCCESS");

	    logger.info(rttr.toString());

	    return "redirect:/board/listAll";
	  }
	  
	  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	  public void modifyPagingGET(@RequestParam("tbl_name") String tbl_name,int b_no, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		model.addAttribute("like",service.likeTotal(tbl_name));
		model.addAttribute("hash",service.hashBoard(tbl_name));
	    model.addAttribute(service.read(b_no,tbl_name));
	    model.addAttribute("tbl_name",tbl_name);
	  }
	  
	  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
	  public String remove(@RequestParam("tbl_name") String tbl_name,@RequestParam("b_no") int b_no, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

	    service.remove(b_no,tbl_name);

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    rttr.addAttribute("tbl_name",tbl_name);
	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/board/listAll";
	  }
	  
	  @RequestMapping(value = "/register", method = RequestMethod.GET)
	  public void registGET(Model model,@RequestParam("tbl_name") String tbl_name) throws Exception {
		model.addAttribute("tbl_name",tbl_name);
		model.addAttribute("like",service.likeTotal(tbl_name));
		model.addAttribute("hash",service.hashBoard(tbl_name));
		
	    logger.info("regist get ...........");
	  }

	  @RequestMapping(value = "/register", method = RequestMethod.POST)
	  public String registPOST(BoardVO bVO,@RequestParam("tbl_name2") String tbl_name, RedirectAttributes rttr) throws Exception {

	    logger.info("regist post ...........");
	    logger.info(bVO.toString());
	    logger.info(tbl_name);
	    String b_category=bVO.getB_category().substring( 0,bVO.getB_category().length()-1 );
	    logger.info("sub:"+b_category);
	    bVO.setB_category(b_category);
	    service.regist(bVO,tbl_name);

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/board/listAll?tbl_name="+tbl_name+"";
	  }

}
