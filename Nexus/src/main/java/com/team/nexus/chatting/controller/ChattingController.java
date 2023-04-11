package com.team.nexus.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {

	@RequestMapping("selectChat.ih")
	public String selectChattingRoom() {
		
		return "chatting/chattingRoom";
	}
}
