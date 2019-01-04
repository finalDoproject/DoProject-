package com.kh.dp.intro.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.intro.board.model.dao.BoardDao;
import com.kh.dp.intro.board.model.exception.BoardException;
import com.kh.dp.intro.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao boardDao;

	@Override
	public List<Map<String, String>> selectHelpList(int cPage, int numPerPage) {
		return boardDao.selectHelpList(cPage,numPerPage);
	}

	@Override
	public int selectHelpTotalContents() {
		return boardDao.selectHelpTotalContents();
	}

	@Override
	public int insertHelp(Board board) {
		int result;
		
		result = boardDao.insertHelp(board);
		
		if(result==0) throw new BoardException();
		
		return result;
	}

	@Override
	public Board selectOneHelp(int boardNo) {

		return boardDao.selectOneHelp(boardNo);
	}

	@Override
	public int updateHelp(Board board) {
		// TODO Auto-generated method stub
		int result = boardDao.updateHelp(board);
		
		if(result == 0) throw new BoardException();
		
		return result;
	}

	@Override
	public int deleteHelp(int bno) {
		// TODO Auto-generated method stub
		
		int result = boardDao.deleteHelp(bno);
		
		if(result == 0) throw new BoardException();
		
		return result;
	}

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return boardDao.selectNoticeList(cPage,numPerPage);
	}

	@Override
	public int selectNoticeTotalContents() {
		// TODO Auto-generated method stub
		return boardDao.selectNoticeTotalContents();
	}

	@Override
	public int insertNotice(Board board) {
		int result;
		
		result = boardDao.insertHelp(board);
		
		if(result==0) throw new BoardException();
		
		return result;
	}

	@Override
	public Board selectOneNotice(int boardNo) {
		// TODO Auto-generated method stub
		return boardDao.selectOneNotice(boardNo);
	}

	@Override
	public int updateNotice(Board board) {
		// TODO Auto-generated method stub
		int result = boardDao.updateNotice(board);
		
		if(result == 0) throw new BoardException();
		
		return result;
	}

	@Override
	public int deleteNotice(int bno) {
		// TODO Auto-generated method stub
		int result = boardDao.deleteNotice(bno);
		
		if(result == 0) throw new BoardException();
		
		return result;
	}

}
