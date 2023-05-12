package com.team.nexus.recruit.model.service;

import java.util.ArrayList;

import com.team.nexus.pr.model.vo.PageInfo;
import com.team.nexus.recruit.model.vo.Recruit;

public interface RecruitService {
	
	int selectListCount();
	ArrayList<Recruit> selectRecruit(PageInfo pi);
	
	
	
	 int insertRecruit(Recruit re);
	 
	 int increaseCount(int pjtPrNo);
	  
	 
	 Recruit recruitDetail(int pjtPrNo);
	  
	 ArrayList<Recruit> selectRecruitAjax(String[] strArr);
	 

}
