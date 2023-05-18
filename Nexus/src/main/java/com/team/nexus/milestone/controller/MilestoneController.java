package com.team.nexus.milestone.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
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
	
	@RequestMapping(value = "milestoneList.m", produces = "application/json; charset=utf-8")
	public String milestoneList(HttpSession session, Member m, Model model, @RequestParam(required = false) 
	String state,@RequestParam(required = false) String issue,@RequestParam(required = false) String author,
	@RequestParam(required = false) String token,
	@RequestParam(required = false) String assign,
	@RequestParam(required = false) String label,
	@RequestParam(required = false)  String authorName,@RequestParam(required = false) 
	String newTitle ,@RequestParam(required = false) String milestoneNumber ,@RequestParam(required = false) String userObject) throws IOException {

		String repository = (String) session.getAttribute("repository");

		String token1 = ((Member) (session.getAttribute("loginUser"))).getToken();

		List<GitMilestone> list;

	    
	        list = mService.getMilestones(session,repository, token1, state);
			model.addAttribute("list", list); 
			 
		


		return "milestone/milestoneList";
	}
	
	
	
	@RequestMapping(value = "milestoneDetail", produces = "application/json; charset=utf-8")
	public String milestoneDetail(@RequestParam String mno, HttpSession session, Model model, String issue, String state1) {
	    try {
	        String token = ((Member) session.getAttribute("loginUser")).getToken();
	        String repository = (String) session.getAttribute("repository");
	        
	        
	        List<GitIssue> milestoneIssues = iService.getMilestoneIssues(repository, token, mno, state1);
	        System.out.println("lllllllllllllllllllllllllllllllllllll");
	        System.out.println(milestoneIssues);

	        String apiUrl = "https://api.github.com/repos/" + repository + "/milestones/" + mno;
			/* System.out.println(apiUrl); */
	        /*https://api.github.com/repos/pyjhoop/NEXUS/milestones/6*/

	        RestTemplate restTemplate = new RestTemplate();
	        HttpHeaders headers = new HttpHeaders();
	        headers.set("Authorization", "Bearer " + token);
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        HttpEntity<String> requestEntity = new HttpEntity<>("", headers);
	        ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity, String.class);
	        HttpStatus responseStatus = responseEntity.getStatusCode();

	        if (responseStatus != HttpStatus.OK) {
	            throw new RuntimeException("Failed to retrieve milestone data from GitHub API: " + responseStatus.toString());
	        }

	        Gson gson = new GsonBuilder().setLenient().create();
	        JsonObject milestoneJson = gson.fromJson(responseEntity.getBody(), JsonObject.class);
	        String title = milestoneJson.get("title").getAsString();
	        

	        // body branch processing null date
	        JsonElement descriptionElement = milestoneJson.get("description");
	        String description = (descriptionElement != null && !descriptionElement.isJsonNull()) ? descriptionElement.getAsString() : null;
	        
	        
	        int number = milestoneJson.get("number").getAsInt();
	        String state = milestoneJson.get("state").getAsString();
	        
	        
	        GitMilestone gm = new GitMilestone();
	        
	        
	        JsonObject milestoneObject = milestoneJson.getAsJsonObject();
	        String createdAt = milestoneObject.get("created_at").getAsString();
	        OffsetDateTime offsetDateTime = OffsetDateTime.parse(createdAt, DateTimeFormatter.ISO_DATE_TIME);
	        LocalDate localDate = offsetDateTime.toLocalDate();
	        String formattedDate = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	        gm.setCreatedAt(formattedDate);
	        System.out.println(formattedDate);
	        
	        JsonObject milestoneObject1 = milestoneJson.getAsJsonObject();
	        String updatedAt = milestoneObject1.get("updated_at").getAsString();
	        OffsetDateTime offsetDateTime1 = OffsetDateTime.parse(updatedAt, DateTimeFormatter.ISO_DATE_TIME);
	        LocalDate localDate1 = offsetDateTime1.toLocalDate();
	        String formattedDate1 = localDate1.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	        gm.setUpdatedAt(formattedDate1);
	        System.out.println(formattedDate1);
	        

	        JsonElement dueOnElement = milestoneJson.getAsJsonObject().get("due_on");
	        if (dueOnElement != null && !dueOnElement.isJsonNull()) {
	            String dueOn = dueOnElement.getAsString();
	            if (!dueOn.isEmpty()) {
	                LocalDateTime dueOnDateTime = LocalDateTime.parse(dueOn, DateTimeFormatter.ISO_DATE_TIME);
	                String formattedDueOnDate = dueOnDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	                model.addAttribute("due_on", formattedDueOnDate);
	            } else {
	                model.addAttribute("due_on", null);
	            }
	        } else {
	            model.addAttribute("due_on", null);
	        }
	        
	        
	        
	        int openedIssues = milestoneJson.get("open_issues").getAsInt();
	        int closedIssues = milestoneJson.get("closed_issues").getAsInt();
	       
	        
	        
	        model.addAttribute("title", title);
	        model.addAttribute("description", description);
	        model.addAttribute("state", state);
	        model.addAttribute("number", number);
	        model.addAttribute("createdAt", formattedDate);
	        model.addAttribute("updatedAt", formattedDate1);
	        System.out.println("sdffffffffff");
	        model.addAttribute("openedIssues", openedIssues);
	        System.out.println(openedIssues);
	        model.addAttribute("closedIssues", closedIssues);
	        // number -> milestone 번호
			
			  model.addAttribute("milestoneIssues", milestoneIssues);
			 
	        
	        List<GitMilestone> list;
	        list = mService.getMilestones(session,repository, token, state);
			model.addAttribute("list", list); 
			System.out.println(list);

	        return "milestone/milestoneDetail";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "common/error500";
	    }
	}

	


}
