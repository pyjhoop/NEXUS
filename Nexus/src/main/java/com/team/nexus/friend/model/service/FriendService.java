package com.team.nexus.friend.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.friend.model.dao.FriendDao;
import com.team.nexus.friend.model.vo.Friend;

@Service
public class FriendService {

	@Autowired
	private FriendDao friendDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Friend> selectList(int userNo) {
		return friendDao.selectList(sqlSession, userNo);
	}

	public ArrayList<Friend> searchList(int userNo, String keyword) {
		return friendDao.searchList(sqlSession, userNo, keyword);
	}

	public int addFriend(int userNo, String addUserNo) {
		return friendDao.addFriend(sqlSession, userNo, addUserNo);
	}

	public int delFriend(int userNo, String delUserNo) {
		return friendDao.delFriend(sqlSession, userNo, delUserNo);

	}

	public int banFriend(int userNo, String banUserNo, String isBanned, String isFriend) {
		System.out.println("서비스탐");
		return friendDao.banFriend(sqlSession, userNo, banUserNo, isBanned, isFriend);
	}
	
	
	
}
