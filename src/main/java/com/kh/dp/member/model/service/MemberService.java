package com.kh.dp.member.model.service;

import java.util.List;
import java.util.Map;

public interface MemberService {

	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();
	
	int deleteMember(int mno);

}
