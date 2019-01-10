package com.kh.dp.alarm.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.alarm.model.vo.Alarm;

public interface AlarmService {

	int updateAlarm(Alarm al);

	List<Alarm> selectSearchAlarm(int mno);
	
}

