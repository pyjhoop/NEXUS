package com.team.nexus.pr.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.team.nexus.member.model.vo.Member;
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
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 20);
		ArrayList<PersonalPr> personalPrList = pService.selectPersonalPr(pi);
		
		
		
		mv.addObject("pi", pi).addObject("personalPrList", personalPrList).setViewName("pr/personalPr");
		
		
		return mv;
		
		
	}
	
	@RequestMapping("enrollPsnPr.pr")
	public String enrollPsnPr() {
		return "pr/enrollPsnPr";
	}
	
	
	@RequestMapping("insertPersonalPr")
	public String insertPersonalPr(PersonalPr pr, HttpSession session) {
		
		/*
		 * int index = pr.getPsnPrContent().lastIndexOf(",");
		 * 
		 * pr.setPsnPrContent(pr.getPsnPrContent().substring(0, index));
		 */
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int result = pService.insertPersonalPr(pr); 
		
		System.out.println(pr);
		
		return "redirect:personal.me";
	}
	
	
	@RequestMapping("personalPr.bo")
	public ModelAndView personalDetailView(int pno, ModelAndView mv) { 
		
		
		int count = pService.increaseCount(pno);
		
		
		if(count > 0) {
			
			
			PersonalPr p = pService.personalPrDetail(pno);
			mv.addObject("p", p).setViewName("pr/personalPrDetail");
			
			
		}else {
			mv.addObject("errorMsg", "실패").setViewName("common/errorPage");
			
			
		}
		return mv;

	}
	
	@ResponseBody
	@RequestMapping(value = "psnPrStackArray", produces = "application/json;")
	public String psnPrStackArray(String arrStr) {
		String[] strArr = arrStr.split(",");
		ArrayList<PersonalPr> prList = pService.selectPrAjax(strArr);
		System.out.println(prList);
		
		return new Gson().toJson(prList);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}