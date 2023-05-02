package com.team.nexus.repository.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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

import com.sun.net.httpserver.Headers;
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
		return rDao.selectRepoList(sqlSession, userNo);
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
	 * <<<<<<< HEAD
	 * 
	 * 
	 * =======
	 */

	// 비동기통신을 하기 위한 메서드
	public Mono<String> asynHttpRequest(String path, HttpSession session) {

		String token = ((Member) session.getAttribute("loginUser")).getToken();

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

		return responseMono;

	}

	// download_url과 같이 full url이 들어오는경우 사용하는 동기 메서드
	public String getGitContentsByGet1(String path, HttpSession session) {

		String token = ((Member) session.getAttribute("loginUser")).getToken();

		WebClient client = WebClient.builder()
				.baseUrl(path)
				.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + token)
				.defaultHeader(HttpHeaders.ACCEPT, "application/vnd.github+json")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.build();

		String response = client.get().retrieve().bodyToMono(String.class).block();

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

		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
		requestFactory.setConnectTimeout(5 * 1000);
		requestFactory.setReadTimeout(5 * 1000);

		restTemplate.setRequestFactory(requestFactory);

		HttpEntity<String> entity = new HttpEntity<String>(issueJson.toString(), headers);

		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PATCH, entity, String.class);

		return response.getBody();
	}

}
