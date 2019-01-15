package com.kh.dp.project.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.project.model.dao.ProjectDao;
import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;
import com.kh.dp.project.model.vo.TaskCount;

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
	public int insertProjectLv(List<Project> pjLevel) {
		return projectDao.insertProjectLv(pjLevel);
	}
	
	@Override
	public Project selectOneProject(int pno) {
		return projectDao.selectOneProject(pno);
	}

	@Override
	public List<Project> selectOneProjectLv(int pno) {
		 return projectDao.selectOneProjectLv(pno);
	}
	

	@Override
	public int updateLevelCk(Project project) {
		return projectDao.updateLevelCk(project);
	}

	@Override
	public int updateOneLevelCk(Project project) {
		return projectDao.updateOneLevelCk(project);
	}
	
	@Override
	public int updateOneLevelunCk(Project project) {
		return projectDao.updateOneLevelunCk(project);
	}
	
	@Override
	public int updateProject(Project project) {
		return projectDao.updateProject(project);
	}

	@Override
	public int updateProjectLv(List<Project> pjLevel) {
		return projectDao.updateProjectLv(pjLevel);
	}
	
	@Override
	public List<Member> memberProfileList(int mno) {
		return projectDao.memberProfileList(mno);
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


	@Override
	public int deleteProject(int pno) {
		return projectDao.deleteProject(pno);
	}

	@Override
	public List<Member> selectSearchMember(String userNick) {
		return projectDao.selectSearchMember(userNick);
	}

	@Override
	public int insertInviteProject(int pno, int mno) {
		return projectDao.insertInviteProject(pno, mno);
	}

	@Override
	public List<Member> selectSearchMember(int pno) {
		return projectDao.selectSearchMember(pno);
	}

	@Override
	public Object selectSearchPM(int pno, int mno) {
		return projectDao.selectSearchPM(pno, mno);
	}

	@Override
	public int insertExileAlarm(int mno, int pno) {
		return projectDao.insertExileAlarm(pno, mno);
	}

	@Override
	public int insertLeaveAlarm(int mno, int pno, int apmno) {
		return projectDao.insertLeaveAlarm(pno, mno, apmno);
	}

	@Override
	public List<Map<String, String>> projectMemberList(int mno) {
		 return projectDao.projectMemberList(mno);
	}

	@Override
	public TaskCount selectTaskLevelCount(int pno) {
		return projectDao.selectTaskLevelCount(pno);
	}





	

	
}
