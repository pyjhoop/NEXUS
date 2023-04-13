package com.team.nexus.chatting.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.chatting.model.dao.ChatDao;
import com.team.nexus.chatting.model.vo.ChatMessage;
import com.team.nexus.chatting.model.vo.ChatRoom;
import com.team.nexus.chatting.model.vo.ChatUser;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ChatUser> selectRoomUser(int userNo) {
		
		return cDao.selectRoomUser(sqlSession, userNo);
	}

	@Override
	public ArrayList<ChatMessage> selectMessage(int rno) {
		
		return cDao.selectMessage(sqlSession,rno);
	}

}
