package com.team.nexus.pr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.nexus.pr.model.service.PersonalPrService;
import com.team.nexus.pr.model.vo.PersonalPr;

@Controller
public class PersonalPrController {
	
//	@Autowired
//	private PersonalPrService personalPrService;
	
	@RequestMapping("personal.me")
	public String persoanlForm() {
		return "pr/personalPr";
	}
	
	@RequestMapping("enrollPsnPr.pr")
	public String enrollPsnPr() {
		return "pr/enrollPsnPr";
	}
	
	/*
	 * @RequestMapping("newsEnrollForm.p") public String newsEnrollFormPage(Model
	 * model) { model.addAttribute("status", "E"); // E: Enroll return
	 * "news/newsEnrollForm"; }
	 */
	
	/*
	 * @RequestMapping("insertPersonalPr") public String insertPersonalPr(PersonalPr
	 * P) {
	 * 
	 * 
	 * }
	 */
	
	
	
	
	


}
