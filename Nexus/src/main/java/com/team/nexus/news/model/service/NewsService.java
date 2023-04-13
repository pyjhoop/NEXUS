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
	private NewsDao newsDao;
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	public ArrayList<News> selectList() {
		return newsDao.selectList(sqlsession);
	}

	public ArrayList<News> selectList(int page) {
		return newsDao.selectList(sqlsession, page);
	}

	public ArrayList<NewsReply> selectrList(int newsNo) {
		System.out.println(newsNo);
		return newsDao.selectrList(sqlsession, newsNo);
	}

	public int newsReplyInsert(NewsReply nr) {
		return newsDao.newsReplyInsert(sqlsession, nr);
	}

	public int insertNews(News n) {
		return newsDao.insertNews(sqlsession, n);
	}

	public News selectNews(int nNo) {
		return newsDao.selectNews(sqlsession, nNo);
	}


}
