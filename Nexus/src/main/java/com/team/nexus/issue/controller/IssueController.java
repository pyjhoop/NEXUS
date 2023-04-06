package com.team.nexus.issue.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.nexus.issue.model.service.IssueServiceImpl;

@Controller
public class IssueController {

	@Autowired
	private IssueServiceImpl iService;
	
	
	@RequestMapping("issueShow.mini")
	public String issueList() {
		return "issue/issueList";
	}
	
}
