package com.team.nexus.news.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.team.nexus.news.model.service.NewsService;
import com.team.nexus.news.model.vo.News;
import com.team.nexus.news.model.vo.NewsReply;

@Controller
public class NewsController {

	@Autowired
	private NewsService newsService;
	
	@RequestMapping("news.p")
	public String newsPage(Model model) {
		
		ArrayList<News> list = newsService.selectList();
		model.addAttribute("list", list);
		
		//댓글 리스트
		ArrayList<ArrayList<NewsReply>> allList = new ArrayList();
		
		for(int i =1; i<=list.size(); i++) {
			allList.add(newsService.selectrList(list.get(i-1).getNewsNo()));
		}
		
		model.addAttribute("allList",allList);
		
		System.out.println(allList);
		
		return "news/newsList";
	}
	
	@ResponseBody
	@RequestMapping(value = "ajaxNewsList.p", produces = "aplication/json; charset=utf-8")
	public String ajaxNewsList(int page) {
		
		ArrayList<News> list = newsService.selectList(page);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping("newsEnrollForm.p")
	public String newsEnrollFormPage() {
		return "news/newsEnrollForm2";
	}
	
	@ResponseBody
	@RequestMapping(value = "ajaxNewsReplyList.p", produces = "application/json; charset=utf-8")
	public String ajaxNewsReplyList(String list) {
		
		//댓글 리스트
		ArrayList<ArrayList<NewsReply>> allList = new ArrayList();
		
		String[] arr = list.split(" "); 
		
		for(int i =1; i<=arr.length; i++) {
			System.out.println(arr[i-1]);
			allList.add(newsService.selectrList(Integer.parseInt(arr[i-1])));
		}
		
		
		return new Gson().toJson(allList);
		
	}
	
	@RequestMapping(value = "nrinsert.p", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String newsReplyInsert(NewsReply nr) {
		//insert 후에 arraylist 조회
		int count = newsService.newsReplyInsert(nr);
		//System.out.println(count);
		
		//화면에 전체 댓글 보여주기
		ArrayList<NewsReply> list = newsService.selectrList(nr.getNewsNo());
	
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	
	@RequestMapping("insertNews")
	public String insertNews(News n) {
		
		int result = newsService.insertNews(n);
		
		return "redirect:news.p";
	}
	
	
	@PostMapping("insert.n")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> insertNewsImg(@RequestParam("images") MultipartFile multi, HttpSession session) {
		String changeName = "";
		String finalName = "";
		 Map<String, Object> response = new HashMap<>();
		if(!multi.getOriginalFilename().equals("")) {
			String originName = multi.getOriginalFilename();
			
			// 년월일시분초
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			//랜덤 숫자 5자리
			int ranNum = (int)(Math.random()*90000+10000);
			
			// 확장자
			String ext = originName.substring(originName.lastIndexOf("."));
			
			changeName = currentTime+ranNum+ext; 
			
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			finalName = "resources/uploadFiles/"+changeName;
			System.out.println(finalName);
			response.put("url", finalName);
		
			//서버에 파일 업로드
			try {
				multi.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(response,HttpStatus.OK);
	}
}
