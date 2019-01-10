package com.kh.dp.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dp.alarm.model.service.AlarmService;
import com.kh.dp.alarm.model.vo.Alarm;

@Controller
public class AlarmController {

	@Autowired
	private AlarmService alarmService;

	@RequestMapping(value="/alarm/delete.al", method=RequestMethod.GET)
	public @ResponseBody int deleteAlarmList(Alarm al) {
				
		int result = alarmService.updateAlarm(al);
				
		return result;
		
	}
	
	@RequestMapping(value="/alarm/alarmList.al", method=RequestMethod.GET)
	public @ResponseBody List<Alarm> selectSearchMember(@RequestParam(required=true) int mno, HttpServletResponse response) throws Exception {
		
		List<Alarm> a = alarmService.selectSearchAlarm(mno);
		
		return a;
		
	}
	
}

