package com.kh.dp.project.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

public interface ProjectDao {
	// ---- 프로젝트 ----//
	List<Map<String, String>> selectProjectList(int mno);
	int insertProject(Project project);
	int insertProjectLv(List<Project> pjLevel);
	Project selectOneProject(int no);
	List<Project> selectOneProjectLv(int pno);
	
	
	// ---- 메모 ---- //
	List<Map<String, String>> selectMemoList(Map<String, Object> map);
	int updateMemo(Map<String, Object> map);
	int insertMemo(Map<String, Object> map);



	// 프로젝트 참여자 검색
	List<Map<String, String>> selectProjectIntoMember(int pno);
	int deleteLeaveProject(int pno, int mno);
	int deleteMemberFromProject(int pno, int mno);
	List<Map<String, String>> selectAlarmList(int mno);


}
