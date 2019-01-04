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
	public List<Alarm> selectSearchAlarm(int mno, int loginmno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mno", mno);
		map.put("loginmno", loginmno);
		return sqlSession.selectList("alarm.selectAlarmList", map);
	}

}
