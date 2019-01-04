package com.kh.dp.intro.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.intro.board.model.vo.Board;

public interface BoardDao {

	List<Map<String, String>> selectHelpList(int cPage, int numPerPage);

	int selectHelpTotalContents();

	int insertHelp(Board board);

	Board selectOneHelp(int boardNo);

	int updateHelp(Board board);
	
	int deleteHelp(int bno);
	
	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);
	
	int selectNoticeTotalContents();

	int insertNotice(Board board);

	Board selectOneNotice(int boardNo);

	int updateNotice(Board board);

	int deleteNotice(int bno);
	
}
