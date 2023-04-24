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
	public ArrayList<Member> searchUser(Member m) {
		return cDao.searchUser(sqlSession,m);
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

	@Override
	public ArrayList<ChatUser> selectUnreadMessage(int userNo) {
		return cDao.selectUnreadMessage(sqlSession, userNo);
	}

	@Override
	public int readMessage(ChatUser cu) {
		return cDao.readMessage(sqlSession, cu);
	}

	@Override
	public ArrayList<ChatRoom> updateRoom(int userNo) {
		return cDao.updateRoom(sqlSession, userNo);
	}

	@Override
	public ChatUser checkUser(ChatMessage chatMessage) {
		return cDao.checkUser(sqlSession,chatMessage);
	}

	@Override
	public int inviteUser(ChatMessage chatMessage) {
		return cDao.inviteUser(sqlSession,chatMessage);
	}

	@Override
	public Member selectMember(int userNo) {
		return cDao.selectMember(sqlSession,userNo);
	}

	@Override
	public void firstEntry(Member m) {
		m.setUserName(m.getUserName()+"님이 입장하였습니다.");
		cDao.firstEntry(sqlSession,m);
		
	}

	@Override
	public int exitRoom(ChatMessage chatMessage) {
		return cDao.exitRoom(sqlSession,chatMessage);
	}

	@Override
	public int hideRoom(ChatUser cu) {
		return cDao.hideRoom(sqlSession, cu);
	}

	@Override
	public ChatUser selectHideUser(ChatMessage chatMessage) {
		return cDao.selectHideUser(sqlSession,chatMessage);
	}

	@Override
	public int displayRoom(ChatMessage chatMessage) {
		return cDao.displayRoom(sqlSession,chatMessage);
	}

	

}
