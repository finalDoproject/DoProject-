package com.kh.dp.project.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

public interface ProjectService {
	// ---- 프로젝트 ----//
	List<Map<String, String>> selectProjectList(int mno);
	int insertProject(Project project);

	Project selectOneProject(int pno);
	
	
	// ---- 메모 ---- //
	List<Map<String, String>> selectMemoList(Map<String, Object> map);
	int updateMemo(Map<String, Object> map);
	int insertMeno(Map<String, Object> map);



}
