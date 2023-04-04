package com.team.nexus.pr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalPrController {
	
	@RequestMapping("personal.me")
	public String persoanlPr() {
		return "pr/personalPr";
	}


}
