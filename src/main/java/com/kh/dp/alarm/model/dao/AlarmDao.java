package com.kh.dp.alarm.model.dao;

import java.util.List;

import com.kh.dp.alarm.model.vo.Alarm;

public interface AlarmDao {

	int updateAlarm(Alarm al);

	List<Alarm> selectSearchAlarm(int mno);

	/*String countAlarm(String payload);*/
	
}

