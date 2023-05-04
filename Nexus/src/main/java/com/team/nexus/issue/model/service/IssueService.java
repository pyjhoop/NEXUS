package com.team.nexus.issue.model.service;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;

import com.team.nexus.member.model.vo.Member;

@Service
public class IssueService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WebClient webClient;
	

	// download_url과 같이 full url이 들어오는경우 사용하는 동기 메서드
	public String getGitContentsByGet1(String path, HttpSession session) {

		String token = ((Member) session.getAttribute("loginUser")).getToken();
		
		System.out.println("여기 타나염????" + token);
		System.out.println("1111111" +path);

		String response = webClient
				.get()
				.uri(path)
				.header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.header(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.retrieve()
				.bodyToMono(String.class)
				.block();

		// WebClient client = WebClient.builder()
		// .baseUrl(path)
		// .defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
		// .defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
		// .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
		// .build();
		//
		// String response = client.get().retrieve().bodyToMono(String.class).block();
		
		
		
		
		
		System.out.println("################ 1111111" +path);
		System.out.println("################ 2222222" +response);
		System.out.println("################ 3333333" +token);

		return response;
	}

	// 이외의 get, put, delete시 사용될 동기 메서드
	public String synHttpRequest(String path, HttpSession session, String method) {
		String token = ((Member) session.getAttribute("loginUser")).getToken();

		WebClient client = WebClient.builder()
				.baseUrl("https://api.github.com/repos/")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.build();

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

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth((((Member) (session.getAttribute("loginUser"))).getToken()));
		headers.setContentType(MediaType.APPLICATION_JSON);
		String url = "https://api.github.com/repos/" + path + "/" + ino;

		System.out.println("url : " + url);

		// Create a JSON object for the issue payload
		JSONObject issueJson = new JSONObject();
		issueJson.put("title", title);
		issueJson.put("body", body);
		JSONArray assigneesArray = new JSONArray();
		// ### 라벨만 있으면 에러나서 주석처리함
		// assigneesArray.add(assignees);
		// issueJson.put("assignees", assigneesArray);

		String test = "{\"title\":\"Found a bug\",\"body\":\"I''m having a problem with this.\"}";

		HttpEntity<String> entity = new HttpEntity<String>(test, headers);

		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PATCH, entity, String.class);

		return response.getBody();
	}

	
}
