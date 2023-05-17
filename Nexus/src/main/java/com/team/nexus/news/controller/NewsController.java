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
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.news.model.service.NewsService;
import com.team.nexus.news.model.vo.News;
import com.team.nexus.news.model.vo.NewsReply;
import com.team.nexus.news.model.vo.Zzim;

@Controller
public class NewsController {

	@Autowired
	private NewsService newsService;
	
	@RequestMapping("news.p")
	public String newsPage(Model model) {
		
		ArrayList<News> list = newsService.selectList();
		model.addAttribute("list", list);
		
		//댓글 리스트
		/*  페이지 수정하면서 더이상 필요없어진 코드
		ArrayList<ArrayList<NewsReply>> allList = new ArrayList();
		
		for(int i =1; i<=list.size(); i++) {
			allList.add(newsService.selectrList(list.get(i-1).getNewsNo()));
		}
		
		model.addAttribute("allList",allList);
		*/
		
		
		return "news/newsList";
	}
	
	@ResponseBody
	@RequestMapping(value = "ajaxNewsList.p", produces = "aplication/json; charset=utf-8")
	public String ajaxNewsList(int page, HttpSession session) {
		
		String state = (String)session.getAttribute("state");
		
		ArrayList<News> list = newsService.selectList(page,state);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping("newsEnrollForm.p")
	public String newsEnrollFormPage(Model model) {
		model.addAttribute("status", "E"); // E: Enroll
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
		nr.setCommentContent(nr.getCommentContent().replace("\n", "<br>"));
		nr.setCommentContent(nr.getCommentContent().replace("<br><br>", "<br>"));
		int count = newsService.newsReplyInsert(nr);
		//System.out.println(count);
		
		//화면에 전체 댓글 보여주기
		ArrayList<NewsReply> list = newsService.selectrList(nr.getNewsNo());
	
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	
	@RequestMapping("insertNews")
	public String insertNews(News n) {
		
		int index = n.getNewsContent().lastIndexOf(",");
		
		n.setNewsContent(n.getNewsContent().substring(0, index));
		
		int result = newsService.insertNews(n);
		
		System.out.println(n);
		
		return "redirect:news.p";
	}
	
	
	@PostMapping("insert.n")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> insertNewsImg(@RequestParam("images") MultipartFile multi, HttpSession session) throws IOException {
		String changeName = "";
		String finalName = "";
		 Map<String, Object> response = new HashMap<>();
		if(!multi.getOriginalFilename().equals("")) {
			String originName = multi.getOriginalFilename();
			
	        
			
			
			// 바디 추가해야함
			
			
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
	
	@RequestMapping("newsDetail.p")
	public String newsDetailPage(int nNo, Model model, HttpSession session) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		News n = newsService.selectNews(nNo);
		ArrayList<NewsReply> rlist = newsService.selectrList(nNo);
		int count = newsService.countrList(nNo);
		
		// 로그인한 사람이 해당 뉴스에 좋아요를 했는지 확인하는 메서드
		Zzim z = new Zzim();
		z.setNewsNo(nNo);
		z.setUserNo(userNo+"");
		int check = newsService.likeCount1(z);
		
		int total = newsService.totalLikeCount(z);
		
		
		
		
		model.addAttribute("news", n);
		model.addAttribute("rlist",rlist);
		model.addAttribute("count",count);
		model.addAttribute("check",check);
		model.addAttribute("total",total);
		
		
		return "news/newsDetailPage";
	}
	
	
	@RequestMapping("updateNews.p")
	public String updateNewsPage(int nNo, Model model) {
		
		News n = newsService.selectNews(nNo);
		model.addAttribute("news", n);
		
		return "news/newsEnrollForm";
	}
	
	
	@RequestMapping("deleteNews")
	public String deleteNews(int newsNo) {
		
		int result = newsService.deleteNews(newsNo);
		
		if(result >0) {
			return "redirect:news.p";
		}else {
			return "redirect:newsDetail.p?nNo="+newsNo;
		}
	}
	
	@RequestMapping("updateNews")
	public String updateNews(News n) {
		
		System.out.println("====update====");
		System.out.println(n);
		
		int index = n.getNewsContent().lastIndexOf(",");
		String str = n.getNewsContent().substring(0, index);
		n.setNewsContent(str);
		
		int result = newsService.updateNews(n);
		return "redirect:news.p";
	}
	
	@RequestMapping("newsLike")
	@ResponseBody
	public String ajaxNewsLike(Zzim z) {
		// 내가 찜했는지 조회부터
		int result = newsService.likeCount(z);
		
		if(result>0) { //update
			int upd = newsService.updateLike(z);
		}else {//insert
			int ins = newsService.insertLike(z);
		}
		
		// newsNo에 찜한 개수
		int total = newsService.totalLikeCount(z);
		
		return total+"";
		
	}
	
	@RequestMapping("newsUnlike")
	@ResponseBody
	public String ajaxNewsUnlike(Zzim z) {
		
		int result =newsService.updateUnlike(z);
		
		int total = newsService.totalLikeCount(z);
		
		return total+"";
	}
	

	@RequestMapping(value="ajaxRepage.p", produces = "application/json; cahrset=utf-8")
	@ResponseBody
	public String ajaxRepage(String state, HttpSession session) {
		
		if(state.equals("my")) {
			state = ((Member)session.getAttribute("loginUser")).getUserNo()+"";
		}
		
		session.setAttribute("state", state);
		
		ArrayList<News> list = newsService.ajaxRepage(state);
		
		return new Gson().toJson(list);
	}
	
	
	
}
