package com.kh.dp.alarm.common;

import java.io.IOException;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.dp.member.model.vo.Member;

@Repository
public class AlarmWebSocketHandler extends TextWebSocketHandler{

	@Autowired
	SqlSessionTemplate sqlsession;
	String nickName;
	int pNo;
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		/*AlarmDao alarmDao = sqlsession.getMapper(AlarmDao.class);
		session.sendMessage(new TextMessage(alarmDao.countAlarm(message.getPayload())));*/
		nickName = message.getPayload().split(":")[0];
		pNo = Integer.parseInt(message.getPayload().split(":")[1]);
		System.out.println("pNo : " + pNo);

		// 1초간격 실행
		int runtime = 1;
		
		ScheduledThreadPoolExecutor exec = new ScheduledThreadPoolExecutor(1);
		
		// Runnable의 run함수를 runtime간격으로 실행한다. 0은 n초후에 실행하겠다
		// TimeUnit은 시간을 ms이 아닌 s으로 변경
		exec.scheduleAtFixedRate(new Runnable() {
			@Override
			public void run() {
				try {
					String result1 = sqlsession.selectOne("alarm.selectCountAlarm", nickName);
					String result2 = sqlsession.selectOne("alarm.selectCountChatAlarm", pNo);
					String result = result1 + ":" + result2;
					session.sendMessage(new TextMessage(result));
				} catch (IOException e) {
					e.printStackTrace();
				}				
			}
		}, 0, runtime, TimeUnit.SECONDS);
		
	}
 
}

