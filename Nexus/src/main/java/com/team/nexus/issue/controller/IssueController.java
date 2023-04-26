package com.team.nexus.issue.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team.nexus.issue.model.service.IssueServiceImpl;
import com.team.nexus.issue.model.vo.GitIssue;
import com.team.nexus.issue.model.vo.Label;
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.repository.model.service.RepositoryService;

@Controller
public class IssueController {

	@Autowired
	private IssueServiceImpl iService;
	
	@Autowired
	private RepositoryService repoService;
	

	@RequestMapping(value = "issueShow.mini", produces = "application/json; charset=utf-8")
	public String issueList(HttpSession session, Member m, Model model, @RequestParam(required = false) String state)
			throws IOException {

		String repository = (String)session.getAttribute("repository");
		
//		연준이 코드
		
		
		String url3 = repository + "/labels";
        
		
        String labelResponse = repoService.getGitContentsByGet(url3, session);
        
        
        
        ObjectMapper obj = new ObjectMapper();
        JsonNode jsonNode;
        
        jsonNode = obj.readTree(labelResponse);
        
        ArrayList<Label> lList = new ArrayList<Label>();
        
        for(int i = 0; i<jsonNode.size(); i++) {
           
           
           String id = jsonNode.get(i).get("id").asText();
           String name = jsonNode.get(i).get("name").asText();
           String color = jsonNode.get(i).get("color").asText();
           String description = jsonNode.get(i).get("description").asText();
           
           Label l = new Label(id, name, color, description);
           lList.add(l);
        }
		
		
		
		
		String token = ((Member) (session.getAttribute("loginUser"))).getToken();


		String url = "";
		
		
		
		
		if (state != null) {
			url = "https://api.github.com/repos/" + repository + "/issues?state=" + state;
		} else {
			url = "https://api.github.com/repos/" + repository + "/issues?state=open";
		}

		URL requestUrl = new URL(url);

		HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();

		urlConnection.setRequestProperty("Authorization", "Bearer " + token);

		urlConnection.setRequestMethod("GET");

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));

		String line;
		String responseText = "";

		while ((line = br.readLine()) != null) {
			responseText += line;
		}

//	      System.out.println(responseText);

		JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();

//	      System.out.println(arr);

		ArrayList<GitIssue> list = new ArrayList<GitIssue>();

		for (int i = 0; i < arr.size(); i++) {

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
		model.addAttribute("lList", lList);

		return "issue/issueList";
	}

	@RequestMapping("issueEnroll.mini")
	public String issueEnrollForm(HttpSession session, Model model) throws IOException, IOException {
		
		
		

		String repository = (String)session.getAttribute("repository");
		
//		연준이 코드
		
		
		String url3 = repository + "/labels";
        
		
        String labelResponse = repoService.getGitContentsByGet(url3, session);
        
        
        
        ObjectMapper obj = new ObjectMapper();
        JsonNode jsonNode;
        
        jsonNode = obj.readTree(labelResponse);
        
        ArrayList<Label> lList = new ArrayList<Label>();
        
        for(int i = 0; i<jsonNode.size(); i++) {
           
           
           String id = jsonNode.get(i).get("id").asText();
           String name = jsonNode.get(i).get("name").asText();
           String color = jsonNode.get(i).get("color").asText();
           String description = jsonNode.get(i).get("description").asText();
           
           Label l = new Label(id, name, color, description);
           lList.add(l);
        }
		
		
		model.addAttribute("lList", lList);
		
		return "issue/issueEnrollView";
	}

	
	@RequestMapping(value = "createIssue.mi", produces = "application/json; charset=utf-8")
	public String insertIssue(@RequestParam String title, @RequestParam(required = false) String body,
			@RequestParam(required = false) String assignees, HttpSession session) {

		String token = ((Member) (session.getAttribute("loginUser"))).getToken();

//		https://api.github.com/repos/{owner}/{repo}/issues 변수로 각 받아와서 코드 수정해야함
		
		
		String repository = (String)session.getAttribute("repository");
		
		
		String apiUrl = "https://api.github.com/repos/" + repository + "/issues";

		// Create a JSON object for the issue payload
		JSONObject issueJson = new JSONObject();
		issueJson.put("title", title);
		issueJson.put("body", body);
		JSONArray assigneesArray = new JSONArray();
//		### 라벨만 있으면 에러나서 주석처리함
		//assigneesArray.add(assignees);
		// issueJson.put("assignees", assigneesArray);
		

		

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + token);
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<String>(issueJson.toString(), headers);

		// Send a POST request to the GitHub API
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);
		HttpStatus responseStatus = responseEntity.getStatusCode();

		if (responseStatus != HttpStatus.CREATED) {
			throw new RuntimeException("Failed to create issue on GitHub API: " + responseStatus.toString());
		}

		return "redirect:issueShow.mini";
	}

	
	
	@RequestMapping(value="issueDetail.mini", produces = "application/json; charset=utf-8")
	public String selectIssue(@RequestParam String ino, HttpSession session, Model model) {
	    try {
	        String token = ((Member) session.getAttribute("loginUser")).getToken();
	        
	        
	    	String repository = (String)session.getAttribute("repository");
	    	
	    	
	    	
//			연준이 코드
			
			
			String url3 = repository + "/labels";
	        
			System.out.println(url3);
			
	        String labelResponse = repoService.getGitContentsByGet(url3, session);
	        
	        
	        
	        ObjectMapper obj = new ObjectMapper();
	        JsonNode jsonNode;
	        
	        jsonNode = obj.readTree(labelResponse);
	        
	        ArrayList<Label> lList = new ArrayList<Label>();
	        
	        for(int i = 0; i<jsonNode.size(); i++) {
	           
	           
	           String id = jsonNode.get(i).get("id").asText();
	           String name = jsonNode.get(i).get("name").asText();
	           String color = jsonNode.get(i).get("color").asText();
	           String description = jsonNode.get(i).get("description").asText();
	           
	           Label l = new Label(id, name, color, description);
	           lList.add(l);
	        }
	    	
	    	
			
			String apiUrl = "https://api.github.com/repos/" + repository + "/issues/" +ino;
			
			

	        RestTemplate restTemplate = new RestTemplate();
	        HttpHeaders headers = new HttpHeaders();
	        headers.set("Authorization", "Bearer " + token);
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        HttpEntity<String> requestEntity = new HttpEntity<>("", headers);
	        ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity, String.class);
	        HttpStatus responseStatus = responseEntity.getStatusCode();

	        if (responseStatus != HttpStatus.OK) {
	            throw new RuntimeException("Failed to retrieve issue data from GitHub API: " + responseStatus.toString());
	        }

	        Gson gson = new GsonBuilder().setLenient().create();
	        JsonObject issueJson = gson.fromJson(responseEntity.getBody(), JsonObject.class);
	        String title = issueJson.get("title").getAsString();

	        // body branch processing null date
	        JsonElement bodyElement = issueJson.get("body");
	        String body = (bodyElement != null && !bodyElement.isJsonNull()) ? bodyElement.getAsString() : null;

	        String state = issueJson.get("state").getAsString();

	        // Retrieve assignees array
	        JsonArray assigneesArray = issueJson.getAsJsonArray("assignees");
	        
	        ArrayList<Member> list = new ArrayList<Member>();
	        
	        
	        if (assigneesArray != null) {
	            for (JsonElement assigneeElement : assigneesArray) {
	                JsonObject assigneeObject = assigneeElement.getAsJsonObject();
	                
	                String userName = assigneeObject.get("login").getAsString();
	                String assigneeProfiles = assigneeObject.get("avatar_url").getAsString();
	                
	                Member m = new Member();
	                
	                m.setUserName(userName);
	                m.setProfile(assigneeProfiles);
	                
	                list.add(m);
	                
	               
	                
//	                String assigneeLogin = assigneeObject.get("login").getAsString();
//	                assignees.add(assigneeLogin);
//	                assigneeProfiles.add(assigneeObject.get("avatar_url").getAsString());
	            }
	            
//	            System.out.println(list);
	        }


	        // Retrieve labels array
	        JsonArray labelsArray = issueJson.getAsJsonArray("labels");
	        List<String> labels = new ArrayList<>();
	        if (labelsArray != null) {
	            for (JsonElement labelElement : labelsArray) {
	                JsonObject labelObject = labelElement.getAsJsonObject();
	                String labelName = labelObject.get("name").getAsString();
	                labels.add(labelName);
	            }
	        }

	        // Retrieve issue manager's profile
	        JsonObject userObject = issueJson.getAsJsonObject("user");
	        String issueManagerName = userObject.get("login").getAsString();
//	        String assigneeProfiles = userObject.get("avatar_url").getAsString();

	        model.addAttribute("title", title);
	        model.addAttribute("body", body);
	        model.addAttribute("state", state);
	        model.addAttribute("ino", ino);
//	        model.addAttribute("assignees", assignees);
	        model.addAttribute("labels", labels);
	        model.addAttribute("issueManagerName", issueManagerName);
//	        model.addAttribute("assigneeProfiles", assigneeProfiles);
	        
	        
	 
	        return "issue/issueDetail";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "common/error500";
	    }
	}


	
	
	
	@RequestMapping(value = "issueState.mi", produces = "application/json; charset=utf-8")
	public String updateStateIssue(@RequestParam int ino, @RequestParam String state, HttpSession session) {

	    String token = ((Member) session.getAttribute("loginUser")).getToken();
    	String repository = (String)session.getAttribute("repository");
		
		String apiUrl = "https://api.github.com/repos/" + repository + "/issues/" +ino;

	    // code for changing issue status
	    JsonObject json = new JsonObject();
	    json.addProperty("state", state);
	    String jsonStr = json.toString();

	    HttpClient client = HttpClient.newBuilder()
	            .version(HttpClient.Version.HTTP_1_1)
	            .build();

	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(apiUrl))
	            .header("Authorization", "Bearer " + token)
	            .header("Content-Type", "application/json")
	            .method("PATCH", HttpRequest.BodyPublishers.ofString(jsonStr))
	            .build();

	    try {
	        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
	        System.out.println(response.body());
	    } catch (IOException | InterruptedException e) {
	        e.printStackTrace();
	    }

	    return "redirect:issueShow.mini";
	}



	@RequestMapping(value="updateIssue.mi", produces = "application/json; charset=utf-8")
	public String updateIssue(@RequestParam String title, @RequestParam(required = false) String body,
			@RequestParam(required = false) String assignees, HttpSession session) {
		
		
		String token = ((Member) (session.getAttribute("loginUser"))).getToken();

//		https://api.github.com/repos/{owner}/{repo}/issues 변수로 각 받아와서 코드 수정해야함
		
		
		String repository = (String)session.getAttribute("repository");
		
		
		String apiUrl = "https://api.github.com/repos/" + repository + "/issues";

		// Create a JSON object for the issue payload
		JSONObject issueJson = new JSONObject();
		issueJson.put("title", title);
		issueJson.put("body", body);
		JSONArray assigneesArray = new JSONArray();
		//assigneesArray.add(assignees);
		// issueJson.put("assignees", assigneesArray);
		

		

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + token);
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<String>(issueJson.toString(), headers);

		// Send a POST request to the GitHub API
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);
		HttpStatus responseStatus = responseEntity.getStatusCode();

		if (responseStatus != HttpStatus.CREATED) {
			throw new RuntimeException("Failed to create issue on GitHub API: " + responseStatus.toString());
		}
		
		
		
		return "redirect:issueShow.mini";
	}
	
	
}
