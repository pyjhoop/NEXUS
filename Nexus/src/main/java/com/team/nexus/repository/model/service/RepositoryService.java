package com.team.nexus.repository.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.repository.model.dao.RepositoryDao;
import com.team.nexus.repository.model.vo.Repositories;

@Service
public class RepositoryService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RepositoryDao rDao;
	
	public int insertRepo(Repositories r) {
		return rDao.insertRepo(sqlSession, r);
	}

	public ArrayList<Repositories> selectRepoList(int userNo) {
		return rDao.selectRepoList(sqlSession,userNo);
	}

	public Repositories selectRepo(int rNo) {
		return rDao.selectRepo(sqlSession, rNo);
	}

	public int updateRepoContent(Repositories repo) {
		return rDao.updateRepoContent(sqlSession, repo);
	}

	public String getRepoContent(Repositories repo) {
		return rDao.getRepoContent(sqlSession, repo);
	}


}
