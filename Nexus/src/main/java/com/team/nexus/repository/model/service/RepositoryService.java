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

import com.team.nexus.member.model.vo.Member;
import com.team.nexus.repository.model.dao.RepositoryDao;
import com.team.nexus.repository.model.vo.Repositories;

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

}
