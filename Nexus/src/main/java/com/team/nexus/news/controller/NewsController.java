package com.team.nexus.news.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "news/newsEnrollForm";
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
}
