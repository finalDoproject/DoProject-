package com.kh.dp.task.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;

public interface TaskDao {
	
	int insertTask(Task task);
	
	int insertAttachment(Attachment a);

	Task selectOneTask(int taskNo);

	Attachment selectOneAttachment(int tno);

	int selectTaskTotalContents();
	
	List<Task> selectTaskList(int pno);
	
	int updateTask(Task task, Attachment attach);
}
