package com.team.nexus.repository.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.repository.model.service.RepositoryService;
import com.team.nexus.repository.model.vo.Repositories;

@Controller
public class RepositoryController {
	
	@Autowired
	private RepositoryService repoService;
	
	// repository 페이지로 이동
	@RequestMapping("repository.p")
	public String repositoyPage(HttpSession session, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Repositories> list = repoService.selectRepoList(userNo);

		model.addAttribute("list", list);
		
		return "repository/repository";
	}
	
	// repository 등록시 사용
	@RequestMapping("enrollRepo.p")
	public String enrollRepository(Repositories r) throws IOException {
		
		String url = " https://api.github.com/repos/";
		url += r.getUserName()+"/";
		url += r.getRepoName();
		
		
		try {
			URL requestUrl = new URL(url);
			
			HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			
			urlConnection.setRequestMethod("GET");
			urlConnection.setRequestProperty("Accept", "application/vnd.github+json");
			urlConnection.setRequestProperty("Authorization", "Bearer "+r.getToken());
			// urlConnection.inputstream은 byte기반이고 buffredReader는 문자기반 
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String line;
			String responseText="";
			
			while((line = br.readLine()) != null) {
				responseText += line;
			}
			
			
			JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
			//System.out.println(totalObj);
			String status = totalObj.get("private").getAsString();
			
			if(status.equals("true")) {
				r.setRepoStatus("Private");
			}else {
				r.setRepoStatus("Public");
			}
			
			br.close();
			urlConnection.disconnect();
			
			
		} catch (FileNotFoundException f) {
			System.out.println("에러발생");
		}
		
		if(r.getRepoStatus() != null) {
			
			int result = repoService.insertRepo(r);
			
		}
		
		
		return "redirect:repository.p";
		
		
		
		
	}
}
