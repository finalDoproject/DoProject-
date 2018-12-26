package com.kh.dp.task.model.service;

import java.util.List;

import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;

public interface TaskService {
	static int TASK_SERVICE_ERROR = 0;
	static int TASK_SERVICE_COMPLETE = 1;
	
	int selectTaskTotalContents();
	
	int insertTask(Task task, List<Attachment> attachList);
	
	Task selectOneTask(int taskNo);

	List<Attachment> selectAttachmentList(int no);
}
