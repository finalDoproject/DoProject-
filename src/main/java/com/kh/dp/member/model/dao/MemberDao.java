package com.kh.dp.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kh.dp.member.model.vo.Member;

public interface MemberDao {
	
	int insertMember(Member member);

	int checkIdDuplicate(HashMap<String, Object> hmap);
	
	int checkEamilDuplicate(HashMap<String, Object> hmap);

	Member selectOne(String userId);
	
	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();

	int deleteMember(int mno);

	int updateNewPw(Member m);

	Member searchId(String email);
	
	int withdrawMember(String userId);
	
	int updateMember(Member member);

	Member selectOneNickname(String nickname);

	


}
