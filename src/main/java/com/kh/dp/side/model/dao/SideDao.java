package com.kh.dp.side.model.dao;

import java.util.List;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.vo.Matching;

public interface SideDao {
	
	public List<Member> browseMember();

	public int insertMatching(Matching matching);

}
