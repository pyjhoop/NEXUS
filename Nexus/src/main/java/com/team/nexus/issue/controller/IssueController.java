package com.team.nexus.issue.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team.nexus.issue.model.service.IssueServiceImpl;
import com.team.nexus.issue.model.vo.GitIssue;
import com.team.nexus.member.model.vo.Member;

@Controller
public class IssueController {

	@Autowired
	private IssueServiceImpl iService;

	
	

	@RequestMapping(value="issueShow.mini", produces="application/json; charset=utf-8")
	public String issueList(HttpSession session,Member m ,Model model, @RequestParam(required = false) String state) throws IOException {
		
		
//		/*
		String token = ((Member)(session.getAttribute("loginUser"))).getToken();
		
//		String OWNER = "";	// 레파지토리 작성자
//		String REPO = ""; // 레파지토리
//		
//		String url = " https://api.github.com/repos/" + OWNER + "/" + REPO + "/issues";
		
		String url = "";
		
	
		if(state != null) {
			 url = "https://api.github.com/repos/pyjhoop/NEXUS/issues?state=" + state;
		}else {
			url = "https://api.github.com/repos/pyjhoop/NEXUS/issues?state=open";
		}
		
		
		
		
		URL requestUrl = new URL(url);
		
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		urlConnection.setRequestProperty("Authorization", "Bearer "+token);
		
		urlConnection.setRequestMethod("GET");
		
		
		 BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
	      
	      String line;
	      String responseText="";
	      
	      while((line = br.readLine()) !=null) {
	         responseText += line;
	      }
		
		
//	      System.out.println(responseText);
	      
	      JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
	      
//	      System.out.println(arr);
	      
	      
	      ArrayList<GitIssue> list = new ArrayList<GitIssue>();
	      
	      for(int i=0; i<arr.size(); i++) {
  	  
	    	  
	    	// Inside the for loop
	    	  GitIssue git = new GitIssue();

	    	  // Set title
	    	  git.setTitle(arr.get(i).getAsJsonObject().get("title").getAsString());

	    	  // Set labels (as an array of strings)
	    	  JsonArray labelsArr = arr.get(i).getAsJsonObject().get("labels").getAsJsonArray();
	    	  String[] labels = new String[labelsArr.size()];
	    	  for (int j = 0; j < labelsArr.size(); j++) {
	    	      labels[j] = labelsArr.get(j).getAsJsonObject().get("name").getAsString();
	    	  }
	    	  git.setLabels(labels);

	    	  // Set state
	    	  git.setState(arr.get(i).getAsJsonObject().get("state").getAsString());

	    	  // Set milestone
	    	  JsonElement milestoneElem = arr.get(i).getAsJsonObject().get("milestone");
	    	  if (!milestoneElem.isJsonNull()) {
	    	      JsonObject milestoneObj = milestoneElem.getAsJsonObject();
	    	      git.setMilestone(milestoneObj.get("title").getAsString());
	    	  }

	    	  // Set number
	    	  git.setNumber(arr.get(i).getAsJsonObject().get("number").getAsInt());

	    	  // Set assignees (as an array of strings)
//	    	  JsonArray assigneesArr = arr.get(i).getAsJsonObject().get("assignees").getAsJsonArray();
//	    	  String[] assignees = new String[assigneesArr.size()];
//	    	  for (int j = 0; j < assigneesArr.size(); j++) {
//	    	      JsonObject assigneeObj = assigneesArr.get(j).getAsJsonObject();
//	    	      assignees[j] = assigneeObj.get("login").getAsString();
//	    	  }
//	    	  git.setAssignees(assignees);
	    	  
	    	  
	    	// Set assignees (as an array of strings)
	    	  JsonArray assigneesArr = arr.get(i).getAsJsonObject().get("assignees").getAsJsonArray();
	    	  String[] assignees = new String[assigneesArr.size()];
	    	  String[] assigneeProfiles = new String[assigneesArr.size()]; // 이슈 담당자 프로필
	    	  for (int j = 0; j < assigneesArr.size(); j++) {
	    	      JsonObject assigneeObj = assigneesArr.get(j).getAsJsonObject();
	    	      assignees[j] = assigneeObj.get("login").getAsString();
	    	      assigneeProfiles[j] = assigneeObj.get("avatar_url").getAsString(); // 이슈 담당자 프로필
	    	  }
	    	  git.setAssignees(assignees);
	    	  git.setAssigneeProfiles(assigneeProfiles); // 이슈 담당자 프로필 설정

	    	  
	    	  
	    	  

	    	 
	    	// Set createdAt (with only the date)
	    	  String createdDateTimeString = arr.get(i).getAsJsonObject().get("created_at").getAsString();
	    	  LocalDateTime createdDateTime = LocalDateTime.parse(createdDateTimeString, DateTimeFormatter.ISO_DATE_TIME);
	    	  String createdDateString = createdDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	    	  git.setCreatedAt(createdDateString);

	    	  
	    	  
	    	  
	    	  
	    	  // Set updatedAt
	    	  git.setUpdatedAt(arr.get(i).getAsJsonObject().get("updated_at").getAsString());

	    	  // Set closedAt (if it's not null)
	    	  JsonElement closedAtElem = arr.get(i).getAsJsonObject().get("closed_at");
	    	  if (!closedAtElem.isJsonNull()) {
	    	      git.setClosedAt(closedAtElem.getAsString());
	    	  }

	    	  // Set issueId
	    	  git.setIssudId(arr.get(i).getAsJsonObject().get("id").getAsString());

	    	  // Set user (as a string)
	    	  JsonObject userObj = arr.get(i).getAsJsonObject().get("user").getAsJsonObject();
	    	  git.setUser(userObj.get("login").getAsString());

	    	// Set user profile
	    	  String userProfileUrl = userObj.get("avatar_url").getAsString();
	    	  git.setProfile(userProfileUrl);

	    	  list.add(git);
	      }
	      
	      model.addAttribute("list", list);
	      
		
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
