package com.kh.dp.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Project;

public interface ChatService {

	List<Map<String, String>> selectProjectChatList(int pno);
	
	List<Map<String, String>> selectChatRoomList(int pno);
	
	List<Map<String, String>> selectOneChatList(int pno, int chWriter, int chReader);
	
	List<Map<String, String>> selectSearchChatRoom(String roomName);
	
	int insertChat(int pno, int mno);
	
	int updateChat(int pno, int mno);
	
	Project selectProject(int pno);

}
