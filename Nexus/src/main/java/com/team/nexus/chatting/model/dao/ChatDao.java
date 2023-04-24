package com.team.nexus.chatting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.chatting.model.vo.ChatMessage;
import com.team.nexus.chatting.model.vo.ChatRoom;
import com.team.nexus.chatting.model.vo.ChatUser;
import com.team.nexus.member.model.vo.Member;

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
	
	public int insertMessage(SqlSessionTemplate sqlSession, ChatMessage chatMessage) {
		return sqlSession.insert("chattingMapper.insertMessage", chatMessage);
	}
	public ArrayList<Member> searchUser(SqlSessionTemplate sqlSession,Member m){
		return (ArrayList)sqlSession.selectList("chattingMapper.searchUser", m);
	}
	public int createRoom(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("chattingMapper.createRoom");
	}
	public void insertChatUser(SqlSessionTemplate sqlSession, ChatUser c) {
		sqlSession.insert("chattingMapper.insertChatUser",c);
	}
	
	public int createGroupRoom(SqlSessionTemplate sqlSession,ChatRoom c) {
		return sqlSession.insert("chattingMapper.createGroupRoom",c);
	}
	
	public int updateMessage(SqlSessionTemplate sqlSession,ChatMessage chatMessage) {
		return sqlSession.update("chattingMapper.updateMessage", chatMessage);
	}
	
	public int unreadMessage(SqlSessionTemplate sqlSession,ChatMessage chatMessage) {
		return sqlSession.update("chattingMapper.unreadMessage", chatMessage);
	}
	
	public ArrayList<ChatUser> selectUnreadMessage(SqlSessionTemplate sqlSession,int userNo){
		return (ArrayList)sqlSession.selectList("chattingMapper.selectUnreadMessage", userNo);
	}
	
	public int readMessage(SqlSessionTemplate sqlSession,ChatUser cu) {
		return sqlSession.update("chattingMapper.readMessage", cu);
	}
	
	public ArrayList<ChatRoom> updateRoom(SqlSessionTemplate sqlSession,int userNo){
		return (ArrayList)sqlSession.selectList("chattingMapper.updateRoom", userNo);
	}
	
	public ChatUser checkUser(SqlSessionTemplate sqlSession,ChatMessage chatMessage) {
		return sqlSession.selectOne("chattingMapper.checkUser", chatMessage);
	}
	
	public int inviteUser(SqlSessionTemplate sqlSession,ChatMessage chatMessage) {
		return sqlSession.insert("chattingMapper.inviteUser", chatMessage);
	}
	
	public Member selectMember(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("chattingMapper.selectMember", userNo);
	}
	
	public void firstEntry(SqlSessionTemplate sqlSession,Member m) {
		sqlSession.insert("chattingMapper.firstEntry", m);
	}
	
	public int exitRoom(SqlSessionTemplate sqlSession,ChatMessage chatMessage) {
		return sqlSession.delete("chattingMapper.exitRoom", chatMessage);
	}
	
	public int hideRoom(SqlSessionTemplate sqlSession, ChatUser cu) {
		return sqlSession.update("chattingMapper.hideRoom", cu);
	}
	
	public ChatUser selectHideUser(SqlSessionTemplate sqlSession,ChatMessage chatMessage) {
		return sqlSession.selectOne("chattingMapper.selectHideUser", chatMessage);
	}
	
	public int displayRoom(SqlSessionTemplate sqlSession,ChatMessage chatMessage) {
		return sqlSession.update("chattingMapper.displayRoom", chatMessage);
	}
}
