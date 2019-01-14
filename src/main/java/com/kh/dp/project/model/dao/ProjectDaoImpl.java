package com.kh.dp.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;
import com.kh.dp.project.model.vo.TaskCount;

@Repository
public class ProjectDaoImpl implements ProjectDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// ---- 프로젝트 ----//
	@Override
	public List<Map<String, String>> selectProjectList(int mno) {
		return sqlSession.selectList("project.selectProjectList", mno);
	}

	@Override
	public int insertProject(Project project) {
		return sqlSession.insert("project.insertProject", project);
	}
	
	@Override
	public int insertProjectLv(List<Project> pjLevel) {
		return sqlSession.insert("project.insertProjectLv", pjLevel);
	}
	
	@Override
	public Project selectOneProject(int pno) {
		return sqlSession.selectOne("project.selectOneProject", pno);
	}

	@Override
	public List<Project> selectOneProjectLv(int pno) {
		return sqlSession.selectList("project.selectOneProjectLv", pno);
	}
	
	@Override
	public int updateLevelCk(Project project) {
		return sqlSession.update("project.updateLevelCk", project);
	}

	@Override
	public int updateOneLevelCk(Project project) {
		System.out.println("project:"+project);
		System.out.println("체크값:"+project.getLcheck());
		if(project.getLcheck().equals("N")) {
			System.out.println("Y로 변경");
			return sqlSession.update("project.updateOneLevelCk", project);					
		}else {
			System.out.println("N으로 변경");
			return sqlSession.update("project.updateOneLevelunCk", project);	
		}		
	}
	@Override
	public int updateOneLevelunCk(Project project) {
		return sqlSession.update("project.updateOneLevelunCk", project);	
	}
	
	@Override
	public int updateProject(Project project) {
		return sqlSession.update("project.updateProject", project);
	}

	@Override
	public int updateProjectLv(List<Project> pjLevel) {
		int result = 0;
		System.out.println("plevel:" +pjLevel );
		for(Project project: pjLevel) {
			System.out.println("확인!");
			result += sqlSession.update("project.updateProjectLv", project);										
		}
		System.out.println("result:" + result);
		return result;
	}

	
	// ---- 메모 ----//
	@Override
	public List<Map<String, String>> selectMemoList(Map<String, Object> map) {
		return sqlSession.selectList("memo.selectMemoList",map);
	}

	@Override
	public int updateMemo(Map<String, Object> map) {
		return sqlSession.update("memo.updateMemo", map);
	}

	@Override
	public int insertMemo(Map<String, Object> map) {
		return sqlSession.insert("memo.insertMemo", map);
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

	@Override
	public List<Member> selectSearchMember(String userNick) {
		return sqlSession.selectList("project.selectSearchMember", userNick);
	}

	@Override
	public int insertInviteProject(int pno, int mno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("mno", mno);
		return sqlSession.insert("project.insertInviteProject", map);
		
	}

	@Override
	public List<Member> selectSearchMember(int pno) {
		return sqlSession.selectList("project.searchMemberList", pno);
	}

	@Override
	public Object selectSearchPM(int pno, int mno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("mno", mno);
		return sqlSession.selectOne("project.selectSearchPM", map);
	}

	@Override
	public int insertExileAlarm(int pno, int mno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("mno", mno);
		return sqlSession.insert("project.insertExileAlarm", map);
	}

	@Override
	public int insertLeaveAlarm(int pno, int mno, int apmno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("mno", mno);
		map.put("apmno", apmno);
		return sqlSession.insert("project.insertLeaveAlarm", map);
	}

	@Override
	public TaskCount selectTaskLevelCount(int pno) {
		return sqlSession.selectOne("project.selectTaskLevelCount", pno);
	}



	

}
