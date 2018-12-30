package com.kh.dp.chat.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.dp.member.model.vo.Member;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	//private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// 단체 채팅은 Map<Integer, List<WebSocketSession> 으로 프로젝트 번호와 세션리스트를 받아서 해보기
	// 1:1은 채팅방마다 Integer(방번호) 구분
	private Map<String, WebSocketSession> sessionList = new ConcurrentHashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.put(session.getId(), session);
		//sessionList.add(session);
		System.out.println("채팅방 입장자 :"+session);
		/*for(WebSocketSession testList : sessionList) {
			System.out.println("[접속 후 세션 리스트 : " + testList + " ]");
		}*/
		for(WebSocketSession testList : sessionList.values()) {
			System.out.println("[접속 후 세션 리스트 : " + testList + " ]");
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		/*System.out.println("session주소 : "+session.getRemoteAddress());
		System.out.println(session.getAttributes().get("member"));*/
		Member m = (Member)session.getAttributes().get("member");
		/*for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getId() + "|" + message.getPayload() + "|" + session.getRemoteAddress() + "|" + m.getNickName()));
		}*/
		for(WebSocketSession sess : sessionList.values()) {
			sess.sendMessage(new TextMessage(session.getId() + "|" + message.getPayload() + "|" + session.getRemoteAddress() + "|" + m.getNickName()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session.getId());
		System.out.println("채팅방 퇴장자 :"+session.getId());
		/*sessionList.remove(session);
		for(WebSocketSession testList : sessionList) {
			System.out.println("[종료 후 세션 리스트 : " + testList + " ]");
		}*/
		for(WebSocketSession testList : sessionList.values()) {
			System.out.println("[종료 후 세션 리스트 : " + testList + " ]");
		}
		//session.close();
	}
	
}