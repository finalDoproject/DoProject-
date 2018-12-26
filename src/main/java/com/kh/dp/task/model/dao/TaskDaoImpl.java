package com.kh.dp.task.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;

@Repository
public class TaskDaoImpl implements TaskDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertTask(Task task) {
		return sqlSession.insert("task.insertTask",task);
	}
	
	@Override
	public int insertAttachment(Attachment a) {
		return sqlSession.insert("task.insertAttachment", a);
	}
	
	@Override
	public Task selectOneTask(int taskNo) {
		return sqlSession.selectOne("task.selectOneTask",taskNo);
	}
	
	@Override
	public List<Attachment> selectAttachmentList(int taskNo){
		return sqlSession.selectList("task.selectAttachmentList", taskNo);
	}
}
