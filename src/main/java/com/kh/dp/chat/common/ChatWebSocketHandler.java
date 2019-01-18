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
		System.out.println(msg[0] + ":" + msg[1]);
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
		String oneKey = null;
		String realMsg = msg[1];
		try {
			// 선택된 채팅방이 프로젝트 단체방이라면
			if(msg[0].split(":")[0].charAt(0) == '0') {
				// 전체 프로젝트 세션에서
				for(String key : projectSessionList.keySet()) {
					// 해당 프로젝트를 찾아
					if(key.contains(pNo) && !key.contains("TO")) {
						projectSessionList.get(key).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe + "|" + p.getPno() + "|" + m.getRenamedFileName()));
						ChatPtm data = new ChatPtm();
						data.setChContent(realMsg);
						data.setChWriter(m.getMno());
						data.setChPno(p.getPno());
						data.setNickName(m.getNickName());
						// 'a to b' 와 'b to a' 형식으로 중복저장되기때문에 메시지가 2번 DB에 저장되는 것을 막기위한 핸들링
						if(check == 0) {
							sqlsession.insert("chat.insertPtm", data);
							Map<String, String> map = new HashMap<String, String>();
							map.put("nickName", m.getNickName());
							map.put("pno", String.valueOf(p.getPno()));
							sqlsession.update("chat.updatePtm", map);
							check++;
						}else{
							check = 0;
						}
					}
				}
			}else{ // 선택된 채팅방이 1:1 채팅방이라면
				// 1:1 접속자 목록 중에서
				for(String key : memberSessionList.keySet()) {
					oneKey = key;
					// key값이 'a to b' 이거나 'b to a'인것 찾아서
					if(key.equals(p.getPno()+"p" + mNo + "TO" + mNo2) || key.equals(p.getPno()+"p" + mNo2 + "TO" + mNo)) {
						// 위와 같은 방식으로 메시지를 뿌려줌
						oneKey = key;
						memberSessionList.get(key).sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe + "|" + p.getPno() + "|" + m.getRenamedFileName()));
						ChatMtm data = new ChatMtm();
						data.setChContent(realMsg);
						data.setChWriter(chatMe);
						data.setChReader(chatTarget);
						data.setChPno(p.getPno());
						data.setNickName(m.getNickName());
						// 위와 같은 이유의 핸들링
						if(check == 0) {
							sqlsession.insert("chat.insertMtm", data);
							Map<String, String> map = new HashMap<String, String>();
							map.put("nickName", m.getNickName());
							map.put("pno", String.valueOf(p.getPno()));
							map.put("chWriter", String.valueOf(chatMe));
							map.put("chReader", String.valueOf(chatTarget));
							sqlsession.update("chat.updateMtm", map);
							check++;
						}else{
							check = 0;
						}
					}
				}
			}
		} catch(Exception e) {
			handleTransportError(session, e);
			// 1:1일때 db에 데이터 전송하고, 나에게만 msg 보내기
			//memberSessionList.put(p.getPno()+"p" + mNo + "TO" + mNo2, session);
			if(check == 0) {
				session.sendMessage(new TextMessage(session.getId() + "|" + realMsg + "|" + session.getRemoteAddress() + "|" + m.getNickName()+ "|" + chatRoom[0] + "|" + chatMe));
				ChatMtm data = new ChatMtm();
				data.setChContent(realMsg);
				data.setChWriter(chatMe);
				data.setChReader(chatTarget);
				data.setChPno(p.getPno());
				data.setNickName(m.getNickName());
				sqlsession.insert("chat.insertMtm", data);
				Map<String, String> map = new HashMap<String, String>();
				map.put("nickName", m.getNickName());
				map.put("pno", String.valueOf(p.getPno()));
				map.put("chWriter", String.valueOf(chatMe));
				map.put("chReader", String.valueOf(chatTarget));
				sqlsession.update("chat.updateMtm", map);
				check++;
			}else {
				check = 0;
			}
			
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
/*		Member m = (Member)session.getAttributes().get("member");
		Project p = (Project)session.getAttributes().get("project");
		// 프로젝트 이름
		String pNo = "p" + p.getPno();
		// 회원 이름
		String mNo = "m" + m.getMno();
		// 연결이 끊기면 프로젝트와 1:1 접속자를 제거 
		projectSessionList.remove(pNo+mNo);*/
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		//super.handleTransportError(session, exception);
		
		//System.out.println("사용자 종료 상황 발생!");
	}
	
	
}