package com.kh.dp.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.chat.model.dao.ChatDao;
import com.kh.dp.chat.model.vo.ChatPtm;
import com.kh.dp.project.model.vo.Project;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao chatDao;
	
	@Override
	public List<Map<String, String>> selectProjectChatList(int pno) {
		return chatDao.selectProjectChatList(pno);
	}

	@Override
	public List<Map<String, String>> selectChatRoomList(int pno) {
		return chatDao.selectChatRoomList(pno);
	}
	
	@Override
	public Project selectProject(int pno) {
		return chatDao.selectProject(pno);
	}

	@Override
	public List<Map<String, String>> selectOneChatList(int pno, int chWriter, int chReader) {
		// TODO Auto-generated method stub
		return chatDao.selectOneChatList(pno, chWriter, chReader);
	}

	@Override
	public int insertChat(int pno, int mno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateChat(int pno, int mno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ChatPtm> selectSearchChatRoom(String roomName) {
		// TODO Auto-generated method stub
		return null;
	}

}
