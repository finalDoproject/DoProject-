package com.kh.dp.comment.model.service;

import java.util.List;

import com.kh.dp.comment.model.vo.TaskComment;

public interface CommentService {

	int insertComment(TaskComment tc);
	
	int updateComment(TaskComment tc);
	
	List<TaskComment> selectListComment(int tcno);
	
	int deleteComment(int cno);

}
