package com.team.nexus.chatting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.chatting.model.vo.ChatRoom;

@Repository
public class ChatDao {
	
	public ArrayList<ChatRoom> selectRoom(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("chatting-mapper.selectRoom", userNo);
	}
}
