package com.team.nexus.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.nexus.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {

	public ArrayList<Calendar> selectCalendar(SqlSessionTemplate sqlSession,int userNo){
		
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalendar", userNo);
	}
	
	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar cal) {
		int result = sqlSession.insert("calendarMapper.insertCalendar", cal);
		
		return result;
	}
	
	public void dropSchedule(SqlSessionTemplate sqlSession, Calendar cal) {
		sqlSession.update("calendarMapper.dropSchedule",cal);
	}
	
	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar cal) {
		int result = sqlSession.update("calendarMapper.updateCalendar", cal);
		
		return result;
	}
	
	public int deleteCalendar(SqlSessionTemplate sqlSession, String _id) {
		int result = sqlSession.delete("calendarMapper.deleteCalendar", _id);
		
		return result;
	}
}
