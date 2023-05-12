package com.team.nexus.pr.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.news.model.vo.News;
import com.team.nexus.pr.model.vo.PageInfo;
import com.team.nexus.pr.model.vo.PersonalPr;

@Repository
public class PersonalDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("personalprMapper.selectListCount");
	}
	
	public ArrayList<PersonalPr> selectPersonalPr(SqlSessionTemplate sqlSession, PageInfo pi){
		
		// 몇개의 게시글을 건너 뛸 건지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		// 총 몇개를 조회해갈껀지
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds   = new RowBounds(offset, limit);
		
		// 쿼리에 부족함이 없으니 parameter 자리에 null 써줌
		return (ArrayList)sqlSession.selectList("personalprMapper.selectPersonalPr", null, rowBounds);
				
	}
	
	public int insertPersonalPr(SqlSessionTemplate sqlsession, PersonalPr pr) {
		return sqlsession.insert("personalprMapper.insertPersonalPr", pr);
	}
	
	
	public int increaseCount(SqlSessionTemplate sqlSession, int personalPrNo) {
		return sqlSession.update("personalprMapper.increaseCount", personalPrNo);
	}
	
	public PersonalPr personalPrDetail(SqlSessionTemplate sqlSession, int personalPrNo) {
		return sqlSession.selectOne("personalprMapper.personalPrDetail", personalPrNo);
	}
	
	public ArrayList<PersonalPr> selectPrAjax(SqlSessionTemplate sqlSession, String[] strArr){
		return (ArrayList)sqlSession.selectList("personalprMapper.selectPrAjax", strArr);
	}
	
	
	

}