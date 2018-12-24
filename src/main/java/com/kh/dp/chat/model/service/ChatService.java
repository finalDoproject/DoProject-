package com.kh.dp.chat.model.service;

import java.util.List;

import com.kh.dp.chat.model.vo.Chat;

public interface ChatService {

	List<Chat> selectProjectChatList(int pno);
	
	List<Chat> selectChatRoomList(int pno);
	
	List<Chat> selectOneChatList(int pno, int mno);
	
	int insertChat(int pno, int mno);
	
	int updateChat(int pno, int mno);
	
	List<Chat> selectSearchChatRoom(String roomName);

}
