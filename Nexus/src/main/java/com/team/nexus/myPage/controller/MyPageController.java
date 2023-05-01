package com.team.nexus.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("selectMy.ih")
	public String selectMyPage() {
		return "member/myPage";
	}
}
