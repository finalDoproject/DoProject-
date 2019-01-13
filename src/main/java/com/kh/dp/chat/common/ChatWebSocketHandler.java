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

	@Autowired
	SqlSessionTemplate sqlsession;
	
	// 프로젝트별 접속자 구분 리스트
	private Map<String, Map<String, WebSocketSession>> projectMap = new HashMap<String, Map<String, WebSocketSession>>();
	
	// 프로젝트 접속자 리스트
	private Map<String, WebSocketSession> projectSessionList = new HashMap<String, WebSocketSession>();
	// 1:1 접속자 리스트
	private Map<String, WebSocketSession> memberSessionList = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Member m = (Member)session.getAttributes().get("member");
		Project p = (Project)session.getAttributes().get("project");
		
		// 프로젝트 이름
		String pNo = "p" + p.getPno();
		// 송신자
		String mNo = "m" + m.getMno();
		
		projectSessionList.put(pNo + mNo, session);
		//memberSessionList.put(pNo + mNo, session);

		projectMap.put(pNo, memberSessionList);
		
		// 접속한 회원들 1:1 채팅을 위한 소켓 open
		for(Map.Entry<String, Map<String, WebSocketSession>> entry : projectMap.entrySet()) {
			if(entry.getKey().equals(pNo)) {
				for(Map.Entry<String, WebSocketSession> key1 : projectSessionList.entrySet()) {
					for(Map.Entry<String, WebSocketSession> key2 : projectSessionList.entrySet()) {
						if(key1.getKey().contains(pNo) && key2.getKey().contains(pNo) && key1.getKey() != key2.getKey()) {
							memberSessionList.put((p.getPno()+"p" + key1.getKey().substring(key1.getKey().lastIndexOf("m")) + "TO" + key2.getKey().substring(key2.getKey().lastIndexOf("m"))), key1.getValue());
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

		// 1:1 채팅 핸들링을 위한 컨트롤
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
		
		// 선택된 채팅방을 open
		memberSessionList.put(p.getPno()+"p" + mNo + "TO" + mNo2, session);
		
		String realMsg = msg[1];
		
		// 선택된 채팅방이 프로젝트 단체방이라면
		if(msg[0].split(":")[0].charAt(0) == '0') {
			// 전체 프로젝트 세션에서
			for(String key : projectSessionList.keySet()) {
				// 해당 프로젝트를 찾아
				if(key.contains(pNo) && !key.contains("TO")) {
					// 그 프로젝트에 속한 회원들에게 메시지를 뿌리기 위한 반복
					/*for(String realKey : projectMap.get(key).keySet()) {*/
						// key값에 TO가 포함되있으면 1:1 채팅이므로 ! 사용, 다시한번 key값에 현제 프로젝트인지를 확인하기 위한 contains
						/*if(!realKey.contains("TO") && realKey.contains("p" + p.getPno())) {*/
							// 메시지를 뿌려줄 때 세션 아이디, 메시지, 닉네임, 송/수신자를 같이 보내준다.  
							/*projectMap.get(key).get(realKey).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe));*/
							System.out.println(key.substring(key.lastIndexOf("m")));
							projectSessionList.get(key).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe + "|" + p.getPno()));
							ChatPtm data = new ChatPtm();
							data.setChContent(realMsg);
							data.setChWriter(m.getMno());
							data.setChPno(p.getPno());
							// 'a to b' 와 'b to a' 형식으로 중복저장되기때문에 메시지가 2번 DB에 저장되는 것을 막기위한 핸들링
							if(check == 0) {
								sqlsession.insert("chat.insertPtm", data);
								check++;
							}else{
								check = 0;
							}
						/*}*/
					/*}*/
				}
			}
		}else{ // 선택된 채팅방이 1:1 채팅방이라면
			// 1:1 접속자 목록 중에서
			for(String key : memberSessionList.keySet()) {
				// key값이 'a to b' 이거나 'b to a'인것 찾아서
				if(key.equals(p.getPno()+"p" + mNo + "TO" + mNo2) || key.equals(p.getPno()+"p" + mNo2 + "TO" + mNo)) {
					// 위와 같은 방식으로 메시지를 뿌려줌
					memberSessionList.get(key).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe));
					ChatMtm data = new ChatMtm();
					data.setChContent(realMsg);
					data.setChWriter(chatMe);
					data.setChReader(chatTarget);
					data.setChPno(p.getPno());
					// 위와 같은 이유의 핸들링
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
		/*Member m = (Member)session.getAttributes().get("member");
		Project p = (Project)session.getAttributes().get("project");
		// 프로젝트 이름
		String pNo = "p" + p.getPno();
		// 회원 이름
		String mNo = "m" + m.getMno();
		// 연결이 끊기면 프로젝트와 1:1 접속자를 제거 
		projectSessionList.remove(pNo + mNo);
		memberSessionList.remove(pNo + mNo);*/
	}
	
}