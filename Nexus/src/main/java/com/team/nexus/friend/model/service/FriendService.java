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
	
	
	
}
