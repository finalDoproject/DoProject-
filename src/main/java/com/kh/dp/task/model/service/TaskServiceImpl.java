package com.kh.dp.task.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.dp.intro.board.model.dao.BoardDao;
import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;

public class TaskServiceImpl implements TaskService {

	@Autowired
	BoardDao boardDao;
	
	@Override
	public int selectTaskTotalContents() {
		return 0;
	}

	@Override
	public int insertTask(Task task, List<Attachment> attachList) {
		int result = 0;
		int taskNo = 0;
		
		//여기서 부터 작성
		return result;
	}

}
