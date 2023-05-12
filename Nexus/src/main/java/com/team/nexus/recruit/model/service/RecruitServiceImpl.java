package com.team.nexus.recruit.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.pr.model.dao.PersonalDao;
import com.team.nexus.pr.model.vo.PageInfo;
import com.team.nexus.pr.model.vo.PersonalPr;
import com.team.nexus.recruit.model.dao.RecruitDao;
import com.team.nexus.recruit.model.vo.Recruit;

@Service
public class RecruitServiceImpl implements RecruitService{
	
	@Autowired
	private RecruitDao rDao;
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Recruit> selectRecruit(PageInfo pi) {
		return rDao.selectRecruit(sqlSession, pi);
	}

	
	@Override
	public int increaseCount(int pjtPrNo) {
		return rDao.increaseCount(sqlSession, pjtPrNo );
	}
	
	@Override
	public int insertRecruit(Recruit re) {
		int result = rDao.insertRecruit(sqlSession, re);
		return result;
	}
	
	

	@Override
	public Recruit recruitDetail(int pjtPrNo) {
		return rDao.recruitDetail(sqlSession, pjtPrNo);
	}

	@Override
	public ArrayList<Recruit> selectRecruitAjax(String[] strArr) {
		return rDao.selectRecruitAjax(sqlSession, strArr);
	}

}
