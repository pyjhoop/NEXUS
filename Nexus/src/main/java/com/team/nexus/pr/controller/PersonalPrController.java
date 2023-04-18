package com.team.nexus.pr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.nexus.pr.model.service.PersonalPrService;

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
	
	
	


}
