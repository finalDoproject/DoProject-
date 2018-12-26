package com.kh.dp.project.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.project.model.dao.ProjectDao;
import com.kh.dp.project.model.vo.Memo;

@Service
public class ProjectServiecImpl implements ProjectService {
	
	@Autowired
	private ProjectDao projectDao;
	
	@Override
    public List<Map<String, String>> selectMemoList() {
        return projectDao.selectMemoList();
    }

	@Override
	public int updateMemo(String saveMemo) {
		return projectDao.updateMemo(saveMemo);
	}

}
