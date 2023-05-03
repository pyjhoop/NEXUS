package com.team.nexus.myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.member.model.vo.Member;
import com.team.nexus.myPage.model.dao.MyPageDao;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyPageDao mDao;

	@Override
	public int myPageUpdate(Member m) {
		return mDao.myPageUpdate(sqlSession, m);
	}

	@Override
	public int memberDelete(Member m) {
		return mDao.memberDelete(sqlSession, m);
	}

}
