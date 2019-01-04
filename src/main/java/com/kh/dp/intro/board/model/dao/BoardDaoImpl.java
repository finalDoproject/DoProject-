package com.kh.dp.intro.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.intro.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectHelpList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board.selectHelpList", rowBounds);
	}

	@Override
	public int selectHelpTotalContents() {
		return sqlSession.selectOne("board.selectHelpTotalContents");
	}

	@Override
	public int insertHelp(Board board) {
		
		return sqlSession.insert("board.insertHelp", board);
	}

	@Override
	public Board selectOneHelp(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.selectOneHelp",bno);
	}

	@Override
	public int updateHelp(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateHelp", board);
	}

	@Override
	public int deleteHelp(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.deleteHelp", bno);
	}

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board.selectNoticeList", rowBounds);
	}

	@Override
	public int selectNoticeTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.selectNoticeTotalContents");
	}

	@Override
	public int insertNotice(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.insertNotice", board);
	}

	@Override
	public Board selectOneNotice(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.selectOneNotice", bno);
	}

	@Override
	public int updateNotice(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateNotice", board);
	}

	@Override
	public int deleteNotice(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.deleteNotice", bno);
	}

}
