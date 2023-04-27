package com.team.nexus.friend.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.friend.model.vo.Friend;

@Repository
public class FriendDao {

	public ArrayList<Friend> selectList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("friendMapper.selectList");
	}
	
}
