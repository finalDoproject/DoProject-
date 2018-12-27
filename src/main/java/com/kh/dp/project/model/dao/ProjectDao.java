package com.kh.dp.project.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

public interface ProjectDao {
	// ---- 프로젝트 ----//
	List<Map<String, String>> selectProjectList();
	Project selectOneProject(int pno);
	
	
	// ---- 메모 ---- //
	List<Map<String, String>> selectMemoList();
	int updateMemo(String saveMemo);


	int insertProject(Project project);




}
