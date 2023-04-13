package com.team.nexus.news.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.news.model.vo.News;
import com.team.nexus.news.model.vo.NewsReply;
import com.team.nexus.news.model.vo.Zzim;

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

	public ArrayList<NewsReply> selectrList(SqlSessionTemplate sqlsession, int nNo) {
		return (ArrayList)sqlsession.selectList("newsMapper.selectrList",nNo);
	}

	public int newsReplyInsert(SqlSessionTemplate sqlsession, NewsReply nr) {
		return sqlsession.insert("newsMapper.newsReplyInsert", nr);
	}

	public int insertNews(SqlSessionTemplate sqlsession, News n) {
		return sqlsession.insert("newsMapper.insertNews", n);
	}

	public News selectNews(SqlSessionTemplate sqlsession, int nNo) {
		return sqlsession.selectOne("newsMapper.seletNews",nNo);
	}

	public int deleteNews(SqlSessionTemplate sqlsession, int newsNo) {
		return sqlsession.update("newsMapper.deleteNews", newsNo);
	}

	public int countrList(SqlSessionTemplate sqlsession, int nNo) {
		return sqlsession.selectOne("newsMapper.countrList", nNo);
	}

	public int likeCount(SqlSessionTemplate sqlsession, Zzim z) {
		return sqlsession.selectOne("newsMapper.likeCount", z);
	}

	public int insertLike(SqlSessionTemplate sqlsession, Zzim z) {
		return sqlsession.insert("newsMapper.insertLike", z);
	}

	public int updateLike(SqlSessionTemplate sqlsession, Zzim z) {
		return sqlsession.update("newsMapper.updateLike", z);
	}

	public int totalLikeCount(SqlSessionTemplate sqlsession, Zzim z) {
		return sqlsession.selectOne("newsMapper.totaLikeCount", z);
	}

	public int updateUnlike(SqlSessionTemplate sqlsession, Zzim z) {
		return sqlsession.update("newsMapper.updateUnlike", z);
	}

	
}
