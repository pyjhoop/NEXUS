package com.team.nexus.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	public int idCheck(SqlSessionTemplate sqlSession, String id) {
		System.out.println(id);
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}

}
