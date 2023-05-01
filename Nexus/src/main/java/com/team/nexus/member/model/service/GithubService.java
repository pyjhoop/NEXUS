package com.team.nexus.member.model.service;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.nexus.member.model.vo.Member;

@PropertySource("classpath:git.properties")
@Service
public class GithubService {
	
	
	@Value("${git.id}")
	private String gitId;
	
	@Value("${git.secret}")
	private String gitSecret;
	
	
	public String getToken(String code){
		String url = "https://github.com/login/oauth/access_token";
		
		WebClient client = WebClient.builder()
				.baseUrl(url)
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.defaultHeader(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE)
				.build();
		
		String response = client.post()
				.body(BodyInserters.fromFormData("client_id", gitId)
                        .with("client_secret", gitSecret)
                        .with("code",code))
				.retrieve().bodyToMono(String.class).block();

	    ObjectMapper objectMapper = new ObjectMapper();
	    JsonNode jsonNode;
	    
	    String token="";
	    
	    try {
			jsonNode = objectMapper.readTree(response);
			token = jsonNode.get("access_token").asText();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	    
	    return token;
	}
	
	
	public Member getUserInfo(String token) {
		
		String response = WebClient.builder()
				.baseUrl("https://api.github.com/user")
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer "+token)
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.build()
				.get()
				.retrieve()
				.bodyToMono(String.class)
				.block();
		
		ObjectMapper objecMapper = new ObjectMapper();
		JsonNode jsonNode = null;
		Member m = new Member();
		
		// login = nick으로 저장하자
		try {
			jsonNode = objecMapper.readTree(response);
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
