package com.team.nexus.issue.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	@RequestMapping("issueEnroll.mini")
	public String issueEnrollForm() {
		return "issue/issueEnrollView";
	}
	
	
	
	@RequestMapping("issueDetail.mini")
	public String selectIssue(int ino, Model model) {
		
		
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
	
	
	
	@RequestMapping("issueDelete.mini")
	public String deleteIssue(HttpSession session) {
		session.setAttribute("alertMsg", "성공적으로 이슈가 삭제되었습니다");
		
		return "redirect:issueShow.mini";
	}
	
	
	
	
	
	
	
	
	
}
