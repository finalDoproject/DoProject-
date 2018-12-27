package com.kh.dp.chat.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.chat.model.vo.ChatPtm;
import com.kh.dp.project.model.vo.Project;

public interface ChatDao {

	List<Map<String, String>> selectProjectChatList(int pno);
	
	List<Map<String, String>> selectChatRoomList(int pno);
	
	List<ChatPtm> selectOneChatList(int pno, int mno);
	
	int insertChat(int pno, int mno);
	
	int updateChat(int pno, int mno);
	
	List<ChatPtm> selectSearchChatRoom(String roomName);

	Project selectProject(int pno);
	
}
