/*package com.kh.dp.alarm.common;

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
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		Member m = (Member) session.getAttributes().get("member");
		int mno = m.getMno();
		CharSequence result = sqlsession.selectOne("alarm.selectCountAlarm", mno);
		session.sendMessage(new TextMessage(result));

	}
 
}
*/