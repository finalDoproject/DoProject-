package com.kh.dp.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.chat.model.dao.ChatDao;
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
		return chatDao.selectOneChatList(pno, chWriter, chReader);
	}

	@Override
	public String selectOneFileName(int chReader) {
		return chatDao.selectOneFileName(chReader);
	}

	@Override
	public String selectOneYourName(int chReader) {
		return chatDao.selectOneYourName(chReader);
	}

}
