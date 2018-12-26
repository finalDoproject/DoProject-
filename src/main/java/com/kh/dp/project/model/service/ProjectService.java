package com.kh.dp.project.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Memo;

public interface ProjectService {
	
	List<Map<String, String>> selectMemoList();

	int updateMemo(String saveMemo);
}
