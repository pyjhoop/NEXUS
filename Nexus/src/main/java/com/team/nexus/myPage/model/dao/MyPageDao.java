package com.team.nexus.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.member.model.vo.Member;

@Repository
public class MyPageDao {

	public int myPageUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.myPageUpdate", m);
	}
	
	public int memberDelete(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.memberDelete", m);
	}
}
