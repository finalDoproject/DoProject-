package com.kh.dp.task.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;
import com.kh.dp.task.model.vo.TaskKeep;

public interface TaskDao {
	
	int insertTask(Task task);
	
	int insertAttachment(Attachment a);

	Task selectOneTask(int taskNo);

	Attachment selectOneAttachment(int tno);

	int selectTaskTotalContents();
	
	List<Task> selectTaskList(int pno);
	
	int updateTask(Task task, Attachment attach);
	
	int deleteTask(int tno);
	
	int deleteAttach(int tno);
	
	int insertTaskkeep(TaskKeep tk);
}
