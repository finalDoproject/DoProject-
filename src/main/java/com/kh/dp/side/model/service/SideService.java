package com.kh.dp.side.model.service;

import java.util.List;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.vo.Join;
import com.kh.dp.side.model.vo.Matching;

public interface SideService {

	public List<Member> browseMember();

	public int insertMatching(Matching matcing);
	
	public int insertMatchingDT(Join join);

}
