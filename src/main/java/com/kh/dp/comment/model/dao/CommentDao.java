package com.kh.dp.comment.model.dao;

import java.util.List;

import com.kh.dp.comment.model.vo.TaskComment;

public interface CommentDao {

	int insertComment(TaskComment tc);
	
	int updateComment(TaskComment tc);
	
	List<TaskComment> selectListComment(int tcno);
	
	int deleteComment(int cno);
}
