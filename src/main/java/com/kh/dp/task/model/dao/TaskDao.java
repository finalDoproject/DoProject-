package com.kh.dp.task.model.dao;

import java.util.List;

import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;

public interface TaskDao {
	
	int insertTask(Task task);
	
	int insertAttachment(Attachment a);

	Task selectOneTask(int taskNo);

	List<Attachment> selectAttachmentList(int taskNo);

	int selectTaskTotalContents();
}
