package com.kh.dp.project.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

public interface ProjectService {
	// ---- 프로젝트 ----//
	List<Map<String, String>> selectProjectList();
	int insertProject(Project project);

	
	// ---- 메모 ---- //
	List<Map<String, String>> selectMemoList();
	int updateMemo(String saveMemo);



}
