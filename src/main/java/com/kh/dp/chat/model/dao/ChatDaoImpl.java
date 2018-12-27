package com.kh.dp.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.chat.model.vo.ChatPtm;

@Repository
public class ChatDaoImpl implements ChatDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectProjectChatList(int pno) {
		return sqlSession.selectList("chat.selectProjectChatList", pno);
	}

	@Override
	public List<ChatPtm> selectChatRoomList(int pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatPtm> selectOneChatList(int pno, int mno) {
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
	public List<ChatPtm> selectSearchChatRoom(String roomName) {
		// TODO Auto-generated method stub
		return null;
	}

}
