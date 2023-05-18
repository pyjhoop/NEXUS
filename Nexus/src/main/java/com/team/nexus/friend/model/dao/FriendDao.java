package com.team.nexus.friend.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.friend.model.vo.Friend;

@Repository
public class FriendDao {

	public ArrayList<Friend> selectList(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("friendMapper.selectList", userNo);
	}

	public ArrayList<Friend> searchList(SqlSessionTemplate sqlSession, int userNo, String keyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo+"");
		map.put("keyword", keyword);
		return (ArrayList)sqlSession.selectList("friendMapper.searchList", map);
	}

	public int addFriend(SqlSessionTemplate sqlSession, int userNo, String addUserNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo+"");
		map.put("addUserNo", addUserNo);
		return sqlSession.insert("friendMapper.addFriend", map);
	}

	public int delFriend(SqlSessionTemplate sqlSession, int userNo, String delUserNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo+"");
		map.put("delUserNo", delUserNo);
		return sqlSession.delete("friendMapper.delFriend", map);
	}

	public int banFriend(SqlSessionTemplate sqlSession, int userNo, String banUserNo, String isBanned,
			String isFriend) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo+"");
		map.put("banUserNo", banUserNo);
		
		if(isBanned.contains("N") && isFriend.contains("N")) {
			System.out.println("모르는사람차단");
			return sqlSession.insert("friendMapper.banAddFriend", map);
		} 
		else if(isBanned.contains("N") && isFriend.contains("Y")) {
			System.out.println("친구차단");
			return sqlSession.update("friendMapper.banUpdateFriend", map);
		}
		else {
			System.out.println("차단해");
			return sqlSession.delete("friendMapper.banDelFriend", map);
		}
	}
	
}
