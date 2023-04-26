package com.team.nexus.repository.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
import com.team.nexus.repository.model.dao.RepositoryDao;
import com.team.nexus.repository.model.vo.Repositories;
import com.team.nexus.repository.model.vo.Test;

import reactor.core.publisher.Mono;


@Service
public class RepositoryService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RepositoryDao rDao;
	
	public int insertRepo(Repositories r) {
		return rDao.insertRepo(sqlSession, r);
	}

	public ArrayList<Repositories> selectRepoList(int userNo) {
		return rDao.selectRepoList(sqlSession,userNo);
	}

	public Repositories selectRepo(int rNo) {
		return rDao.selectRepo(sqlSession, rNo);
	}

	public int updateRepoContent(Repositories repo) {
		return rDao.updateRepoContent(sqlSession, repo);
	}

	public String getRepoContent(Repositories repo) {
		return rDao.getRepoContent(sqlSession, repo);
	}
	
	
	/*
	 * http 통신을 위한 메서드들 
	 */
	
	public String getGitContentsByGet(String path, HttpSession session) {
		
		String token = ((Member)session.getAttribute("loginUser")).getToken();
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Authorization", "Bearer "+token);
		headers.add("Accept", "application/vnd.github+json");
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		String url = "https://api.github.com/repos/"+path;
		
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url,HttpMethod.GET, entity, String.class);
		return response.getBody();
		
	}
	
	public Mono<String> test(String path, HttpSession session) {
		
		String token = ((Member)session.getAttribute("loginUser")).getToken();
		

		WebClient client = WebClient.builder()
		        .baseUrl("https://api.github.com")
		        .defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
		        .defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
		        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
		        .build();

		String url = "/repos/" + path;

		Mono<String> responseMono = client.get()
		        .uri(url)
		        .retrieve()
		        .bodyToMono(String.class);
		System.out.println("=======================");
		
		Test t = new Test();
		responseMono.subscribe(response -> {
			t.setStr(response);
		    System.out.println(response); // Print the response to the console
		    // Or, return the response from the method
		    
		});
		
		return responseMono;
		
	}
	
	public String getGitContentsByGet1(String path, HttpSession session) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth((((Member)(session.getAttribute("loginUser"))).getToken()));
		headers.setContentType(MediaType.APPLICATION_JSON);
		String url =path;
		
		System.out.println("url : "+url);
		
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
		
		System.out.println(response.getBody());
		String text = response.getBody();
		
	
		return text;
	}
	
	public String gitPutMethod(String path, HttpSession session) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth((((Member)(session.getAttribute("loginUser"))).getToken()));
		headers.setContentType(MediaType.APPLICATION_JSON);
		String url = "https://api.github.com/repos/"+path;
		
		System.out.println("url : "+url);
		
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PUT, entity, String.class);
		
		return response.getBody();
	}
	
	public String gitDeleteMethod(String path, HttpSession session) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth((((Member)(session.getAttribute("loginUser"))).getToken()));
		headers.setContentType(MediaType.APPLICATION_JSON);
		String url = "https://api.github.com/repos/"+path;
		
		System.out.println("url : "+url);
		
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.DELETE, entity, String.class);
		
		return response.getBody();
	}
	
	public String gitPatchMethod(String path, HttpSession session) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth((((Member)(session.getAttribute("loginUser"))).getToken()));
		headers.setContentType(MediaType.APPLICATION_JSON);
		String url = "https://api.github.com/repos/"+path;
		
		System.out.println("url : "+url);
		
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PATCH, entity, String.class);
		
		return response.getBody();
	}

}
