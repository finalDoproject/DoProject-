package com.kh.dp.task.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.dp.task.model.vo.Task;

public class TaskDaoImpl implements TaskDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertTask(Task task) {
		return sqlSession.insert("task.insertTask",task);
	}
}
