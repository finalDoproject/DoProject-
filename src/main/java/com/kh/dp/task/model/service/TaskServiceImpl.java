package com.kh.dp.task.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.intro.board.model.service.BoardServiceImpl;
import com.kh.dp.task.model.dao.TaskDao;
import com.kh.dp.task.model.exception.TaskException;
import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;

@Service
public class TaskServiceImpl implements TaskService {
	
	Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	TaskDao taskDao;
	
	@Override
	public int selectTaskTotalContents() {
		return 0;
	}

	@Override
	public int insertTask(Task task, List<Attachment> attachList) {
		int result = 0;
		int taskNo = 0;
		
		try {
			result = taskDao.insertTask(task);
			if(result == TASK_SERVICE_ERROR) throw new TaskException();
			
			taskNo = task.gettNo();
			logger.debug("taskNo = " + taskNo);
			
			if(attachList.size()>0) {
				for(Attachment a : attachList) {
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
	public List<Attachment> selectAttachmentList(int taskNo){
		return taskDao.selectAttachmentList(taskNo);
	}

}
