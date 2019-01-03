package com.kh.dp.project.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.member.model.vo.Member;
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



	// 프로젝트 참여자 검색
	List<Map<String, String>> selectProjectIntoMember(int pno);
	int deleteLeaveProject(int pno, int mno);
	int deleteMemberFromProject(int pno, int mno);
	List<Map<String, String>> selectAlarmList(int mno);
	int deleteProject(int pno);
	List<Member> selectSearchMember(String userNick);
	int insertInviteProject(int pno, int mno);
	List<Member> selectSearchMember(int pno);
	Object selectSearchPM(int pno, int mno);
	int insertExileAlarm(int pno, int mno);
	int insertLeaveAlarm(int pno, int mno, int apmno);


}
