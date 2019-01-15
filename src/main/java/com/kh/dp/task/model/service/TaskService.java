package com.kh.dp.task.model.service;

import java.sql.Date;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;
import com.kh.dp.task.model.vo.TaskKeep;

public interface TaskService {
	static int TASK_SERVICE_ERROR = 0;
	static int TASK_SERVICE_COMPLETE = 1;
	
	int selectTaskTotalContents();
	
	int insertTask(Task task, List<Attachment> attachList);
	
	Task selectOneTask(int taskNo);

	List<Attachment> selectAttachmentList(int no);

	List<Task> selectListTask(int pno);
		
	int updateTask(Task task, Attachment attach);
	
	int deleteTask(int tno);
	
	int deleteAttach(int tno);
	

	// 검색결과 리스트
	List<Task> searchListTask(String mno,String searchWd);
	
	int insertTaskkeep(TaskKeep tk);

	List<Task> selectListmyTask(int mno);

}
