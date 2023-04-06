package com.team.nexus.pr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalPrController {
	
	@RequestMapping("personal.me")
	public String persoanlForm() {
		return "pr/personalPr";
	}
	
	@RequestMapping("enrollPsnPr.pr")
	public String enrollPsnPr() {
		return "pr/enrollPsnPr";
	}


}
