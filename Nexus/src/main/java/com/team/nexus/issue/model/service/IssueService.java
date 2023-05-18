package com.team.nexus.issue.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpVersion;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team.nexus.issue.model.dao.IssueDao;
import com.team.nexus.issue.model.vo.GitIssue;
import com.team.nexus.issue.model.vo.Label;
import com.team.nexus.issue.model.vo.Milestone;
import com.team.nexus.member.model.vo.Member;

@Service
public class IssueService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private WebClient webClient;

	@Autowired
	private IssueService iService;

	@Autowired
	private IssueDao iDao;

	// 이외의 get, put, delete시 사용될 동기 메서드
	 public String synHttpRequest(String path, HttpSession session, String method) {
	      String token = ((Member) session.getAttribute("loginUser")).getToken();

	      WebClient client = WebClient.builder().baseUrl("https://api.github.com/repos/")
	            .defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
	            .defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
	            .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build();

	      String response = null;

	      if (method.equals("get")) {
	         response = client.get().uri(path).retrieve().bodyToMono(String.class).block();
	      } else if (method.equals("put")) {
	         response = client.put().uri(path).retrieve().bodyToMono(String.class).block();
	      } else if (method.equals("delete")) {
	         response = client.delete().uri(path).retrieve().bodyToMono(String.class).block();
	      }

	      return response;
	   }

	   public String gitPatchMethod(String path, HttpSession session, String title, String body, int ino) {

	      // RestTemplate restTemplate = new RestTemplate();
	      // PATCH 메소드를 사용하기 위해 필요한 HttpClient 버전이 낮기 때문에 발생하는 문제

	      HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
	      requestFactory.setHttpClient(HttpClients.createDefault());
	      RestTemplate restTemplate = new RestTemplate(requestFactory);

	      HttpHeaders headers = new HttpHeaders();
	      headers.setBearerAuth((((Member) (session.getAttribute("loginUser"))).getToken()));
	      headers.setContentType(MediaType.APPLICATION_JSON);
	      String url = "https://api.github.com/repos/" + path + "/" + ino;

	      System.out.println(url);

	      // Create a JSON object for the issue payload
	      JSONObject issueJson = new JSONObject();
	      issueJson.put("title", title);
	      issueJson.put("body", body);

	      HttpEntity<String> entity = new HttpEntity<String>(issueJson.toString(), headers);

	      ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PATCH, entity, String.class);

	      return response.getBody();
	   }

	   public List<GitIssue> getIssues(String repository, String token, String state, String assign, String label,
	         Integer page)
	         throws IOException {

	      String url = "";

	      if (state != null) {

	         if (page == null) {
	            url = "https://api.github.com/repos/" + repository + "/issues?state=" + state + "&page=1";
	         } else {
	            url = "https://api.github.com/repos/" + repository + "/issues?state=" + state + "&page=" + page;
	         }
	      } else {
	         url = "https://api.github.com/repos/" + repository + "/issues?state=open";

	         if (page != null) {

	            url = "https://api.github.com/repos/" + repository + "/issues?state=open&page=" + page;
	         }
	      }

	      URL requestUrl = new URL(url);

	      HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();

	      urlConnection.setRequestProperty("Authorization", "Bearer " + token);
	      urlConnection.setRequestMethod("GET");

	      
	      // 인코딩 깨질때 사용하기 utf-8
	      BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));

	      String line;
	      String responseText = "";

	      while ((line = br.readLine()) != null) {
	         responseText += line;
	      }

	      JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
	      ArrayList<GitIssue> list = new ArrayList<GitIssue>();

	      for (int i = 0; i < arr.size(); i++) {
	         JsonObject issueObj = arr.get(i).getAsJsonObject();
	         GitIssue git = createGitIssueFromJsonObject(issueObj);
	         list.add(git);
	      }
	      return list;
	   }
	   
	   public List<GitIssue> getMilestoneIssues(String repository, String token, String  mno, String state1) throws IOException {
			//https://api.github.com/repos/pyjhoop/NEXUS/issues?milestone=6
			//https://api.github.com/repos/pyjhoop/NEXUS/issues?milestone=9/state=open
		    String url = "https://api.github.com/repos/" + repository + "/issues?milestone=" + mno + "/state=open";
		    
		    if (state1 != null) {
				url += "&state=" + state1;
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

		    JsonArray arr = JsonParser.parseString(responseText).getAsJsonArray();
		    System.out.println("ddddddddddddddddddddddddddddddddddddddddddddddddd");
		    System.out.println(arr);
		    ArrayList<GitIssue> list = new ArrayList<>();

		    for (int i = 0; i < arr.size(); i++) {
		        JsonObject issueObj = arr.get(i).getAsJsonObject();
		        GitIssue git = createGitIssueFromJsonObject(issueObj);
		        list.add(git);
		    }
		    System.out.println(list);
		    return list;
		}

	   public List<GitIssue> getIssuesByAssignee(String assignee, HttpSession session, String token) throws IOException {

	      String apiUrl = "https://api.github.com/issues?filter=assigned";

	      HttpHeaders headers = new HttpHeaders();
	      headers.set("Authorization", "Bearer " + token);
	      headers.setContentType(MediaType.APPLICATION_JSON);
	      HttpEntity<String> requestEntity = new HttpEntity<>(headers);

	      RestTemplate restTemplate = new RestTemplate();
	      ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity,
	            String.class);
	      HttpStatus responseStatus = responseEntity.getStatusCode();

	      if (responseStatus != HttpStatus.OK) {
	         throw new RuntimeException("Failed to get assigned issues on GitHub API: " + responseStatus.toString());
	      }

	      Gson gson = new GsonBuilder().setLenient().create();
	      JsonArray arr = JsonParser.parseString(responseEntity.getBody()).getAsJsonArray();
	      List<GitIssue> list = new ArrayList<>();

	      for (int i = 0; i < arr.size(); i++) {
	         JsonObject issueObj = arr.get(i).getAsJsonObject();
	         GitIssue git = createGitIssueFromJsonObject(issueObj);
	         list.add(git);
	      }

	      return list;
	   }

	   

	   public List<Label> getLabels(String repository, HttpSession session) {

	      String url = repository + "/labels";

	      String labelResponse = iDao.getGitContentsByGet1(url, session);

	      ObjectMapper obj = new ObjectMapper();
	      JsonNode jsonNode;
	      List<Label> lList = new ArrayList<>();

	      try {
	         jsonNode = obj.readTree(labelResponse);
	         for (int i = 0; i < jsonNode.size(); i++) {
	            String id = jsonNode.get(i).get("id").asText();
	            String name = jsonNode.get(i).get("name").asText();
	            String color = jsonNode.get(i).get("color").asText();
	            String description = jsonNode.get(i).get("description").asText();
	            Label l = new Label(id, name, color, description);
	            lList.add(l);

	         }
	      } catch (JsonProcessingException e) {
	         e.printStackTrace();
	      }

	      return lList;
	   }

	   public List<Milestone> getMilestone(String repository, HttpSession session) {
	      String url = repository + "/milestones";
	      String milestoneResponse = iDao.getGitContentsByGet1(url, session);

	      ObjectMapper obj = new ObjectMapper();
	      JsonNode jsonNode;
	      List<Milestone> mList = new ArrayList<>();

	      try {
	         jsonNode = obj.readTree(milestoneResponse);
	         for (int i = 0; i < jsonNode.size(); i++) {
	            String id = jsonNode.get(i).get("id").asText();
	            String title = jsonNode.get(i).get("title").asText();
	            String number = jsonNode.get(i).get("number").asText();
	            String state = jsonNode.get(i).get("state").asText();
	            Milestone m = new Milestone(id, title, number, state);
	            mList.add(m);
	         }
	      } catch (JsonProcessingException e) {
	         e.printStackTrace();
	      }

	      return mList;
	   }

	   public List<GitIssue> getIssuesByAuthor(String author, HttpSession session, String token, String repository) {

	      String apiUrl = "https://api.github.com/repos/" + repository + "/issues?creator=" + author;

	      HttpHeaders headers = new HttpHeaders();
	      headers.set("Authorization", "Bearer " + token);
	      headers.setContentType(MediaType.APPLICATION_JSON);
	      HttpEntity<String> requestEntity = new HttpEntity<>(headers);

	      RestTemplate restTemplate = new RestTemplate();
	      ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity,
	            String.class);
	      HttpStatus responseStatus = responseEntity.getStatusCode();

	      if (responseStatus != HttpStatus.OK) {
	         throw new RuntimeException("Failed to get assigned issues on GitHub API: " + responseStatus.toString());
	      }

	      Gson gson = new GsonBuilder().setLenient().create();
	      JsonArray arr = JsonParser.parseString(responseEntity.getBody()).getAsJsonArray();
	      List<GitIssue> list = new ArrayList<>();

	      for (int i = 0; i < arr.size(); i++) {
	         JsonObject issueObj = arr.get(i).getAsJsonObject();
	         GitIssue git = createGitIssueFromJsonObject(issueObj);
	         list.add(git);
	      }

	      return list;

	   }

	   public List<GitIssue> getIssuesByLabel(String label, HttpSession session, String repository, String token)
	         throws IOException {

	      String apiUrl = "https://api.github.com/repos/" + repository + "/issues?labels=" + label;

	      HttpHeaders headers = new HttpHeaders();
	      headers.set("Authorization", "Bearer " + token);
	      headers.setContentType(MediaType.APPLICATION_JSON);
	      HttpEntity<String> requestEntity = new HttpEntity<>(headers);

	      RestTemplate restTemplate = new RestTemplate();
	      ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity,
	            String.class);
	      HttpStatus responseStatus = responseEntity.getStatusCode();

	      if (responseStatus != HttpStatus.OK) {
	         throw new RuntimeException("Failed to get issues by label on GitHub API: " + responseStatus.toString());
	      }

	      Gson gson = new GsonBuilder().setLenient().create();
	      JsonArray arr = JsonParser.parseString(responseEntity.getBody()).getAsJsonArray();
	      List<GitIssue> list = new ArrayList<>();

	      for (int i = 0; i < arr.size(); i++) {
	         JsonObject issueObj = arr.get(i).getAsJsonObject();
	         GitIssue git = createGitIssueFromJsonObject(issueObj);
	         list.add(git);
	      }
	      return list;
	   }

	   private GitIssue createGitIssueFromJsonObject(JsonObject issueObj) {
	      GitIssue git = new GitIssue();

	      git.setTitle(issueObj.get("title").getAsString());

	      JsonArray labelsArr = issueObj.get("labels").getAsJsonArray();
	      String[] labels = new String[labelsArr.size()];
	      for (int j = 0; j < labelsArr.size(); j++) {
	         labels[j] = labelsArr.get(j).getAsJsonObject().get("name").getAsString();
	      }
	      git.setLabels(labels);

	      git.setState(issueObj.get("state").getAsString());

	      JsonElement milestoneElem = issueObj.get("milestone");
	      if (!milestoneElem.isJsonNull()) {
	         JsonObject milestoneObj = milestoneElem.getAsJsonObject();
	         git.setMilestone(milestoneObj.get("title").getAsString());
	         git.setMilestoneNum(milestoneObj.get("number").getAsInt());
	      }

	      git.setNumber(issueObj.get("number").getAsInt());

	      JsonArray assigneesArr = issueObj.get("assignees").getAsJsonArray();
	      String[] assignees = new String[assigneesArr.size()];
	      String[] assigneeProfiles = new String[assigneesArr.size()]; // 이슈 담당자 프로필
	      for (int j = 0; j < assigneesArr.size(); j++) {
	         JsonObject assigneeObj = assigneesArr.get(j).getAsJsonObject();
	         assignees[j] = assigneeObj.get("login").getAsString();
	         assigneeProfiles[j] = assigneeObj.get("avatar_url").getAsString(); // 이슈 담당자 프로필
	      }
	      git.setAssignees(assignees);
	      git.setAssigneeProfiles(assigneeProfiles); // 이슈 담당자 프로필 설정

	      String createdDateTimeString = issueObj.get("created_at").getAsString();
	      LocalDateTime createdDateTime = LocalDateTime.parse(createdDateTimeString, DateTimeFormatter.ISO_DATE_TIME);
	      String createdDateString = createdDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	      git.setCreatedAt(createdDateString);

	      git.setUpdatedAt(issueObj.get("updated_at").getAsString());

	      JsonElement closedAtElem = issueObj.get("closed_at");
	      if (!closedAtElem.isJsonNull()) {
	         git.setClosedAt(closedAtElem.getAsString());
	      }

	      git.setId(issueObj.get("id").getAsString()); // 이슈 아이디

	      JsonObject userObj = issueObj.get("user").getAsJsonObject();
	      git.setUser(userObj.get("login").getAsString());
	      git.setUserId(userObj.get("id").getAsString());

	      String userProfileUrl = userObj.get("avatar_url").getAsString();
	      git.setProfile(userProfileUrl);

	      return git;
	   }
	
	
	
	public ArrayList<GitIssue> getHomeIssues(HttpSession session) throws IOException {
		 LocalDate currentDate = LocalDate.now();
	        
        // Subtract 5 days from the current date
        LocalDate fiveDaysAgo = currentDate.minusDays(5);
        
        // Format the date as "yyyy-mm-dd"
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = fiveDaysAgo.format(formatter);
		String apiUrl = "https://api.github.com/issues?since="+formattedDate+"&state=open";
		
		String token = ((Member)session.getAttribute("loginUser")).getToken();
		ArrayList<GitIssue> list = new ArrayList<>();
		
		if(token == null || token.equals("")) {
			return list;
		}


		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + token);
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<>(headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity, String.class);
		HttpStatus responseStatus = responseEntity.getStatusCode();

		if (responseStatus != HttpStatus.OK) {
			throw new RuntimeException("Failed to get assigned issues on GitHub API: " + responseStatus.toString());
		}

		Gson gson = new GsonBuilder().setLenient().create();
		JsonArray arr = JsonParser.parseString(responseEntity.getBody()).getAsJsonArray();
		

		for (int i = 0; i < arr.size(); i++) {
			JsonObject issueObj = arr.get(i).getAsJsonObject();
			GitIssue git = createGitIssueFromJsonObject1(issueObj);
			list.add(git);
		}
		System.out.println(list);

		return list;
	}
	
	private GitIssue createGitIssueFromJsonObject1(JsonObject issueObj) {
		GitIssue git = new GitIssue();

		git.setTitle(issueObj.get("title").getAsString());
		
		JsonObject repository = issueObj.get("repository").getAsJsonObject();
		String fullName = repository.get("full_name").getAsString();
		git.setFullName(fullName);

		JsonArray labelsArr = issueObj.get("labels").getAsJsonArray();
		String[] labels = new String[labelsArr.size()];
		for (int j = 0; j < labelsArr.size(); j++) {
			labels[j] = labelsArr.get(j).getAsJsonObject().get("name").getAsString();
		}
		git.setLabels(labels);

		git.setState(issueObj.get("state").getAsString());

		JsonElement milestoneElem = issueObj.get("milestone");
		if (!milestoneElem.isJsonNull()) {
			JsonObject milestoneObj = milestoneElem.getAsJsonObject();
			git.setMilestone(milestoneObj.get("title").getAsString());
		}

		git.setNumber(issueObj.get("number").getAsInt());

		JsonArray assigneesArr = issueObj.get("assignees").getAsJsonArray();
		String[] assignees = new String[assigneesArr.size()];
		String[] assigneeProfiles = new String[assigneesArr.size()]; // 이슈 담당자 프로필
		for (int j = 0; j < assigneesArr.size(); j++) {
			JsonObject assigneeObj = assigneesArr.get(j).getAsJsonObject();
			assignees[j] = assigneeObj.get("login").getAsString();
			assigneeProfiles[j] = assigneeObj.get("avatar_url").getAsString(); // 이슈 담당자 프로필
		}
		git.setAssignees(assignees);
		git.setAssigneeProfiles(assigneeProfiles); // 이슈 담당자 프로필 설정

		String createdDateTimeString = issueObj.get("created_at").getAsString();
		LocalDateTime createdDateTime = LocalDateTime.parse(createdDateTimeString, DateTimeFormatter.ISO_DATE_TIME);
		String createdDateString = createdDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		git.setCreatedAt(createdDateString);

		git.setUpdatedAt(issueObj.get("updated_at").getAsString());

		JsonElement closedAtElem = issueObj.get("closed_at");
		if (!closedAtElem.isJsonNull()) {
			git.setClosedAt(closedAtElem.getAsString());
		}

		git.setId(issueObj.get("id").getAsString()); // 이슈 아이디

		JsonObject userObj = issueObj.get("user").getAsJsonObject();
		git.setUser(userObj.get("login").getAsString());
		git.setUserId(userObj.get("id").getAsString());
		git.setLogin(userObj.get("login").getAsString()); // login 값 설정

		String userProfileUrl = userObj.get("avatar_url").getAsString();
		git.setProfile(userProfileUrl);

		return git;
	}
	
	public ArrayList<Member> memberList(String repository, String token){
		ArrayList<Member> list = new ArrayList<Member>();
		
		String response = webClient
				.get()
				.uri("https://api.github.com/repos/"+repository +"/collaborators")
				.header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.retrieve()
				.bodyToMono(String.class)
				.block();
		
		JsonArray arr = new Gson().fromJson(response, JsonArray.class);
		for(int i = 0; i<arr.size(); i++) {
			Member m = new Member();
			m.setUserName(arr.get(i).getAsJsonObject().get("login").getAsString());
			m.setProfile(arr.get(i).getAsJsonObject().get("avatar_url").getAsString());
			m.setRollName(arr.get(i).getAsJsonObject().get("role_name").getAsString());
			list.add(m);
		}
		
		return list;
	}
	
	

}
