package com.kh.dp.project.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

public interface ProjectService {
	// ---- 프로젝트 ----//
	List<Map<String, String>> selectProjectList(int mno);
	int insertProject(Project project);
	int insertProjectLv(List<Project> pjLevel);
	Project selectOneProject(int pno);
	List<Project> selectOneProjectLv(int pno);
	int updateLevelCk(Project project);
	int updateOneLevelCk(Project project);
	int updateOneLevelunCk(Project project);
	int updateProject(Project project);
	int updateProjectLv(List<Project> pjLevel);
	
	// ---- 메모 ---- //
	List<Map<String, String>> selectMemoList(Map<String, Object> map);
	int updateMemo(Map<String, Object> map);
	int insertMemo(Map<String, Object> map);

	// 프로젝트 참여자 검색
	List<Map<String, String>> selectProjectIntoMember(int pno);
	int deleteLeaveProject(int pno, int mno);
	int deleteMemberFromProject(int pno, int mno);
	List<Map<String, String>> selectAlarmList(int mno);
	int deleteProject(int pno);
	List<Member> selectSearchMember(String userNick);
	int insertInviteProject(int pno, int mno);
	List<Member> selectSearchMember(int pno);
	Object selectSearchPM(int pno, int mno);
	int insertExileAlarm(int mno, int pno);
	int insertLeaveAlarm(int mno, int pno, int apmno);
	
	
	List<Map<String, String>> projectMemberList(int mno);
	
	
	


}
