package com.team.nexus.pr.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.nexus.pr.model.dao.PersonalDao;

public class PersonalPrService {
	
	@Autowired
	private PersonalDao personalDao;
	
	@Autowired
	private SqlSessionTemplate sqlsession;

}
