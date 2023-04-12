package com.team.nexus.chatting.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.nexus.chatting.model.service.ChatServiceImpl;
import com.team.nexus.chatting.model.vo.ChatRoom;
import com.team.nexus.member.model.vo.Member;

@Controller
public class ChattingController {
	
	@Autowired
	private ChatServiceImpl cService;
	
	@RequestMapping("selectChat.ih")
	public String selectChattingRoom(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<ChatRoom> list = cService.selectRoom(userNo);
		
		return "chatting/chattingRoom";
	}
}
