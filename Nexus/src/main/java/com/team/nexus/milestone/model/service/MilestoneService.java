package com.team.nexus.milestone.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.impl.client.HttpClients;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team.nexus.issue.model.dao.IssueDao;
import com.team.nexus.issue.model.service.IssueService;
import com.team.nexus.issue.model.vo.GitIssue;
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.milestone.model.dao.MilestoneDao;
import com.team.nexus.milestone.model.vo.GitMilestone;
import com.team.nexus.milestone.model.vo.Milestone;
import com.team.nexus.repository.model.vo.Content;

@Service
public class MilestoneService {
   
   @Autowired
   private SqlSessionTemplate sqlSession;

   @Autowired
   private WebClient webClient;

   @Autowired
   private MilestoneService mService;
   
   @Autowired
   private MilestoneDao mDao;
   
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

   
   public String gitPatchMethod(String path, HttpSession session, String title,  String description, int mno) {

//      RestTemplate restTemplate = new RestTemplate();
//       PATCH 메소드를 사용하기 위해 필요한 HttpClient 버전이 낮기 때문에 발생하는 문제

      HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
      requestFactory.setHttpClient(HttpClients.createDefault());
      RestTemplate restTemplate = new RestTemplate(requestFactory);

      HttpHeaders headers = new HttpHeaders();
      headers.setBearerAuth((((Member) (session.getAttribute("loginUser"))).getToken()));
      headers.setContentType(MediaType.APPLICATION_JSON);
      String url = "https://api.github.com/repos/OWNER/REPO/milestones" + path + "/" + mno;

      System.out.println(url);

      // Create a JSON object for the issue payload
      JSONObject milestoneJson = new JSONObject();
      milestoneJson.put("title", title);
      milestoneJson.put("description", description);

      HttpEntity<String> entity = new HttpEntity<String>(milestoneJson.toString(), headers);

      ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PATCH, entity, String.class);

      return response.getBody();
   }
   
   
   public List<GitMilestone> getMilestones(HttpSession session, String repository, String token1, String state)
         throws IOException {

   
      
      String repository2 = (String) session.getAttribute("repository");
      
		/* String url = "https://api.github.com/repos/" + repository + "/milestones"; */
      String url = "https://api.github.com/repos/" + repository + "/milestones?state=open";
      
      if (state != null) {
			url += "&state=" + state;
		}
      
      

      URL requestUrl = new URL(url);

      HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();

      urlConnection.setRequestProperty("Authorization", "Bearer " + token1);
      urlConnection.setRequestMethod("GET");

      BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));

      String line;
      String responseText = "";

      while ((line = br.readLine()) != null) {
         responseText += line;
         
      }
      ArrayList<GitMilestone> list = new ArrayList<GitMilestone>();
      
      Gson gson = new Gson();
        JsonArray jsonArray = gson.fromJson(responseText, JsonArray.class);
        
        for(int i =0; i<jsonArray.size(); i++) {
           GitMilestone gm = new GitMilestone();
           
           gm.setTitle(jsonArray.get(i).getAsJsonObject().get("title").getAsString());
           JsonObject jo = jsonArray.get(i).getAsJsonObject().get("creator").getAsJsonObject();
           gm.setCreator(jo.get("login").getAsString());
           gm.setProfile(jo.get("avatar_url").getAsString());
           gm.setState(jsonArray.get(i).getAsJsonObject().get("state").getAsString());
           gm.setNumber(jsonArray.get(i).getAsJsonObject().get("number").getAsInt());
           gm.setOpenedIssues(jsonArray.get(i).getAsJsonObject().get("open_issues").getAsInt());
           gm.setClosedIssues(jsonArray.get(i).getAsJsonObject().get("closed_issues").getAsInt());
           
           //gm.setCreatedAt(jsonArray.get(i).getAsJsonObject().get("created_at").getAsString());
           String createdAt = jsonArray.get(i).getAsJsonObject().get("created_at").getAsString();
           LocalDateTime dateTime = LocalDateTime.parse(createdAt, DateTimeFormatter.ISO_DATE_TIME);
           String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
           gm.setCreatedAt(formattedDate);
           
           //gm.setUpdatedAt(jsonArray.get(i).getAsJsonObject().get("updated_at").getAsString());
           String updatedAt = jsonArray.get(i).getAsJsonObject().get("updated_at").getAsString();
           LocalDateTime dateTime1 = LocalDateTime.parse(updatedAt, DateTimeFormatter.ISO_DATE_TIME);
           String formattedDate1 = dateTime1.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
           gm.setUpdatedAt(formattedDate1);
           
           JsonElement dueOnElement1 = jsonArray.get(i).getAsJsonObject().get("closed_at");
           if (dueOnElement1 != null && !dueOnElement1.isJsonNull()) {
               LocalDateTime closedAtDateTime = LocalDateTime.parse(dueOnElement1.getAsString(), DateTimeFormatter.ISO_DATE_TIME);
               String formattedClosedAtDate = closedAtDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
               gm.setClosedAt(formattedClosedAtDate);
           } else {
               gm.setClosedAt("");
           }
           
           
        JsonElement dueOnElement = jsonArray.get(i).getAsJsonObject().get("due_on");
        
       	if (dueOnElement != null && !dueOnElement.isJsonNull()) {
       		LocalDateTime dueOnDateTime = LocalDateTime.parse(dueOnElement.getAsString(), DateTimeFormatter.ISO_DATE_TIME);
            String formattedDue_onDate1 = dueOnDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            gm.setDue_on(formattedDue_onDate1);
       	} else {
       	    gm.setDue_on(null);
       	}
       	
       	
           
           list.add(gm);
           
        }
      System.out.println();
      System.out.println(list);
      
      return list;

         
      }
      

      /*
       * for (int i = 0; i < arr.size(); i++) { JsonObject milestoneObj =
       * arr.get(i).getAsJsonObject(); GitMilestone git =
       * createGitMilestoneFromJsonObject(milestoneObj); list.add(git); }
       */
   
   
   private GitMilestone createGitMilestoneFromJsonObject(JsonObject milestoneObj) {
//      title  creator  state  number login  avatar_url  created_at  updated_at  closed_at  due_on  id
      GitMilestone git = new GitMilestone();

      git.setTitle(milestoneObj.get("title").getAsString());
      
      /*
       * JsonElement creatorElem = milestoneObj.get("creator"); if
       * (!creatorElem.isJsonNull()) { JsonObject creatorObj =
       * creatorElem.getAsJsonObject();
       * git.setCreator(creatorObj.get("id").getAsString()); }
       */

      git.setState(milestoneObj.get("state").getAsString());


      git.setNumber(milestoneObj.get("number").getAsInt());
      

      String createdDateTimeString = milestoneObj.get("created_at").getAsString();
      LocalDateTime createdDateTime = LocalDateTime.parse(createdDateTimeString, DateTimeFormatter.ISO_DATE_TIME);
      String createdDateString = createdDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
      git.setCreatedAt(createdDateString);

      git.setUpdatedAt(milestoneObj.get("updated_at").getAsString());
      
      git.setUpdatedAt(milestoneObj.get("due_on").getAsString());

      JsonElement closedAtElem = milestoneObj.get("closed_at");
      if (!closedAtElem.isJsonNull()) {
         git.setClosedAt(closedAtElem.getAsString());
      }

      git.setMilestoneId(milestoneObj.get("id").getAsString());

      JsonObject creatorObj = milestoneObj.get("creator").getAsJsonObject();
      git.setUser(creatorObj.get("login").getAsString());

      String userProfileUrl = creatorObj.get("avatar_url").getAsString();
      git.setProfile(userProfileUrl);

      return git;
   }
}
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
 