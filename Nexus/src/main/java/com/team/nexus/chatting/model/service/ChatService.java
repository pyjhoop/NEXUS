package com.team.nexus.chatting.model.service;

import java.util.ArrayList;

import com.team.nexus.chatting.model.vo.ChatMessage;
import com.team.nexus.chatting.model.vo.ChatRoom;

public interface ChatService {

	 int insertMessage(ChatMessage chatMessage);

	 ArrayList<ChatRoom> selectRoom(int userNo);
	

}
