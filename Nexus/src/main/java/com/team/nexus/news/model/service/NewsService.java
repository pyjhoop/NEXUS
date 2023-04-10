package com.team.nexus.news.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.news.model.dao.NewsDao;
import com.team.nexus.news.model.vo.News;
import com.team.nexus.news.model.vo.NewsReply;

@Service
public class NewsService {
	
	@Autowired
	private NewsDao newsdao;
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	public ArrayList<News> selectList() {
		return newsdao.selectList(sqlsession);
	}

	public ArrayList<News> selectList(int page) {
		return newsdao.selectList(sqlsession, page);
	}

	public ArrayList<NewsReply> selectrList(int newsNo) {
		return newsdao.selectrList(sqlsession, newsNo);
	}

}
