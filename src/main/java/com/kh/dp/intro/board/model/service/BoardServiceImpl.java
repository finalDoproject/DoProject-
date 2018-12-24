package com.kh.dp.intro.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.board.model.exception.BoardException;
import com.kh.dp.intro.board.model.dao.BoardDao;
import com.kh.dp.intro.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao boardDao;

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		return boardDao.selectBoardList(cPage,numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		return boardDao.selectBoardTotalContents();
	}

	@Override
	public int insertBoard(Board board) {
		int result;
		
		result = boardDao.insertBoard(board);
		
		if(result==0) throw new BoardException();
		
		return result;
	}

	@Override
	public Board selectOneBoard(int boardNo) {

		return boardDao.selectOneBoard(boardNo);
	}

	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

}
