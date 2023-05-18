package com.team.nexus.news.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.news.model.dao.NewsDao;
import com.team.nexus.news.model.vo.News;
import com.team.nexus.news.model.vo.NewsReply;
import com.team.nexus.news.model.vo.Zzim;

@Service
public class NewsService {
	
	@Autowired
	private NewsDao newsDao;
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	public ArrayList<News> selectList() {
		return newsDao.selectList(sqlsession);
	}

	public ArrayList<News> selectList(int page, String state) {
		return newsDao.selectList(sqlsession, page, state);
	}

	public ArrayList<NewsReply> selectrList(int nNo) {
		System.out.println(nNo);
		return newsDao.selectrList(sqlsession, nNo);
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

	public int deleteNews(int newsNo) {
		return newsDao.deleteNews(sqlsession, newsNo);
	}

	public int countrList(int nNo) {
		return newsDao.countrList(sqlsession, nNo);
	}

	public int likeCount(Zzim z) {
		return newsDao.likeCount(sqlsession,z);
	}

	public int insertLike(Zzim z) {
		return newsDao.insertLike(sqlsession, z);
	}

	public int updateLike(Zzim z) {
		return newsDao.updateLike(sqlsession,z);
	}

	public int totalLikeCount(Zzim z) {
		return newsDao.totalLikeCount(sqlsession, z);
	}

	public int updateUnlike(Zzim z) {
		return newsDao.updateUnlike(sqlsession,z);
	}

	public int likeCount1(Zzim z) {
		return newsDao.likeCount1(sqlsession,z);
	}

	public int updateNews(News n) {
		return newsDao.upateNews(sqlsession, n);
	}

	public ArrayList<News> ajaxRepage(String state) {
		return newsDao.ajaxRepage(sqlsession, state);
	}

	public ArrayList<News> getNewsList() {
		return newsDao.getNewsList(sqlsession);
	}

	public News selectHotNews() {
		return newsDao.selectHotNews(sqlsession);
	}


}
