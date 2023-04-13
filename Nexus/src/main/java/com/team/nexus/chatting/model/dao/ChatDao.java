package com.team.nexus.chatting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.chatting.model.vo.ChatMessage;
import com.team.nexus.chatting.model.vo.ChatRoom;
import com.team.nexus.chatting.model.vo.ChatUser;

@Repository
public class ChatDao {
	
	public ArrayList<ChatRoom> selectRoom(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("chattingMapper.selectRoom", userNo);
	}
	
	public ArrayList<ChatUser> selectRoomUser(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("chattingMapper.selectRoomUser", userNo);
	}
	
	public ArrayList<ChatMessage> selectMessage(SqlSessionTemplate sqlSession, int rno){
		return (ArrayList)sqlSession.selectList("chattingMapper.selectMessage", rno);
	}
}
