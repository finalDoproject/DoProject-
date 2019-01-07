package com.kh.dp.chat.common;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.project.model.vo.Project;

@Repository
public class ChatWebSocketHandler extends TextWebSocketHandler {
	// 프로젝트별 전체 채팅은 구현
	// 해당 방별로의 구분이 필요
	@Autowired
	SqlSessionTemplate sqlsession;
	
	//private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// 프로젝트별 접속자
	private Map<String, Map<String, WebSocketSession>> projectMap = new HashMap<String, Map<String, WebSocketSession>>();
	
	// 접속자 전체
	private Map<String, WebSocketSession> projectSessionList = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		/*System.out.println("채팅방 입장자 :"+session.getId());*/
		Member m = (Member)session.getAttributes().get("member");
		Project p = (Project)session.getAttributes().get("project");
		
		// 프로젝트 이름
		String pNo = "p" + p.getPno();
		// 송신자
		String mNo = "m" + m.getMno();
		// 수신자
		String mNo2 = "m";
		
		projectSessionList.put(pNo + mNo, session);

		projectMap.put(pNo, projectSessionList);
		for(String key : projectMap.keySet()) {
			System.out.println(String.format("[접속 후 세션 리스트 : " + key + " : " + projectMap.get(key) + " ]"));
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Member m = (Member)session.getAttributes().get("member");
		Project p = (Project)session.getAttributes().get("project");
		
		String[] msg = message.getPayload().split("_");
		String[] chatRoom = msg[0].split(":");
		
		int chatTarget = Integer.parseInt(chatRoom[0]);
		int chatMe = Integer.parseInt(chatRoom[1]);
	
		String realMsg = msg[1];
		
		System.out.println("payLoad : " + message.getPayload());
		System.out.println("chatTarget : " + chatTarget);
		System.out.println("realMsg : " + realMsg);

		// 프로젝트 접속자 전체
		for(String key : projectMap.keySet()) {
			// 해당 프로젝트만
			if(key.contains("p" + p.getPno())) {
				// 해당 프로젝트에 접속한 접속자 전체
				for(String realKey : projectMap.get(key).keySet()) {
					// 해당 프로젝트 번호가 포함된 회원들에게만
					if(realKey.contains("p" + p.getPno())) {
						// 해당 회원 번호가 포함된 회원에게만
						if(realKey.contains("m" + m.getMno())) {
							projectMap.get(key).get(realKey).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()));
						}
					}
				}			
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Member m = (Member)session.getAttributes().get("member");
		Project p = (Project)session.getAttributes().get("project");
		// 프로젝트 이름
		String pNo = "p" + p.getPno();
		// 회원 이름
		String mNo = "m" + m.getMno();
		projectSessionList.remove(pNo + mNo);
		for(String key : projectMap.keySet()) {
			System.out.println(String.format("[종료 후 세션 리스트 : " + projectMap.get(key) + " ]"));
		}
	}
	
}