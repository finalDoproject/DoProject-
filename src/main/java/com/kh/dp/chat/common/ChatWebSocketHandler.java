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
	private Map<String, Map<String, WebSocketSession>> projectMap = new HashMap<String, Map<String, WebSocketSession>>();
	private Map<String, WebSocketSession> projectSessionList = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		/*System.out.println("채팅방 입장자 :"+session.getId());*/
		Member m = (Member)session.getAttributes().get("member");
		Project p = (Project)session.getAttributes().get("project");
		int you = (int) session.getAttributes().get("you");
		System.out.println("your mno : " + you);
		// 프로젝트 이름
		String pNo = "p" + p.getPno();
		// 회원 이름
		String mNo = "m" + m.getMno();
		projectSessionList.put(pNo + mNo, session);
		
		projectMap.put(pNo, projectSessionList);
		/*for(String key : projectMap.keySet()) {
			System.out.println(String.format("[접속 후 세션 리스트 : " + key + " : " + projectMap.get(key) + " ]"));
		}*/
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Member m = (Member)session.getAttributes().get("member");
		Project p = (Project)session.getAttributes().get("project");
		
		for(String key : projectMap.keySet()) {
			/*String msg = (key.contains("p" + p.getPno())) ? "true" : "false";
			System.out.println("key : " + key + ", pno : " + p.getPno() + " | " + msg);*/
			if(key.contains("p" + p.getPno())) {
				for(String realKey : projectMap.get(key).keySet()) {
					if(realKey.contains("p" + p.getPno())) {
						projectMap.get(key).get(realKey).sendMessage(new TextMessage(session.getId() + "|" + message.getPayload() + "|" + session.getRemoteAddress() + "|" + m.getNickName()));
						/*System.out.println("realKey : " + projectMap.get(key).get(realKey));
						System.out.println("session : " + session.getId());*/
					}
				}			
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		/*System.out.println("채팅방 퇴장자 :"+session.getId());*/
		Member m = (Member)session.getAttributes().get("member");
		Project p = (Project)session.getAttributes().get("project");
		// 프로젝트 이름
		String pNo = "p" + p.getPno();
		// 회원 이름
		String mNo = "m" + m.getMno();
		projectSessionList.remove(pNo + mNo);
		/*for(String key : projectMap.keySet()) {
			System.out.println(String.format("[종료 후 세션 리스트 : " + projectMap.get(key) + " ]"));
		}*/
	}
	
}