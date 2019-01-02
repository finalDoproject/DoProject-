package com.kh.dp.project.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

public interface ProjectDao {
	// ---- 프로젝트 ----//
	List<Map<String, String>> selectProjectList(int mno);
	Project selectOneProject(int no);
	int insertProject(Project project);
	
	
	// ---- 메모 ---- //
	List<Map<String, String>> selectMemoList(Map<String, Object> map);
	int updateMemo(Map<String, Object> map);
	int insertMemo(Map<String, Object> map);






}
