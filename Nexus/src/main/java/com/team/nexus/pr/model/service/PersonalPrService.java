package com.team.nexus.pr.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.nexus.pr.model.dao.PersonalDao;
import com.team.nexus.pr.model.vo.PageInfo;
import com.team.nexus.pr.model.vo.PersonalPr;

public interface PersonalPrService {
	
	int selectListCount();
	ArrayList<PersonalPr> selectPersonalPr(PageInfo pi);
	
	
	int insertPersonalPr(PersonalPr pr);
		
	}
	
	
	


