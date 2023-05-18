package com.team.nexus.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.member.model.dao.MemberDao;
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.repository.model.vo.Repositories;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;
	
	//Method
	
	public int idCheck(String id) {
		int checkCount = mDao.idCheck(sqlSession, id);
		
		return checkCount;
	}

	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	public Member selectMember(Member m) {
		return mDao.selectMember(sqlSession, m);
	}


	public int resetPwd(Member m) {
		return mDao.resetPwd(sqlSession, m);
	}

	public int enrollToken(Member m) {
		return mDao.enrollToken(sqlSession, m);
	}

	public int updateConnection(int no) {
		return mDao.updateConnection(sqlSession, no);
	}

	public int changePwd(Member m) {
		return mDao.changePwd(sqlSession, m);
	}

	
	

}
