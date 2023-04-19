package com.team.nexus.repository.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSerializer;
import com.google.gson.reflect.TypeToken;
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.repository.model.service.RepositoryService;
import com.team.nexus.repository.model.vo.Content;
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
	
	@RequestMapping("repoDetail.p")
	public String repoDetail(HttpSession session,int rNo , Model model) {
		
		//rNo으로 userName, repoName 조회후 url 완성시키기
		Repositories repo = repoService.selectRepo(rNo);
		
		String url = "https://api.github.com/repos/";
		url+= repo.getUserName()+"/";
		url+= repo.getRepoName()+"/languages";
		String token = ((Member)(session.getAttribute("loginUser"))).getToken();
		
		try {
			URL requestUrl = new URL(url);
			
			HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			urlConnection.setRequestMethod("GET");
			urlConnection.setRequestProperty("Accept", "application/vnd.github+json");
			urlConnection.setRequestProperty("Authorization", "Bearer "+token);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String line;
			String responseText="";
			
			while((line = br.readLine()) != null) {
				responseText += line;
			}
			
			Map<String, Double> map = new Gson().fromJson(responseText, Map.class);
			
			int sum = 0;
			for(String key:map.keySet()) {
				sum += map.get(key);
			}
			
			for(String key:map.keySet()) {
				map.replace(key, Math.round(map.get(key)/sum*100*10)/10.0);
			}
			
			
			// content 가져오기
			String url1 =  repo.getUserName()+"/";
			url1 += repo.getRepoName()+"/contents";
			
			String response = getPathContents(url1, session);

			
			
			ArrayList<Content> list = new ArrayList<Content>();
			ObjectMapper obj = new ObjectMapper();
			JsonNode jsonNode;
			
			
			jsonNode = obj.readTree(response);
			
			for(int i = 0; i<jsonNode.size(); i++) {
				
				//System.out.println(jsonNode.get(i));
				String name = jsonNode.get(i).get("name").asText();
				String downloadUrl = jsonNode.get(i).get("download_url").asText();
				String type = jsonNode.get(i).get("type").asText();
				
				list.add(new Content(name, downloadUrl,type));
			}
			
			Collections.sort(list);
			
			
			System.out.println(list);
			
			// .md 있으면 밑에 추가해야하고
			
			
			// 멤버 정보를 가져와야 한다.
			
			
			// model에 데이터 추가
			model.addAttribute("list",list);
			model.addAttribute("map",map);
			model.addAttribute("repo",repo);
			
			br.close();
			urlConnection.disconnect();
			
			//System.out.println(map);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "repository/repositoryDetail";
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
	
	
	public String getPathContents(String path, HttpSession session){
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth((((Member)(session.getAttribute("loginUser"))).getToken()));
		headers.setContentType(MediaType.APPLICATION_JSON);
		String url = "https://api.github.com/repos/"+path;
		
		System.out.println("url : "+url);
		
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
		
		System.out.println(response.getBody());
		
		
		
		return response.getBody();
	}
	
	
	@RequestMapping("ajaxGetContent")
	@ResponseBody
	public String ajaxGetContent(String path, HttpSession session) {
		
		//System.out.println(path);
		String response = getPathContents(path, session);
		
		
		Gson gson = new Gson();

		
		Type listType = new TypeToken<ArrayList<Content>>(){}.getType();
		
		ArrayList<Content> contArray = gson.fromJson(response, listType);
		
		Collections.sort(contArray);
//		
//		
//		
//		System.out.println("===============");
//		System.out.println(contArray);
		
		return gson.toJson(contArray);
		
		
	}
	
	
	
}
