package com.kh.dp.member.model.dao;

import java.util.List;
import java.util.Map;

public interface MemberDao {
	
	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();

}
