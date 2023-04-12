package com.team.nexus.issue.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.nexus.issue.model.service.IssueServiceImpl;
import com.team.nexus.issue.model.vo.Issue;

@Controller
public class IssueController {

	@Autowired
	private IssueServiceImpl iService;
	
	
	@RequestMapping("issueShow.mini")
	public String issueList() {
		return "issue/issueList";
	}
	
	
	@RequestMapping("issueEnroll.mini")
	public String issueEnrollForm() {
		return "issue/issueEnrollView";
	}
	
	
	
	@RequestMapping("issueDetail.mini")
	public String selectBoard(int ino, Model model) {
		
		
//			Issue is = iService.selectIssue(ino);
//			
//			if( is != null) {
//				model.addAttribute("is",is);
//				return "issue/issueDetail";
//			}else {
//				model.addAttribute("errorMsg", "이슈 상세 페이지 보기 실패!");
//				return "common/errorPage";
//				
//			}
		

		return "issue/issueDetail";
		
	}
	
}
