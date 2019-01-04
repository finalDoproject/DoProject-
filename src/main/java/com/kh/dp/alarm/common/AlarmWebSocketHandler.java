package com.kh.dp.alarm.common;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Repository
public class AlarmWebSocketHandler extends TextWebSocketHandler{

	@Autowired
	SqlSessionTemplate sqlsession;
	
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
		
		String result = sqlsession.selectOne("alarm.selectCountAlarm", message.getPayload());
		session.sendMessage(new TextMessage(result));

	}
 
}