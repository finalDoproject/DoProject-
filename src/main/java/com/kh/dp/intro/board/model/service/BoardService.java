package com.kh.dp.intro.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.intro.board.model.vo.Board;


public interface BoardService {
	
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);
	
	int selectBoardTotalContents();

	int insertBoard(Board board);

	Board selectOneBoard(int boardNo);

	int updateBoard(Board board);


}
