package com.kh.dp.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	@RequestMapping(value="/chat.ch", method=RequestMethod.GET)
	public String selectProjectChatList() {	
		// 해당 프로젝트 번호 가져와 그 프로젝트 내의 채팅 내역 불러오기
		// 처음 실행 화면
		return "chat/chat";
	}
	
	public String selectChatRoomList() {
		// 채팅 좌측부분 채팅방 리스트 출력용
		return "";
	}
	
	public String selectOneChatList() {
		// 좌측 출력된 채팅방 클릭시 해당 채팅방의 내역 불러오기
		return "";
	}
	
	public String insertChat() {
		// 채팅 기록 저장용
		return "";
	}
	
	public String selectSearchChatRoom() {
		// ajax 채팅방 리스트 검색용
		return "";
	}
	
}
