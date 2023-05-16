package com.team.nexus.milestone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.nexus.issue.model.service.IssueService;
import com.team.nexus.issue.model.vo.GitIssue;
import com.team.nexus.issue.model.vo.Issue;
import com.team.nexus.issue.model.vo.Label;
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.milestone.model.service.MilestoneService;
import com.team.nexus.milestone.model.vo.GitMilestone;

@Controller
public class MilestoneController {
	
	@Autowired
	private MilestoneService mService;
	
	@Autowired
	private IssueService iService;
	
	@RequestMapping(value = "milestoneList", produces = "application/json; charset=utf-8")
	public String milestoneList(HttpSession session, Member m, Model model, @RequestParam(required = false) 
	String state,@RequestParam(required = false) String issue,@RequestParam(required = false) String author,
	@RequestParam(required = false) String token,
	@RequestParam(required = false) String assign,
	@RequestParam(required = false) String label,
	@RequestParam(required = false)  String authorName,@RequestParam(required = false) 
	String newTitle ,@RequestParam(required = false) String milestoneNumber ,@RequestParam(required = false) String userObject) throws IOException {

		String repository = (String) session.getAttribute("repository");

		List<GitIssue> mList = iService.getIssues( repository, token,  state,  assign,  label);

		String token1 = ((Member) (session.getAttribute("loginUser"))).getToken();

		List<GitMilestone> list;

	    
	        list = mService.getMilestones(repository, token1, state,  issue);

			
			 model.addAttribute("list", list); 
			 model.addAttribute("mList", mList);
			 
		


		return "milestone/milestoneList";
	}

}
