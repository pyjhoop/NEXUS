package com.team.nexus.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.member.model.vo.Member;

@Repository
public class MemberDao {

	public int idCheck(SqlSessionTemplate sqlSession, String id) {
		System.out.println(id);
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}
	
	public Member findKaKao(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		return sqlSession.selectOne("memberMapper.findKaKao", userInfo);
	}
	
	public void insertKaKao(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		sqlSession.insert("memberMapper.insertKaKao", userInfo);
	}


	public int resetPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.resetPwd", m);
	}
}
