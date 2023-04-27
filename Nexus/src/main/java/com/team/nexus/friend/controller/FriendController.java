package com.team.nexus.friend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.nexus.friend.model.service.FriendService;
import com.team.nexus.friend.model.vo.Friend;
import com.team.nexus.member.model.vo.Member;

@Controller
public class FriendController {

	//@Autowired
	private FriendService friendService;
	
	@RequestMapping("friend.me")
	public String friendPage(Model model, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<Friend> list = friendService.selectList(userNo);
		model.addAttribute("list", list);
		
		return "friend/friend";
	}
	
	
	
}
