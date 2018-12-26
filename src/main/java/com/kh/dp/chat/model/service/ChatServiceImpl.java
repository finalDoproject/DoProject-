package com.kh.dp.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.chat.model.dao.ChatDao;
import com.kh.dp.chat.model.vo.Chat;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao chatDao;
	
	@Override
	public List<Chat> selectProjectChatList(int pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Chat> selectChatRoomList(int pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Chat> selectOneChatList(int pno, int mno) {
		// TODO Auto-generated method stub
		return null;
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
	public List<Chat> selectSearchChatRoom(String roomName) {
		// TODO Auto-generated method stub
		return null;
	}

}
