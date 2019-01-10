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
	// 1:1
	private Map<String, WebSocketSession> memberSessionList = new HashMap<String, WebSocketSession>();
	
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
		memberSessionList.put(pNo + mNo, session);

		projectMap.put(pNo, memberSessionList);
		/*for(String key : projectMap.keySet()) {
			System.out.println(String.format("[접속 후 세션 리스트 : " + key + " : " + projectMap.get(key) + " ]"));
		}*/
		
		for(Map.Entry<String, Map<String, WebSocketSession>> entry : projectMap.entrySet()) {
			System.out.println("key : " + entry.getKey() + "   value : " + entry.getValue());
			if(entry.getKey().equals(pNo)) {
				for(Map.Entry<String, WebSocketSession> key1 : projectSessionList.entrySet()) {
					for(Map.Entry<String, WebSocketSession> key2 : projectSessionList.entrySet()) {
						if(key1.getKey().contains(pNo) && key2.getKey().contains(pNo) && key1.getKey() != key2.getKey()) {
							/*System.out.println("key1: " + key1.getKey() + " value1: " + key1.getValue());
							System.out.println("key2: " + key2.getKey() + " value2: " + key2.getValue());
							System.out.println("-----------------------------------------------------------");
							//projectSessionList.put((pNo + key1.getKey().substring(key1.getKey().lastIndexOf("m")) + "TO" + key2.getKey().substring(key2.getKey().lastIndexOf("m"))), key1.getValue());
							System.out.println((pNo + key1.getKey().substring(key1.getKey().lastIndexOf("m")) + "TO" + key2.getKey().substring(key2.getKey().lastIndexOf("m"))) + " : " + session);
							System.out.println("session : " + session);*/
							memberSessionList.put((pNo + key1.getKey().substring(key1.getKey().lastIndexOf("m")) + "TO" + key2.getKey().substring(key2.getKey().lastIndexOf("m"))), key1.getValue());
						}
					}
				}
			}
		}
		
		/*for(String key : memberSessionList.keySet()) {
			System.out.println(String.format("[memberSessionList : " + key + " : " + memberSessionList.get(key) + " ]"));
		}*/
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Member m = (Member)session.getAttributes().get("member");
		Project p = (Project)session.getAttributes().get("project");

		String[] msg = message.getPayload().split("_");
		String[] chatRoom = msg[0].split(":");
		
		int chatTarget = Integer.parseInt(chatRoom[0]);
		int chatMe = Integer.parseInt(chatRoom[1]);
		int check = 0;
		
		// 프로젝트 이름
		String pNo = "p" + p.getPno();
		// 송신자
		String mNo = "m" + chatMe;
		// 수신자 or 프로젝트 번호
		String mNo2 = "m" + chatTarget;
		
		memberSessionList.put(pNo + mNo + "TO" + mNo2, session);
		//projectSessionList.put(pNo + mNo + "TO" + mNo2, session);
		/*for(String key : projectSessionList.keySet()) {
			if(!key.equals(pNo + mNo + "TO" + mNo2) && !key.equals(pNo + mNo2 + "TO" + mNo)){
				memberSessionList.put(pNo + mNo + "TO" + mNo2, session);
				memberSessionList.put(pNo + mNo2 + "TO" + mNo, session);
				System.out.println("key : " + key);
			}
		}*/
		
		String realMsg = msg[1];
		
		if(msg[0].split(":")[0].charAt(0) == '0') {
			for(String key : projectMap.keySet()) {
				if(key.equals("p" + p.getPno())) {
					for(String realKey : projectMap.get(key).keySet()) {
						if(!realKey.contains("TO") && realKey.contains("p" + p.getPno())) {
							projectMap.get(key).get(realKey).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe));
							ChatPtm data = new ChatPtm();
							data.setChContent(realMsg);
							data.setChWriter(m.getMno());
							data.setChPno(p.getPno());
							if(check == 0) {
								sqlsession.insert("chat.insertPtm", data);
								check++;
							}else{
								check = 0;
							}
						}
					}
				}
			}
		}else{
			/*// 프로젝트 접속자 전체
			for(String key : projectMap.keySet()) {
				// 해당 프로젝트만
				if(key.contains("p" + p.getPno())) {
					// 해당 프로젝트에 접속한 접속자 전체
					for(String realKey : projectMap.get(key).keySet()) {
						// 해당 회원 번호가 포함된 회원에게만
						if(realKey.equals(pNo + mNo + "TO" + mNo2) || realKey.equals(pNo + mNo2 + "TO" + mNo)) {
							projectMap.get(key).get(realKey).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe));
							ChatMtm data = new ChatMtm();
							data.setChContent(realMsg);
							data.setChWriter(chatMe);
							data.setChReader(chatTarget);
							data.setChPno(p.getPno());
							if(check == 0) {
								sqlsession.insert("chat.insertMtm", data);
								check++;
							}else{
								check = 0;
							}
						}
					}
				}
			}*/
			for(String key : memberSessionList.keySet()) {
				//System.out.println(key);
				if(key.equals(pNo + mNo + "TO" + mNo2) || key.equals(pNo + mNo2 + "TO" + mNo)) {
					memberSessionList.get(key).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe));
					ChatMtm data = new ChatMtm();
					data.setChContent(realMsg);
					data.setChWriter(chatMe);
					data.setChReader(chatTarget);
					data.setChPno(p.getPno());
					if(check == 0) {
						sqlsession.insert("chat.insertMtm", data);
						check++;
					}else{
						check = 0;
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
		/*for(String key : projectMap.keySet()) {
			System.out.println(String.format("[종료 후 세션 리스트 : " + projectMap.get(key) + " ]"));
		}*/
	}
	
}