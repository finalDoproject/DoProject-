package com.kh.dp.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dp.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	int checkIdDuplicate(String userId);

	Member selectOne(String userId);
	
	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();
	
	int deleteMember(int mno);

}
