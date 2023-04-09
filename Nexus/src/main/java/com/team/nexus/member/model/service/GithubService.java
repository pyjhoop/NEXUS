package com.team.nexus.member.model.service;

import java.util.Collections;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.nexus.member.model.vo.GitMember;
import com.team.nexus.member.model.vo.Member;

import reactor.core.publisher.Mono;

@PropertySource("classpath:git.properties")
@Service
public class GithubService {
	
	
	@Value("${git.id}")
	private String gitId;
	
	@Value("${git.secret}")
	private String gitSecret;
	
	
	public String getToken(String code){
		String url = "https://github.com/login/oauth/access_token";
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
		
		JSONObject jsonObject = new JSONObject();
	    jsonObject.put("client_id", gitId);
	    jsonObject.put("client_secret", gitSecret);
	    jsonObject.put("code", code);
	    
	    // body, header 넘기는거
	    HttpEntity<String> entity = new HttpEntity<String>(jsonObject.toString(), headers);
	    ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
	    
	    
	    ObjectMapper objectMapper = new ObjectMapper();
	    JsonNode jsonNode;
	    
	    String token="";
	    
	    try {
			jsonNode = objectMapper.readTree(response.getBody());
			token = jsonNode.get("access_token").asText();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	    
	    return token;
	}
	
	public Member getUserInfo(String token) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		String url = "https://api.github.com/user";
		HttpHeaders header = new HttpHeaders();
		header.set("Authorization", "Bearer "+token);
		
		HttpEntity<String> entity = new HttpEntity<String>(header);
		
		//이렇게 하면 쉽게 데이터를 넣을 수 있는데 카카오랑 통일이 되어야 한다. ... 내가 수정하지 
//		ResponseEntity<GitMember> response = restTemplate.exchange(url, HttpMethod.GET, entity, GitMember.class);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
		
		ObjectMapper objecMapper = new ObjectMapper();
		JsonNode jsonNode = null;
		Member m = new Member();
		
		// login = nick으로 저장하자
		try {
			jsonNode = objecMapper.readTree(response.getBody());
			m.setUserId(jsonNode.get("id").asText());
			m.setUserNick(jsonNode.get("login").asText());
			m.setEmail(jsonNode.get("email").asText());
			m.setUserName(jsonNode.get("name").asText());
			m.setProfile(jsonNode.get("avatar_url").asText());
			m.setSocial("G");
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
}
