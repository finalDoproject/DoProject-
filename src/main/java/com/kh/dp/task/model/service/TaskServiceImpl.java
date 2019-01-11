package com.kh.dp.task.model.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dp.intro.board.model.service.BoardServiceImpl;
import com.kh.dp.task.model.dao.TaskDao;
import com.kh.dp.task.model.exception.TaskException;
import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;
import com.kh.dp.task.model.vo.TaskKeep;

@Service
public class TaskServiceImpl implements TaskService {
	
	Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	TaskDao taskDao;
	
	@Override
	public int selectTaskTotalContents() {
		return taskDao.selectTaskTotalContents();
	}

	@Override
	public int insertTask(Task task, List<Attachment> attachList) {
		int result = 0;
		int taskNo = 0;

		System.out.println("확인 : " + task);
		try {
			result = taskDao.insertTask(task);
			if(result == TASK_SERVICE_ERROR) throw new TaskException();
			
			taskNo = task.getTno();
			logger.debug("taskNo = " + taskNo);
			
			
			
			if(attachList.size()>0) {
				for(Attachment a : attachList) {
					a.setFtno(taskNo);
					result = taskDao.insertAttachment(a);
					if(result == TASK_SERVICE_ERROR) throw new TaskException();
				}
			}
		}catch(Exception e) {
			logger.debug("게시물등록 에러");
			throw e;
		}
		return result;
	}
	
	@Override
	public Task selectOneTask(int taskNo) {
		return taskDao.selectOneTask(taskNo);
	}
	
	@Override
	public Attachment selectOneAttachment(int tno){
		return taskDao.selectOneAttachment(tno);
	}

	@Override
	public List<Task> selectListTask(int pno) {
		
		return taskDao.selectTaskList(pno);
	}

	@Override
	public int updateTask(Task task, Attachment attach) {
		// TODO Auto-generated method stub
		return taskDao.updateTask(task, attach);
	}

	@Override
	public int deleteTask(int tno) {
		// TODO Auto-generated method stub
		return taskDao.deleteTask(tno);
	}

	@Override
	public int deleteAttach(int tno) {
		// TODO Auto-generated method stub
		return taskDao.deleteAttach(tno);
	}

	@Override
	public int insertTaskkeep(TaskKeep tk) {
		// TODO Auto-generated method stub
		return taskDao.insertTaskkeep(tk);
	}

}
