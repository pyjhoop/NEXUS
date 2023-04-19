package com.team.nexus.chatting.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.chatting.model.dao.ChatDao;
import com.team.nexus.chatting.model.vo.ChatMessage;
import com.team.nexus.chatting.model.vo.ChatRoom;
import com.team.nexus.chatting.model.vo.ChatUser;
import com.team.nexus.member.model.vo.Member;
@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao cDao;
	
	@Override
	public ArrayList<ChatRoom> selectRoom(int userNo) {
		
		return cDao.selectRoom(sqlSession, userNo);
	}

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		
		return cDao.insertMessage(sqlSession, chatMessage);
	}

	@Override
	public ArrayList<ChatUser> selectRoomUser(int userNo) {
		
		return cDao.selectRoomUser(sqlSession, userNo);
	}

	@Override
	public ArrayList<ChatMessage> selectMessage(int rno) {
		
		return cDao.selectMessage(sqlSession,rno);
	}

	@Override
	public ArrayList<Member> searchUser(String search) {
		return cDao.searchUser(sqlSession,search);
	}

	@Override
	public int createRoom() {
		return cDao.createRoom(sqlSession);
	}

	@Override
	public void insertChatUser(int user) {
		ChatUser c = new ChatUser();
		c.setUserNo(user);
		c.setStatus("S");
		cDao.insertChatUser(sqlSession,c);
		
	}

	@Override
	public int createGroupRoom(ChatRoom c) {
		return cDao.createGroupRoom(sqlSession,c);
	}

	@Override
	public void insertChatGroupUser(int user) {
		ChatUser c = new ChatUser();
		c.setUserNo(user);
		c.setStatus("G");
		cDao.insertChatUser(sqlSession,c);
		
	}

	@Override
	public int updateMessage(ChatMessage chatMessage) {
		return cDao.updateMessage(sqlSession, chatMessage);
	}

	@Override
	public int unreadMessage(ChatMessage chatMessage) {
		return cDao.unreadMessage(sqlSession,chatMessage);
	}

}
