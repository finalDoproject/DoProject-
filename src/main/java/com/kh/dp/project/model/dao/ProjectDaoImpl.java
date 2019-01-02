package com.kh.dp.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

@Repository
public class ProjectDaoImpl implements ProjectDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// ---- 프로젝트 ----//
	@Override
	public List<Map<String, String>> selectProjectList() {
		return sqlSession.selectList("project.selectProjectList");
	}

	@Override
	public int insertProject(Project project) {
		return sqlSession.insert("project.insertProject", project);
	}
	
	@Override
	public Project selectOneProject(int pno) {
		return sqlSession.selectOne("project.selectOneProject", pno);
	}
	
	// ---- 메모 ----//
	@Override
	public List<Map<String, String>> selectMemoList(Map<String, Object> map) {
		return sqlSession.selectList("memo.selectMemoList",map);
	}

	@Override
	public int updateMemo(String saveMemo) {
		return sqlSession.update("memo.updateMemo", saveMemo);
	}

	// 프로젝트 참여자 리스트
	@Override
	public List<Map<String, String>> selectProjectIntoMember(int pno) {
		return sqlSession.selectList("project.selectProjectIntoMember", pno);
	}

	@Override
	public int deleteLeaveProject(int pno, int mno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("mno", mno);
		return sqlSession.delete("project.deleteLeaveProject", map);
	}

	@Override
	public int deleteMemberFromProject(int pno, int mno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("mno", mno);
		return sqlSession.delete("project.deleteLeaveProject", map);
	}

	@Override
	public List<Map<String, String>> selectAlarmList(int mno) {
		return sqlSession.selectList("project.selectAlarmList", mno);
	}

	@Override
	public int deleteProject(int pno) {
		return sqlSession.delete("project.deleteProject", pno);
	}

	

	



	

}
