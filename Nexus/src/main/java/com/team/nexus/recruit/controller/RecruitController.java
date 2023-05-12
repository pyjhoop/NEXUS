package com.team.nexus.recruit.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.pr.model.vo.PageInfo;
import com.team.nexus.pr.model.vo.Pagination;
import com.team.nexus.pr.model.vo.PersonalPr;
import com.team.nexus.recruit.model.service.RecruitServiceImpl;
import com.team.nexus.recruit.model.vo.Recruit;

@Controller
public class RecruitController {

	@Autowired
	private RecruitServiceImpl rService;

	@Autowired
	private SqlSessionTemplate sqlsession;

	@RequestMapping("project.re")
	public ModelAndView selectPrList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		int listCount = rService.selectListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 20);
		ArrayList<Recruit> RecruitList = rService.selectRecruit(pi);

		mv.addObject("pi", pi).addObject("RecruitList", RecruitList).setViewName("recruit/recruit");

		return mv;

	}

	
	  @RequestMapping("enrollRecruit.re") 
	  public String enrollRecruit() { 
	  return "recruit/enrollRecruit"; }
	  
	  
	  @RequestMapping("insertRecruit") public String insertPersonalPr(Recruit re,
	  HttpSession session) {
	  
	  
	  int index = re.getPjtPrContent().lastIndexOf(",");
	  
	  re.setPjtPrContent(re.getPjtPrContent().substring(0, index));
	  
	  int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
	  
	  int result = rService.insertRecruit(re);
	  
	  System.out.println(re);
	  
	  return "redirect:project.re"; }
	  
	  
	  @RequestMapping("Recruit.re") public ModelAndView recruitDetailView(int rno,
	  ModelAndView mv) {
	  
	  System.out.println("성공0");
	  
	  int count = rService.increaseCount(rno);
	  
	  System.out.println("성공1");
	  
	  if(count > 0) {
	  
	  
	  System.out.println("성공"); 
	  Recruit r = rService.recruitDetail(rno);
	  mv.addObject("r", r).setViewName("recruit/recruitDetail");
	  
	  
	  }else { mv.addObject("errorMsg", "실패").setViewName("common/errorPage");
	  
	  
	  } return mv;
	  
	  }
	  
	  @ResponseBody
	  @RequestMapping(value = "RecruitStackArray", produces = "application/json;")
	  public String psnPrStackArray(String arrStr) { 
	  String[] strArr = arrStr.split(","); 
	  ArrayList<Recruit> reList = rService.selectRecruitAjax(strArr); 
	  System.out.println(reList);
	  
	  return new Gson().toJson(reList); }
	 

}
