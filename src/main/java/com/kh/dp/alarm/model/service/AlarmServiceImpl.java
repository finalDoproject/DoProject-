package com.kh.dp.alarm.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.alarm.model.dao.AlarmDao;
import com.kh.dp.alarm.model.vo.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	AlarmDao alarmDao;

	@Override
	public int updateAlarm(Alarm al) {
		return alarmDao.updateAlarm(al);
	}

	@Override
	public List<Alarm> selectSearchAlarm(int mno) {
		return alarmDao.selectSearchAlarm(mno);
	}
	

}
