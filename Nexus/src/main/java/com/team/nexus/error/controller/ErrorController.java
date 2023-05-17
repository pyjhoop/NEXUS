package com.team.nexus.error.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	
	@RequestMapping("error500")
	public String Error500() {
		return "common/error500";
	}
	@RequestMapping("error404")
	public String Error404() {
		return "common/error404";
	}

}
