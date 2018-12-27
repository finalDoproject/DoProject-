package com.kh.dp.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.chat.model.vo.ChatPtm;

public interface ChatService {

	List<Map<String, String>> selectProjectChatList(int pno);
	
	List<ChatPtm> selectChatRoomList(int pno);
	
	List<ChatPtm> selectOneChatList(int pno, int mno);
	
	int insertChat(int pno, int mno);
	
	int updateChat(int pno, int mno);
	
	List<ChatPtm> selectSearchChatRoom(String roomName);

}
