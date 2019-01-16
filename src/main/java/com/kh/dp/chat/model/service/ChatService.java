package com.kh.dp.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Project;

public interface ChatService {

	List<Map<String, String>> selectProjectChatList(int pno);
	
	List<Map<String, String>> selectChatRoomList(int pno);
	
	List<Map<String, String>> selectOneChatList(int pno, int chWriter, int chReader);
	
	Project selectProject(int pno);

	String selectOneFileName(int chReader);

	String selectOneYourName(int chReader);

	String selectPtmLastChat(int me, int pno);

	String selectMtmLastChat(int me, int you, int pno);

	String selectOneChatPtm(String nickName, int pno);

	void updatePtm(String nickName, int pno);

	void updateMtm(String nickName, int pno, int chWriter, int chReader);

	String selectOneChatMtm(String nickName, int pno, int chWriter, int chReader);

}
