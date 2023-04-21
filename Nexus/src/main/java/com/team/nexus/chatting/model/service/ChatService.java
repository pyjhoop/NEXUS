package com.team.nexus.chatting.model.service;

import java.util.ArrayList;

import com.team.nexus.chatting.model.vo.ChatMessage;
import com.team.nexus.chatting.model.vo.ChatRoom;
import com.team.nexus.chatting.model.vo.ChatUser;
import com.team.nexus.member.model.vo.Member;

public interface ChatService {

	 int insertMessage(ChatMessage chatMessage);

	 ArrayList<ChatRoom> selectRoom(int userNo);
	 
	 ArrayList<ChatUser> selectRoomUser(int userNo);
	 
	 ArrayList<ChatMessage> selectMessage(int rno);
	
	 ArrayList<Member> searchUser(Member m);
	 
	 int createRoom();
	 
	 void insertChatUser(int user);
	 
	 void insertChatGroupUser(int user);
	 
	 int createGroupRoom(ChatRoom c);
	 
	 int updateMessage(ChatMessage chatMessage);
	 
	 int unreadMessage(ChatMessage chatMessage);
	 
	 ArrayList<ChatUser> selectUnreadMessage(int userNo);
	 
	 int readMessage(ChatUser cu);
	 
	 ArrayList<ChatRoom> updateRoom(int userNo);
	 
	 ChatUser checkUser(ChatMessage chatMessage);
	 
	 int inviteUser(ChatMessage chatMessage);
	 
	 Member selectMember(int userNo);
	 
	 void firstEntry(Member m);
}
