package com.kh.dp.side.model.dao;

import java.util.List;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.vo.Join;
import com.kh.dp.side.model.vo.Matching;

public interface SideDao {
	
	public List<Member> browseMember(int pno);

	public int insertMatching(Matching matching);
	
	public int insertMatchingDT(Join join);

	public int insertMember(int mno);

}
