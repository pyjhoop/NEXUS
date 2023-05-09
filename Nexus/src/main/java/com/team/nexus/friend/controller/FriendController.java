package com.team.nexus.friend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.team.nexus.friend.model.service.FriendService;
import com.team.nexus.friend.model.vo.Friend;
import com.team.nexus.member.model.vo.Member;

@Controller
public class FriendController {

	@Autowired
	private FriendService friendService;
	
	@RequestMapping("friend.me")
	public String friendPage(Model model, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<Friend> list = friendService.selectList(userNo);
		model.addAttribute("list", list);
		
		return "friend/friend";
	}
	
	@ResponseBody
	@RequestMapping(value="selectFriend.me", produces = "aplication/json; charset=utf-8")
	public String friendSelect(Model model, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<Friend> list = friendService.selectList(userNo);
		//model.addAttribute("list", list);
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="searchFriend.me", produces = "aplication/json; charset=utf-8")
	public String friendSearch(Model model, HttpSession session, String keyword) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		System.out.println(keyword);
		ArrayList<Friend> list = friendService.searchList(userNo, keyword);
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("addFriend.me")
	public String friendAdd(String addUserNo, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		int result = friendService.addFriend(userNo, addUserNo);
		
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping("delFriend.me")
	public String friendDel(String delUserNo, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		int result = friendService.delFriend(userNo, delUserNo);
		
		return result+"";
	}
	
	
	@ResponseBody
	@RequestMapping("banFriend.me")
	public String friendDel(String banUserNo, String isBanned, String isFriend, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		System.out.println("컨트롤러 탐");
		int result = friendService.banFriend(userNo, banUserNo, isBanned, isFriend);
		
		return result+"";
	}
}
