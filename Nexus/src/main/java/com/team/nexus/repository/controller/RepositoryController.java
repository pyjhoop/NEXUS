package com.team.nexus.repository.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.repository.model.service.RepositoryService;
import com.team.nexus.repository.model.vo.Content;
import com.team.nexus.repository.model.vo.Repositories;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;

import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;
import reactor.util.function.Tuple3;

@Controller
public class RepositoryController {
	
	@Autowired
	private RepositoryService repoService;
	
	
	
	/**
	 * 내가 등록한 레파지토리가 보이는 페이지로 이동
	 */
	@RequestMapping("repository.p")
	public String repositoyPage(HttpSession session, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Repositories> list = repoService.selectRepoList(userNo);

		model.addAttribute("list", list);
		
		return "repository/repository";
	}
	
	
	
	/**
	 * 레파지토리 디테일에 들어갔을 때 실행되는 메서드
	 * 언어 사용율, contents, readme.md, members
	 * @throws JsonProcessingException 
	 * @throws JsonMappingException 
	 */
	@RequestMapping("repoDetail.p")
	public String repoDetail(HttpSession session,int rNo , Model model) throws JsonMappingException, JsonProcessingException{
		Repositories repo = repoService.selectRepo(rNo);
		
		
		String url = repo.getUserName()+"/"+repo.getRepoName()+"/languages";
		
		String repository = repo.getUserName()+"/"+repo.getRepoName();
		
		String check = (String)session.getAttribute("repository");
		
		if(repository.equals(check)) {
			return "repository/repositoryDetail";
		}
		
		
		session.setAttribute("repository", repository);
		session.setAttribute("repoName", repo.getRepoName());
		
		
		
		
		
		// 언어 사용률 가져오는 부분
		Mono<String> responseText = repoService.asynHttpRequest(url, session).subscribeOn(Schedulers.boundedElastic());
		
		String repoContentsUrl =  repo.getUserName()+"/";
		repoContentsUrl += repo.getRepoName()+"/contents";
		Mono<String> responseText1 = repoService.asynHttpRequest(repoContentsUrl, session).subscribeOn(Schedulers.boundedElastic());
		
		String getMemberUrl = repo.getUserName()+"/";
		getMemberUrl+= repo.getRepoName()+"/collaborators";
		
		Mono<String> members = repoService.asynHttpRequest(getMemberUrl, session).subscribeOn(Schedulers.boundedElastic());
		System.out.println();
		
		// 프로젝트, 마일스톤 가져오자
		
		Tuple3<String, String, String> tuple3 = Mono.zip(responseText,responseText1,members).block();
		
		
		Map<String, Double> map = new Gson().fromJson(tuple3.getT1(), Map.class);
		
		int sum = 0;
		for(String key:map.keySet()) {
			sum += map.get(key);
		}
		
		for(String key:map.keySet()) {
			map.replace(key, Math.round(map.get(key)/sum*100*10)/10.0);
		}
		
		ArrayList<Content> list = new ArrayList<Content>();
		
		ObjectMapper obj = new ObjectMapper();
		JsonNode jsonNode;
		
		jsonNode = obj.readTree(tuple3.getT2());
		String findMd = "";
		for(int i = 0; i<jsonNode.size(); i++) {
			
			String name = jsonNode.get(i).get("name").asText();
			String downloadUrl = jsonNode.get(i).get("download_url").asText();
			String type = jsonNode.get(i).get("type").asText();
			String size = Math.round(jsonNode.get(i).get("size").asDouble()*10/1000)/10.0+ "KB";
			if(name.indexOf(".md")!= -1) {
				findMd = downloadUrl;
			}
			
			list.add(new Content(name, downloadUrl,type,size));
		}
		
		Collections.sort(list);
		
		String text1 = "";
		String text = "";
		if(findMd.length()>0) {
			
			text1 = repoService.getGitContentsByGet1(findMd, session);
			
			Parser parser = Parser.builder().build();
	        HtmlRenderer renderer = HtmlRenderer.builder().build();
	        text = renderer.render(parser.parse(text1));
		}
		
		jsonNode = obj.readTree(tuple3.getT3());
		ArrayList<Member> mList = new ArrayList<Member>();
		
		for(int i = 0; i<jsonNode.size(); i++) {
			Member m = new Member();
			String userName = jsonNode.get(i).get("login").asText();
			String avatarUrl = jsonNode.get(i).get("avatar_url").asText();
			String roleName = jsonNode.get(i).get("role_name").asText();
			m.setUserName(userName);
			m.setProfile(avatarUrl);
			m.setRollName(roleName);
			
			mList.add(m);
		}
		
		
		// 레파지토리 멤버 세션에 저장
		session.setAttribute("RepoMembers", mList);
		
		
		session.setAttribute("list",list);
		session.setAttribute("map",map);
		session.setAttribute("repo",repo);
		session.setAttribute("text",text);
		session.setAttribute("mList",mList);
		
//		model.addAttribute("list",list);
//		model.addAttribute("map",map);
//		model.addAttribute("repo",repo);
//		model.addAttribute("text",text);
//		model.addAttribute("mList",mList);
		
		
		return "repository/repositoryDetail";
		
	}
	
	
	
	// repository 등록시 사용
	@RequestMapping("enrollRepo.p")
	public String enrollRepository(Repositories r, HttpSession session) throws IOException {
		
		String url = r.getUserName()+"/"+r.getRepoName();
		
		String responseText = repoService.synHttpRequest(url, session,"get");
		JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
		String status = totalObj.get("private").getAsString();
		
		if(status.equals("true")) {
			r.setRepoStatus("Private");
		}else {
			r.setRepoStatus("Public");
		}
		
		if(r.getRepoStatus() != null) {
			
			int result = repoService.insertRepo(r);
			
		}
		
		
		return "redirect:repository.p";
	}
	
	
	@RequestMapping("ajaxGetContent")
	@ResponseBody
	public String ajaxGetContent(String path, HttpSession session) {
		
		//System.out.println(path);
		String response = repoService.synHttpRequest(path, session,"get");
		
		
		Gson gson = new Gson();

		
		Type listType = new TypeToken<ArrayList<Content>>(){}.getType();
		
		ArrayList<Content> contArray = gson.fromJson(response, listType);
		
		for(Content c: contArray) {
			c.setSize(Math.round(Integer.parseInt(c.getSize())*10/1000)/10.0+ "KB");
		}
		
		Collections.sort(contArray);
		
		return gson.toJson(contArray);
		
		
	}
	
	@RequestMapping(value = "getMdFile", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String getMdFile(String url, HttpSession session) {
		String text = repoService.getGitContentsByGet1(url, session);
		
		Parser parser = Parser.builder().build();
        HtmlRenderer renderer = HtmlRenderer.builder().build();
        String html = renderer.render(parser.parse(text));
        
		return html;
	}
	
	@RequestMapping(value="ajaxFileContent", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String ajaxGetFileContent(String path, HttpSession session) {
		String text = repoService.getGitContentsByGet1(path, session);
		return text;
	}
	
	@RequestMapping(value="updateRepoContent.p", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String updateRepoContent(Repositories repo) {
		
		int result = repoService.updateRepoContent(repo);
		
		String text = repoService.getRepoContent(repo);
		return text;
		
	}
	
	
	// 멤버 초대 ajax
	@RequestMapping(value="addRepoMember.p")
	@ResponseBody
	public String addRepoMemer(String id, HttpSession session) {
		String repository = (String)session.getAttribute("repository");
		
		String url = repository+"/collaborators/"+id;
		
		String response = repoService.synHttpRequest(url, session,"put");
		System.out.println(response);
		
		return response;
	}
	
	
	// 멤버 추방 ajax
	@RequestMapping("removeRepoMember.p")
	@ResponseBody
	public String removeRepoMember(String id, HttpSession session) {
		
		String repository = (String)session.getAttribute("repository");
		String url = repository+"/collaborators/"+id;
		
		String response = repoService.synHttpRequest(url, session,"delete");
		
		return response;
		
		
	}
	
	
	
}
