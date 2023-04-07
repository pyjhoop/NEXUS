package com.team.nexus.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.nexus.calendar.model.dao.CalendarDao;
import com.team.nexus.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CalendarDao cDao;

	@Override
	public ArrayList<Calendar> selectCalendar(int userNo) {
		return cDao.selectCalendar(sqlSession, userNo);
	}

	@Override
	public void insertCalendar(Calendar cal) {
		cDao.insertCalendar(sqlSession, cal);
	}

	@Override
	public void dropSchedule(Calendar cal) {
		cDao.dropSchedule(sqlSession, cal);
	}

	@Override
	public int updateCalendar(Calendar cal) {
		int result = cDao.updateCalendar(sqlSession, cal);
		
		return result;
	}

	@Override
	public int deleteCalendar(String _id) {
		int result = cDao.deleteCalendar(sqlSession, _id);
		
		return result;
	}

	


}
