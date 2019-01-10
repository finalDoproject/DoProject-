package com.kh.dp.task.model.dao;

import java.util.List;
import java.util.Map;

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
	public int selectTaskTotalContents() {
		return sqlSession.selectOne("task.selectTaskTotalContents");
	}
	
	@Override
	public int insertTask(Task task) {
		return sqlSession.insert("task.insertTask",task);
	}
	
	@Override
	public int insertAttachment(Attachment a) {
		return sqlSession.insert("task.insertAttachment", a);
	}
	
	@Override
	public Task selectOneTask(int tno) {
		return sqlSession.selectOne("task.selectOneTask",tno);
	}
	
	@Override
	public Attachment selectOneAttachment(int tno){
		return sqlSession.selectOne("task.selectOneAttachment", tno);
	}

	@Override
	public List<Task> selectTaskList(int pno) {
		System.out.println( sqlSession.selectList("task.selectTaskList", 1));
		System.out.println("pno : "+pno);
		return sqlSession.selectList("task.selectTaskList", pno);
	}

	@Override
	public int updateTask(Task task, Attachment a) {
		// TODO Auto-generated method stub
		int result1 = 0;
		if(a.getFoldname() != null) {
			result1 = sqlSession.insert("task.insertAttachment", a);
		}else {
			result1 = 1; 
		}
		
		int result2 = sqlSession.update("task.updateTask",task);
		
		int result = 0;
		if(result1 != 0 && result2 != 0) {
			result = 1;
		}
		
		return result; 
	}
	
	
}
