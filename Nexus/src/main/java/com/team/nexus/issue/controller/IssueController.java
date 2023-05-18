package com.team.nexus.issue.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.impl.client.HttpClients;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.team.nexus.issue.model.service.IssueService;
import com.team.nexus.issue.model.vo.GitIssue;
import com.team.nexus.issue.model.vo.Label;
import com.team.nexus.issue.model.vo.Milestone;
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.milestone.model.vo.GitMilestone;

@Controller
public class IssueController {

	@Autowired
	private IssueService iService;

	@Autowired
	private WebClient webClient;

	@RequestMapping(value = "issueShow.mini", produces = "application/json; charset=utf-8")
	public String issueList(HttpSession session, Member m, Model model, @RequestParam(required = false) String state,
			@RequestParam(required = false) String label, @RequestParam(required = false) String author,
			@RequestParam(required = false) Integer page, @RequestParam(required = false) String assign,
			@RequestParam(required = false) String authorName, @RequestParam(required = false) String newTitle,
			@RequestParam(required = false) String issueNumber, @RequestParam(required = false) String userObject)
			throws IOException {

		String repository = (String) session.getAttribute("repository");

		List<Label> lList = iService.getLabels(repository, session);

		String token = ((Member) (session.getAttribute("loginUser"))).getToken();

		List<GitIssue> list;

		if (assign != null && assign.equals("myIssue")) {
			list = iService.getIssuesByAssignee(assign, session, token);
		} else if (author != null) {
			list = iService.getIssuesByAuthor(author, session, token, repository);

		} else if (label != null && !label.equals("noChoice")) {
			list = iService.getIssuesByLabel(label, session, repository, token);
		} else {
			list = iService.getIssues(repository, token, state, assign, label, page);
		}

		model.addAttribute("list", list);
		model.addAttribute("lList", lList);
		model.addAttribute("state", state);

		return "issue/issueList";
	}

	@RequestMapping(value = "ajaxIssue", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String ajaxIssue(HttpSession session, Member m, Model model, @RequestParam(required = false) String state,
			@RequestParam(required = false) String label, @RequestParam(required = false) String author,
			@RequestParam(required = false) Integer page, @RequestParam(required = false) String assign,
			@RequestParam(required = false) String authorName, @RequestParam(required = false) String newTitle,
			@RequestParam(required = false) String issueNumber, @RequestParam(required = false) String userObject)
			throws IOException {

		String repository = (String) session.getAttribute("repository");

		List<Label> lList = iService.getLabels(repository, session);

		String token = ((Member) (session.getAttribute("loginUser"))).getToken();

		List<GitIssue> list;

		if (assign != null && assign.equals("myIssue")) {
			list = iService.getIssuesByAssignee(assign, session, token);
		} else if (author != null) {
			list = iService.getIssuesByAuthor(author, session, token, repository);

		} else if (label != null && !label.equals("noChoice")) {
			list = iService.getIssuesByLabel(label, session, repository, token);
		} else {
			list = iService.getIssues(repository, token, state, assign, label, page);
		}
		Gson gson = new Gson();
		String json = gson.toJson(list);

		return json;
	}

	@RequestMapping("issueEnroll.mini")
	public String issueEnrollForm(HttpSession session, Model model, @RequestParam(required = false) String state,
			@RequestParam(required = false) Integer page, @RequestParam(required = false) String assign,
			@RequestParam(required = false) String label) throws IOException, IOException {

		String repository = (String) session.getAttribute("repository");
		List<Label> lList = iService.getLabels(repository, session);

		List<Milestone> mList = iService.getMilestone(repository, session);

		model.addAttribute("lList", lList);
		model.addAttribute("mList", mList);

		return "issue/issueEnrollView";
	}

	/*
	 * @RequestMapping(value = "createIssue.mi", produces =
	 * "application/json; charset=utf-8") public String insertIssue(@RequestParam
	 * String title, @RequestParam(required = false) String body,
	 * 
	 * @RequestParam(required = false) String label, @RequestParam(required = false)
	 * String assignee, HttpSession session, Model model,@RequestParam(required =
	 * false) String milestone) {
	 * 
	 * String token = ((Member) session.getAttribute("loginUser")).getToken();
	 * String repository = (String) session.getAttribute("repository"); String
	 * apiUrl = "https://api.github.com/repos/" + repository + "/issues";
	 * 
	 * System.out.println(); System.out.println(apiUrl);
	 * 
	 * String[] assignees = assignee.split(","); String[] labels = label.split(",");
	 * 
	 * System.out.println(assignees); System.out.println(milestone);
	 * 
	 * JSONObject issueJson = new JSONObject(); issueJson.put("title", title);
	 * issueJson.put("body", body); issueJson.put("milestone", milestone); JSONArray
	 * assigneesArray = new JSONArray();
	 * 
	 * for(String s: assignees) { assigneesArray.add(s); }
	 * 
	 * JSONArray labelsArray = new JSONArray(); for(String s: labels) {
	 * labelsArray.add(s);
	 * 
	 * } issueJson.put("assignees", assigneesArray); issueJson.put("labels",
	 * labelsArray);
	 * 
	 * 
	 * 
	 * HttpHeaders headers = new HttpHeaders(); headers.set("Authorization",
	 * "Bearer " + token); headers.set("Accept", "application/vnd.github+json");
	 * headers.setContentType(MediaType.APPLICATION_JSON); HttpEntity<String>
	 * requestEntity = new HttpEntity<String>(issueJson.toString(), headers);
	 * 
	 * RestTemplate restTemplate = new RestTemplate(); ResponseEntity<String>
	 * responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST,
	 * requestEntity, String.class); HttpStatus responseStatus =
	 * responseEntity.getStatusCode();
	 * 
	 * if (responseStatus != HttpStatus.CREATED) { throw new
	 * RuntimeException("Failed to create issue on GitHub API: " +
	 * responseStatus.toString()); }
	 * 
	 * 
	 * session.setAttribute("updateBellIcon", "updateBellIcon");
	 * 
	 * return "redirect:issueShow.mini"; }
	 * 
	 * 
	 */

	@RequestMapping(value = "createIssue.mi", produces = "application/json; charset=utf-8")
	public String insertIssue(@RequestParam String title, @RequestParam(required = false) String body,
			@RequestParam(required = false) String label, @RequestParam(required = false) String assignee,
			HttpSession session, Model model, @RequestParam(required = false) String milestone) {

		String token = ((Member) session.getAttribute("loginUser")).getToken();
		String repository = (String) session.getAttribute("repository");
		String apiUrl = "https://api.github.com/repos/" + repository + "/issues";

		JSONObject issueJson = new JSONObject();
		issueJson.put("title", title);
		issueJson.put("body", body);

		

		 if (milestone != null && !milestone.isEmpty()) {
		        issueJson.put("milestone", milestone);
		    }

		if (assignee != null && !assignee.isEmpty()) {
	        String[] assignees = assignee.split(",");
	        JSONArray assigneesArray = new JSONArray();
	        for (String s : assignees) {
	            assigneesArray.add(s);
	        }
	        issueJson.put("assignees", assigneesArray);
	    }
		
		if (label != null && !label.isEmpty()) {
	        String[] labels = label.split(",");
	        JSONArray labelsArray = new JSONArray();
	        for (String s : labels) {
	            labelsArray.add(s);
	        }
	        issueJson.put("labels", labelsArray);
	    }
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + token);
		headers.set("Accept", "application/vnd.github+json");
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<String>(issueJson.toString(), headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity,
				String.class);
		HttpStatus responseStatus = responseEntity.getStatusCode();

		if (responseStatus != HttpStatus.CREATED) {
			throw new RuntimeException("Failed to create issue on GitHub API: " + responseStatus.toString());
		}

		session.setAttribute("updateBellIcon", "updateBellIcon");

		return "redirect:issueShow.mini";
	}

	@RequestMapping("removeRingSession")
	public String removeRingSession(HttpServletRequest request, HttpSession session) {

		if (session != null) {
			session.removeAttribute("updateBellIcon");
		}
		return "redirect:/";
	}

	@RequestMapping(value = "issueState.mi", produces = "application/json; charset=utf-8")
	public String updateStateIssue(@RequestParam int ino, @RequestParam String state, HttpSession session) {

		String token = ((Member) session.getAttribute("loginUser")).getToken();
		String repository = (String) session.getAttribute("repository");

		String apiUrl = "https://api.github.com/repos/" + repository + "/issues/" + ino;

		// code for changing issue status
		JsonObject json = new JsonObject();
		json.addProperty("state", state);
		String jsonStr = json.toString();

		HttpClient client = HttpClient.newBuilder().version(HttpClient.Version.HTTP_1_1).build();

		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(apiUrl))
				.header("Authorization", "Bearer " + token).header("Content-Type", "application/json")
				.method("PATCH", HttpRequest.BodyPublishers.ofString(jsonStr)).build();

		try {
			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
			System.out.println(response.body());
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}

		return "redirect:issueShow.mini";
	}

	@RequestMapping(value = "updateIssue.mi", produces = "application/json; charset=utf-8")
	public String updateIssue(@RequestParam String title, @RequestParam(required = false) String body,
			@RequestParam(required = false) String assignee, @RequestParam(required = false) String milestone,
			@RequestParam(required = false) String label, HttpSession session, int ino) {

		String repository = (String) session.getAttribute("repository");

		String token = ((Member) session.getAttribute("loginUser")).getToken();

		String apiUrl = "https://api.github.com/repos/" + repository + "/issues/" + ino;

		JSONObject requestBody = new JSONObject();

		requestBody.put("title", title); // Update the issue title
			requestBody.put("body", body); // Update the issue body if provided
		
			if (milestone != null && !milestone.isEmpty()) {
				requestBody.put("milestone", milestone);
		    }else {
		        // 마일스톤이 없는 경우에는 빈 문자열로 설정하여 삭제를 반영
		    	requestBody.put("milestone", "");
		    }

		
		String[] assignees = assignee.split(",");

		JSONArray array1 = new JSONArray();
		for (int i = 0; i < assignees.length; i++) {
			array1.add(assignees[i]);
		}
		requestBody.put("assignees", array1);
		
		
		
		if (label != null && !label.isEmpty()) {
	        String[] labels = label.split(",");
	        JSONArray labelsArray = new JSONArray();
	        for (String s : labels) {
	            labelsArray.add(s);
	        }
	        requestBody.put("labels", labelsArray);
	    }else {
	        // 라벨이 없는 경우에는 빈 배열로 설정하여 삭제를 반영
	    	requestBody.put("labels", new JSONArray());
	    }
		
		
		

		String response = webClient.patch().uri(apiUrl).header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).bodyValue(requestBody.toString())
				.retrieve().bodyToMono(String.class).block();


		session.setAttribute("updateBellIcon", "updateBellIcon");

		return "redirect:issueShow.mini";
	}



	@RequestMapping(value = "issueDetail.mini", produces = "application/json; charset=utf-8")
	public String selectIssue(@RequestParam String ino, HttpSession session, Model model) {
		try {
			String token = ((Member) session.getAttribute("loginUser")).getToken();
			String repository = (String) session.getAttribute("repository");

			List<Label> lList = iService.getLabels(repository, session);

			List<Milestone> mList = iService.getMilestone(repository, session);

			String apiUrl = "https://api.github.com/repos/" + repository + "/issues/" + ino;

			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.set("Authorization", "Bearer " + token);
			headers.setContentType(MediaType.APPLICATION_JSON);
			HttpEntity<String> requestEntity = new HttpEntity<>("", headers);
			ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity,
					String.class);
			HttpStatus responseStatus = responseEntity.getStatusCode();

			if (responseStatus != HttpStatus.OK) {
				throw new RuntimeException(
						"Failed to retrieve issue data from GitHub API: " + responseStatus.toString());
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
			ArrayList<Member> assignees = new ArrayList<>();

			if (assigneesArray != null) {
				for (JsonElement assigneeElement : assigneesArray) {
					JsonObject assigneeObject = assigneeElement.getAsJsonObject();

					String userName = assigneeObject.get("login").getAsString();
					String assigneeProfiles = assigneeObject.get("avatar_url").getAsString();

					Member assignee = new Member();
					assignee.setUserName(userName);
					assignee.setProfile(assigneeProfiles);

					assignees.add(assignee);
				}
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

			JsonElement milestoneElement = issueJson.get("milestone");
			List<Milestone> milestoneList = new ArrayList<>();
			if (milestoneElement != null && !milestoneElement.isJsonNull()) {
				JsonObject milestoneObject = milestoneElement.getAsJsonObject();
				String milestoneTitle = milestoneObject.get("title").getAsString();
				String milestoneNumber = milestoneObject.get("number").getAsString();
				Milestone m = new Milestone();

				m.setTitle(milestoneTitle);
				m.setNumber(milestoneNumber);

				milestoneList.add(m);

			}

			model.addAttribute("title", title);
			model.addAttribute("body", body);
			model.addAttribute("state", state);
			model.addAttribute("ino", ino);
			model.addAttribute("assignees", assignees);
			model.addAttribute("labels", labels);
			model.addAttribute("lList", lList);
			model.addAttribute("mList", mList);
			model.addAttribute("milestoneList", milestoneList);

			return "issue/issueDetail";
		} catch (Exception e) {
			e.printStackTrace();
			return "common/error500";
		}
	}

	@RequestMapping(value = "myIssue", produces = "application/json; charset=utf-8")
	public String myIssueList(@RequestParam(value = "assign") String assign, HttpSession session, Model model) {
		String token = ((Member) session.getAttribute("loginUser")).getToken();
		String repository = (String) session.getAttribute("repository");

		String apiUrl = "https://api.github.com/repos/" + repository + "/issues";
		UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(apiUrl).queryParam("assignee", assign);

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + token);
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<?> entity = new HttpEntity<>(headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(builder.build().encode().toUri(), HttpMethod.GET,
				entity, String.class);

		JSONArray issueArray = new JSONArray();
		issueArray.add(response.getBody());

		model.addAttribute("issues", issueArray);

		return "issue/issu";
	}

	@RequestMapping(value = "issueDetail1.mini", produces = "application/json; charset=utf-8")
	public String selectIssue1(@RequestParam String ino, String repository, HttpSession session, Model model) {
		try {
			String token = ((Member) session.getAttribute("loginUser")).getToken();

			List<Label> lList = iService.getLabels(repository, session);

			String apiUrl = "https://api.github.com/repos/" + repository + "/issues/" + ino;

			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.set("Authorization", "Bearer " + token);
			headers.setContentType(MediaType.APPLICATION_JSON);
			HttpEntity<String> requestEntity = new HttpEntity<>("", headers);
			ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity,
					String.class);
			HttpStatus responseStatus = responseEntity.getStatusCode();

			if (responseStatus != HttpStatus.OK) {
				throw new RuntimeException(
						"Failed to retrieve issue data from GitHub API: " + responseStatus.toString());
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
			ArrayList<Member> assignees = new ArrayList<>();

			if (assigneesArray != null) {
				for (JsonElement assigneeElement : assigneesArray) {
					JsonObject assigneeObject = assigneeElement.getAsJsonObject();

					String userName = assigneeObject.get("login").getAsString();
					String assigneeProfiles = assigneeObject.get("avatar_url").getAsString();

					Member assignee = new Member();
					assignee.setUserName(userName);
					assignee.setProfile(assigneeProfiles);

					assignees.add(assignee);
				}
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

			JsonElement milestoneElement = issueJson.get("milestone");
			List<Milestone> milestoneList = new ArrayList<>();
			if (milestoneElement != null && !milestoneElement.isJsonNull()) {
				JsonObject milestoneObject = milestoneElement.getAsJsonObject();
				String milestoneTitle = milestoneObject.get("title").getAsString();
				String milestoneNumber = milestoneObject.get("number").getAsString();
				Milestone m = new Milestone();

				m.setTitle(milestoneTitle);
				m.setNumber(milestoneNumber);

				milestoneList.add(m);

			}

			// Retrieve issue manager's profile
			JsonObject userObject = issueJson.getAsJsonObject("user");
			String issueManagerName = userObject.get("login").getAsString();

			// 마이르톤 가져오기
			List<Milestone> mList = iService.getMilestone(repository, session);

			// 멤버 가져옥
			ArrayList<Member> memberList = iService.memberList(repository, token);

			model.addAttribute("title", title);
			model.addAttribute("body", body);
			model.addAttribute("state", state);
			model.addAttribute("ino", ino);
			model.addAttribute("assignees", assignees);
			model.addAttribute("labels", labels);
			model.addAttribute("lList", lList);
			model.addAttribute("mList", mList);
			model.addAttribute("milestoneList", milestoneList);
			model.addAttribute("memberList", memberList);

			return "issue/issueDetail";
		} catch (Exception e) {
			e.printStackTrace();
			return "common/error500";
		}
	}
}