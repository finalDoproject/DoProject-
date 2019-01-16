package com.kh.dp.chat.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.project.model.vo.Project;

@Repository
public class ChatDaoImpl implements ChatDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectProjectChatList(int pno) {
		/*sqlSession.update("chat.updateProjectChatList", pno);*/
		return sqlSession.selectList("chat.selectProjectChatList", pno);
	}

	@Override
	public List<Map<String, String>> selectChatRoomList(int pno) {
		return sqlSession.selectList("chat.selectChatRoomList", pno);
	}
	
	@Override
	public Project selectProject(int pno) {
		return sqlSession.selectOne("chat.selectProject", pno);
	}

	@Override
	public List<Map<String, String>> selectOneChatList(int pno, int chWriter, int chReader) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("chWriter", chWriter);
		map.put("chReader", chReader);
		/*sqlSession.update("chat.updateOneChatList", map);*/
		return sqlSession.selectList("chat.selectOneChatList", map);
	}

	@Override
	public String selectOneFileName(int chReader) {
		return sqlSession.selectOne("chat.selectOneFileName", chReader);
	}

	@Override
	public String selectOneYourName(int chReader) {
		return sqlSession.selectOne("chat.selectOneYourName", chReader);
	}

	@Override
	public String selectPtmLastChat(int me, int pno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mno", me);
		map.put("pno", pno);
		return sqlSession.selectOne("chat.selectPtmLastChat", map);
	}

	@Override
	public String selectMtmLastChat(int me, int you, int pno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("me", me);
		map.put("you", you);
		map.put("pno", pno);
		return sqlSession.selectOne("chat.selectMtmLastChat", map);
	}

	@Override
	public String selectOneChatPtm(String nickName, int pno) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickName", nickName);
		map.put("pno", String.valueOf(pno));
		return sqlSession.selectOne("chat.selectOneChatPtm", map);
	}

	@Override
	public void updatePtm(String nickName, int pno) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickName", nickName);
		map.put("pno", String.valueOf(pno));
		sqlSession.update("chat.updatePtm", map);
	}

	@Override
	public void updateMtm(String nickName, int pno, int chWriter, int chReader) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickName", nickName);
		map.put("pno", String.valueOf(pno));
		map.put("chWriter", String.valueOf(chWriter));
		map.put("chReader", String.valueOf(chReader));
		sqlSession.update("chat.updateMtm", map);
	}

	@Override
	public String selectOneChatMtm(String nickName, int pno, int chWriter, int chReader) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickName", nickName);
		map.put("pno", String.valueOf(pno));
		map.put("chWriter", String.valueOf(chWriter));
		map.put("chReader", String.valueOf(chReader));
		return sqlSession.selectOne("chat.selectOneChatMtm", map);
	}

}
