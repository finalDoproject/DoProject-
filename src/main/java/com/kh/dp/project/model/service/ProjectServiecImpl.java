package com.kh.dp.project.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.project.model.dao.ProjectDao;
import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

@Service
public class ProjectServiecImpl implements ProjectService {
	
	@Autowired
	private ProjectDao projectDao;
	
	// ---- 프로젝트 ---- //
	@Override
	public List<Map<String, String>> selectProjectList(int mno) {
		 return projectDao.selectProjectList(mno);
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
    public List<Map<String, String>> selectMemoList(Map<String, Object> map) {
        return projectDao.selectMemoList(map);
    }

	@Override
	public int updateMemo(Map<String, Object> map) {
		return projectDao.updateMemo(map);
	}

	@Override
	public int insertMemo(Map<String, Object> map) {
		return projectDao.insertMemo(map);
	}

	// 프로젝트 참여자 검색
	@Override
	public List<Map<String, String>> selectProjectIntoMember(int pno) {
		return projectDao.selectProjectIntoMember(pno);
	}

	@Override
	public int deleteLeaveProject(int pno, int mno) {
		return projectDao.deleteLeaveProject(pno, mno);
	}

	@Override
	public int deleteMemberFromProject(int pno, int mno) {
		return projectDao.deleteMemberFromProject(pno, mno);
	}

	@Override
	public List<Map<String, String>> selectAlarmList(int mno) {
		return projectDao.selectAlarmList(mno);
  }

	
}
