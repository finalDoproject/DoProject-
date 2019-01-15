package com.kh.dp.task.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;
import com.kh.dp.task.model.vo.TaskKeep;

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
	public Task selectOneTask(int taskNo) {
		return sqlSession.selectOne("task.selectOneTask",taskNo);
	}
	
	@Override
	public List<Attachment> selectAttachmentList(int taskNo){
		return sqlSession.selectList("task.selectAttachmentList", taskNo);
	}

	@Override
	public List<Map<String, String>> selectTaskList(int pno) {

	@Override
	public int updateTask(Task task, Attachment a) {
		// TODO Auto-generated method stub
		int tno = task.getTno();
		int result1 = 0;
		System.out.println("a : " + a);
		if(a.getFoldname() != null) {
			result1 = sqlSession.delete("task.deleteAttach" , tno);
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

	public int deleteTask(int tno) {
		return sqlSession.selectList("task.selectTaskList", pno);
		
	}

	@Override
	public int deleteAttach(int tno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("task.deleteAttach", tno);
	}

	@Override
	public int insertTaskkeep(TaskKeep tk) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("task.insertTaskkeep", tk);
	}
	@Override
	public List<Task> selectListmyTask(int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("task.selectListmyTask", mno);
	}
	
	
}
