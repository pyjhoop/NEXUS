package com.team.nexus.chatting.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.nexus.chatting.model.service.ChatServiceImpl;
import com.team.nexus.chatting.model.vo.ChatMessage;
import com.team.nexus.chatting.model.vo.ChatRoom;
import com.team.nexus.chatting.model.vo.ChatUser;
import com.team.nexus.member.model.vo.Member;

@Controller
public class ChattingController {
	
	@Autowired
	private ChatServiceImpl cService;
	
	@RequestMapping("selectChat.ih")
	public String selectChattingRoom(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<ChatRoom> rList = cService.selectRoom(userNo);
		ArrayList<ChatUser> uList = cService.selectRoomUser(userNo);
		model.addAttribute("rList",rList);
		model.addAttribute("uList",uList);
		System.out.println(rList);
		System.out.println(uList);
		return "chatting/chattingRoom";
	}
	
	@RequestMapping("roomDetail.ih")
	public void selectRoomDetail(int rno, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<ChatMessage> cList = cService.selectMessage(rno); 
	}
}
