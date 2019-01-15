package com.kh.dp.alarm.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.alarm.model.vo.Alarm;

@Repository
public class AlarmDaoImpl implements AlarmDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int updateAlarm(Alarm al) {
		return sqlSession.update("alarm.deleteAlarmList", al);
	}

	@Override
	public List<Alarm> selectSearchAlarm(int mno) {
		return sqlSession.selectList("alarm.selectAlarmList", mno);
	}

	@Override
	public int selectApno(Alarm al) {
		return sqlSession.selectOne("alarm.selectApno", al);
	}

	/*@Override
	public String countAlarm(String payload) {
		System.out.println(payload);
		return sqlSession.selectOne("alarm.selectCountAlarm", payload);
	}*/

}

