package com.team.nexus.news.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.news.model.vo.News;
import com.team.nexus.news.model.vo.NewsReply;

@Repository
public class NewsDao {

	public ArrayList<News> selectList(SqlSessionTemplate sqlsession) {
		return (ArrayList)sqlsession.selectList("newsMapper.selectList");
	}

	public ArrayList<News> selectList(SqlSessionTemplate sqlsession, int page) {
		int offset = (page-1)*5;
		int limit = 5;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlsession.selectList("newsMapper.ajaxSelectList", null, rowBounds);
	}

	public ArrayList<NewsReply> selectrList(SqlSessionTemplate sqlsession, int newsNo) {
		return (ArrayList)sqlsession.selectList("newsMapper.selectrList",newsNo);
	}

	public int newsReplyInsert(SqlSessionTemplate sqlsession, NewsReply nr) {
		return sqlsession.insert("newsMapper.newsReplyInsert", nr);
	}

}
