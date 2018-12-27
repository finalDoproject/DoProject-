package com.kh.dp.project.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.project.model.vo.Memo;

public interface ProjectDao {

	 List<Map<String, String>> selectMemoList();

	int updateMemo(String saveMemo);

}
