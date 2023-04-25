package com.team.nexus.pr.controller;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.nexus.news.model.vo.News;
import com.team.nexus.pr.model.dao.PersonalDao;
import com.team.nexus.pr.model.service.PersonalPrService;
import com.team.nexus.pr.model.service.PersonalPrServiceImpl;
import com.team.nexus.pr.model.vo.PageInfo;
import com.team.nexus.pr.model.vo.Pagination;
import com.team.nexus.pr.model.vo.PersonalPr;

@Controller
public class PersonalPrController {
	
//	@Autowired
//	private PersonalPrService personalPrService;
	
	/*
	 * @Autowired private PersonalDao personalDao;
	 */
	@Autowired
	private PersonalPrServiceImpl pService;
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	/*
	 * public ArrayList<PersonalPr> selectList() { return
	 * PersonalDao.selectList(sqlsession); }
	 */
	
	@RequestMapping("personal.me")
	public ModelAndView selectPrList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = pService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<PersonalPr> personalPrList = pService.selectPersonalPr(pi);
		
		
		
		mv.addObject("pi", pi).addObject("personalPrList", personalPrList).setViewName("pr/personalPr");
		
		
		return mv;
		
		/*return "pr/personalPr";*/
	}
	
	
	/*
	 * @RequestMapping("insertPersonalPr") public void insertPersonalPr() {
	 * 
	 * }
	 */
	
	
	
	
	
	
	
	
	@RequestMapping("enrollPsnPr.pr")
	public String enrollPsnPr() {
		return "pr/enrollPsnPr";
	}
	
	
	
	
	
	
	


}
