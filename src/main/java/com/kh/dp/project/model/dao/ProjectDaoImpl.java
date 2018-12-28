package com.kh.dp.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.member.model.vo.Member;
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
	public List<Map<String, String>> selectMemoList() {
		return sqlSession.selectList("memo.selectMemoList");
	}

	@Override
	public int updateMemo(String saveMemo) {
		return sqlSession.update("memo.updateMemo", saveMemo);
	}

	// --- 인원 불러오기 --- //
	@Override
	public List<Member> browseMember() {
		return sqlSession.selectList("matching.browseMember");
	}

	



	

}
