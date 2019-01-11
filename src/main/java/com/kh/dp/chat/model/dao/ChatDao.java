package com.kh.dp.chat.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Project;

public interface ChatDao {

	List<Map<String, String>> selectProjectChatList(int pno);
	
	List<Map<String, String>> selectChatRoomList(int pno);
	
	List<Map<String, String>> selectOneChatList(int pno, int chWriter, int chReader);
	
	Project selectProject(int pno);

	String selectOneFileName(int chReader);
	
}
