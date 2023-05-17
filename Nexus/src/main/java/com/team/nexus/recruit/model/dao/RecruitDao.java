package com.team.nexus.recruit.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.pr.model.vo.PageInfo;
import com.team.nexus.pr.model.vo.PersonalPr;
import com.team.nexus.recruit.model.vo.Recruit;

@Repository
public class RecruitDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("recruitMapper.selectListCount");
	}
	
	public ArrayList<Recruit> selectRecruit(SqlSessionTemplate sqlSession, PageInfo pi){
		
		// 몇개의 게시글을 건너 뛸 건지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		// 총 몇개를 조회해갈껀지
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds   = new RowBounds(offset, limit);
		
		// 쿼리에 부족함이 없으니 parameter 자리에 null 써줌
		return (ArrayList)sqlSession.selectList("recruitMapper.selectRecruit", null, rowBounds);
				
	}
	
	public int insertRecruit(SqlSessionTemplate sqlsession, Recruit re) {
		return sqlsession.insert("recruitMapper.insertRecruit", re);
	}
	
	
	public int increaseCount(SqlSessionTemplate sqlSession, int pjtPrNo) {
		return sqlSession.update("recruitMapper.increaseCount", pjtPrNo);
	}
	
	public Recruit recruitDetail(SqlSessionTemplate sqlSession, int personalPrNo) {
		return sqlSession.selectOne("recruitMapper.recruitDetail", personalPrNo);
	}
	
	public ArrayList<Recruit> selectRecruitAjax(SqlSessionTemplate sqlSession, String[] strArr){
		return (ArrayList)sqlSession.selectList("recruitMapper.selectRecruitAjax", strArr);
	}





}
