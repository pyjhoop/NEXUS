package com.team.nexus.pr.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.pr.model.dao.PersonalDao;
import com.team.nexus.pr.model.vo.PageInfo;
import com.team.nexus.pr.model.vo.PersonalPr;

@Service
public class PersonalPrServiceImpl implements PersonalPrService {
	 
	@Autowired
	private PersonalDao pDao;
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		return pDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<PersonalPr> selectPersonalPr(PageInfo pi) {
		return pDao.selectPersonalPr(sqlSession, pi);
	}

	
	@Override
	public int insertPersonalPr(PersonalPr pr) {
		int result = pDao.insertPersonalPr(sqlSession, pr);
		return result;
	}
	
	
	@Override
	public int increaseCount(int personalPrNo) {
		return pDao.increaseCount(sqlSession, personalPrNo );
	}

	@Override
	public PersonalPr personalPrDetail(int personalPrNo) {
		return pDao.personalPrDetail(sqlSession, personalPrNo);
	}

	@Override
	public ArrayList<PersonalPr> selectPrAjax(String[] strArr) {
		return pDao.selectPrAjax(sqlSession, strArr);
	}
	
	
		
		
	}

