package com.kh.dp.member.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kh.dp.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	int checkIdDuplicate(String userId);

	Member selectOne(String userId);
	
	Member searchId(String email);
	
	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();
	
	int deleteMember(int mno);

	int updateNewPw(Member m);

	


	
}
