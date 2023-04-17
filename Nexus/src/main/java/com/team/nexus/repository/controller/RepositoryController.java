package com.team.nexus.repository.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team.nexus.repository.model.service.RepositoryService;
import com.team.nexus.repository.model.vo.Repository;

@Controller
public class RepositoryController {
	
	@Autowired
	private RepositoryService repoService;
	

	@RequestMapping("repository.p")
	public String repositoyPage() {
		return "repository/repository";
	}
	
	@RequestMapping("enrollRepo.p")
	public void enrollRepository(Repository r) throws IOException {
		
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
				System.out.println(line);
			}
			
			
			JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
			
			
			
			
			
			br.close();
			urlConnection.disconnect();
			
			
			
			
			
			
		} catch (FileNotFoundException f) {
			System.out.println("에러발생");
		}
		
		
	}
}
