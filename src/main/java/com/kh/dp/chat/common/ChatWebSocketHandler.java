package com.kh.dp.chat.common;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.dp.chat.model.vo.ChatMtm;
import com.kh.dp.chat.model.vo.ChatPtm;
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
		//String mNo2 = "m";
		
		projectSessionList.put(pNo + mNo, session);

		projectMap.put(pNo, projectSessionList);
		for(String key : projectMap.keySet()) {
			System.out.println(String.format("[접속 후 세션 리스트 : " + key + " : " + projectMap.get(key) + " ]"));
		}
		
		Iterator<String> iter1 = projectMap.keySet().iterator();
		Iterator<String> iter2 = projectSessionList.keySet().iterator();
		Iterator<String> iter3 = projectSessionList.keySet().iterator();
		while (iter1.hasNext()) {
			String key1 = iter1.next();
			if(key1.equals(pNo)) {
				while(iter2.hasNext()) {
					String key2 = iter2.next();
					while(iter3.hasNext()) {
						String key3 = iter3.next();
						// key2 접속자       key3 그외 접속자
						if(key2.contains(pNo)/* && key2 != key3*/) {
							//System.out.println("key1: " + key1 + " value1: " + projectSessionList.get(key1));
							System.out.println("key2: " + key2 + " value2: " + projectSessionList.get(key2));
							System.out.println("key3: " + key3 + " value2: " + projectSessionList.get(key3));
							System.out.println("-----------------------------------------------------------");
							/*projectSessionList.put(pNo + mNo + "TO" + key3.substring(key3.lastIndexOf("m") + 1), session);*/
						}
					}
				}
			}
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

		// 프로젝트 이름
		String pNo = "p" + p.getPno();
		// 송신자
		String mNo = "m" + chatMe;
		// 수신자 or 프로젝트 번호
		String mNo2 = "m" + chatTarget;
		
		//projectSessionList.put(pNo + mNo + "TO" + mNo2, session);
		
		String realMsg = msg[1];

		if(msg[0].split(":")[0].charAt(0) == '0') {
			for(String key : projectMap.keySet()) {
				if(key.contains("p" + p.getPno())) {
					for(String realKey : projectMap.get(key).keySet()) {
						if(!realKey.contains("TO")) {
							projectMap.get(key).get(realKey).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe));
							ChatPtm data = new ChatPtm();
							data.setChContent(realMsg);
							data.setChWriter(m.getMno());
							data.setChPno(p.getPno());
							sqlsession.insert("chat.insertPtm", data);
						}
						continue;
					}
				}
				break;
			}
		}else{
			// 프로젝트 접속자 전체
			for(String key : projectMap.keySet()) {
				// 해당 프로젝트만
				if(key.contains("p" + p.getPno())) {
					// 해당 프로젝트에 접속한 접속자 전체
					for(String realKey : projectMap.get(key).keySet()) {
						// 해당 회원 번호가 포함된 회원에게만
						if(realKey.contains("p" + p.getPno()) && (realKey.contains(pNo + mNo + "TO" + mNo2) || realKey.contains(pNo + mNo2 + "TO" + mNo))) {
							projectMap.get(key).get(realKey).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe));
							ChatMtm data = new ChatMtm();
							data.setChContent(realMsg);
							data.setChWriter(chatMe);
							data.setChReader(chatTarget);
							data.setChPno(p.getPno());
							sqlsession.insert("chat.insertMtm", data);
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