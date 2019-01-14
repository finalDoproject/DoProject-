package com.kh.dp.comment.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.comment.model.dao.CommentDao;
import com.kh.dp.comment.model.vo.TaskComment;
import com.kh.dp.intro.board.model.service.BoardServiceImpl;

@Service
public class CommentServiceImpl implements CommentService {

	Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	CommentDao commentDao;
	
	@Override
	public int insertComment(TaskComment tc) {
		// TODO Auto-generated method stub
		return commentDao.insertComment(tc);
	}

	@Override
	public int updateComment(TaskComment tc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TaskComment> selectListComment(int tcno) {
		// TODO Auto-generated method stub
		return commentDao.selectListComment(tcno);
	}

	@Override
	public int deleteComment(int cno) {
		// TODO Auto-generated method stub
		return commentDao.deleteComment(cno);
	}
	
	
}
