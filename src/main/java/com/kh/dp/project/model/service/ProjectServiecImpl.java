package com.kh.dp.project.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.project.model.dao.ProjectDao;
import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

@Service
public class ProjectServiecImpl implements ProjectService {
	
	@Autowired
	private ProjectDao projectDao;
	
	// ---- 프로젝트 ---- //
	@Override
	public List<Map<String, String>> selectProjectList() {
		 return projectDao.selectProjectList();
	}

	@Override
	public int insertProject(Project project) {
		return projectDao.insertProject(project);
	}
	
	@Override
	public Project selectOneProject(int pno) {
		return projectDao.selectOneProject(pno);
	}

	
	
	// ---- 메모 ---- //
	@Override
    public List<Map<String, String>> selectMemoList() {
        return projectDao.selectMemoList();
    }

	@Override
	public int updateMemo(String saveMemo) {
		return projectDao.updateMemo(saveMemo);
	}

	@Override
	public List<Member> browseMember() {
		
		return projectDao.browseMember();
	}
	
	

	
}
