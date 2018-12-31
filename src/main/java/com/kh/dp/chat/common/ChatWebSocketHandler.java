package com.kh.dp.chat.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.dp.member.model.vo.Member;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		System.out.println("채팅방 입장자 :"+session.getId());
		for(WebSocketSession testList : sessionList) {
			System.out.println("[접속 후 세션 리스트 : " + testList + " ]");
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		Member m = (Member)session.getAttributes().get("member");
		for(WebSocketSession testList : sessionList) {
			System.out.println("[접속 중 세션 리스트 : " + testList + " ]");
		}
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getId() + "|" + message.getPayload() + "|" + session.getRemoteAddress() + "|" + m.getNickName()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("채팅방 퇴장자 :"+session.getId());
		sessionList.remove(session);
		for(WebSocketSession testList : sessionList) {
			System.out.println("[종료 후 세션 리스트 : " + testList + " ]");
		}
		/*session.close();*/
	}
	
}