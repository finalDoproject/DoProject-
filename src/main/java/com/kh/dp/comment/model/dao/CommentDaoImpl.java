package com.kh.dp.comment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.comment.model.vo.TaskComment;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insertComment(TaskComment tc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("comment.insertComment",tc);
	}

	@Override
	public int updateComment(TaskComment tc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TaskComment> selectListComment(int tcno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("comment.selectListComment", tcno);
	}

	@Override
	public int deleteComment(int cno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
