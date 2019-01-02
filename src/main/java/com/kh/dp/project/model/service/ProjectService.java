package com.kh.dp.project.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

public interface ProjectService {
	// ---- 프로젝트 ----//
	List<Map<String, String>> selectProjectList();
	int insertProject(Project project);

	Project selectOneProject(int pno);
	
	
	// ---- 메모 ---- //
	List<Map<String, String>> selectMemoList(Map<String, Object> map);
	int updateMemo(String saveMemo);

	// 프로젝트 참여자 검색
	List<Map<String, String>> selectProjectIntoMember(int pno);
	int deleteLeaveProject(int pno, int mno);
	int deleteMemberFromProject(int pno, int mno);
	List<Map<String, String>> selectAlarmList(int mno);
	int deleteProject(int pno);


}
