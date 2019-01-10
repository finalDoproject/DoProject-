package com.kh.dp.side.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.vo.Join;
import com.kh.dp.side.model.vo.Matching;
import com.kh.dp.side.model.vo.MatchingInfo;

public interface SideDao {
	
	public List<Member> browseMember(int pno);

	public int insertMatching(Matching matching);
	
	public int insertMatchingDT(Join join);

	public int insertMember(int mno);

	public List<MatchingInfo> browseMatchingInfo(int mno);

	public List browseDT(int mNo, int requestNo);
	
	public int insertMySelf(int mno);

	public int isClicked(int mNo,int requestNo,int dtNo);

	public int deleteDT(int mNo, int requestNo, int dtNo);
	
	public int browseResult(int requestNo, int i);
	
	public int countMember(int requestNo);
	
	
}
	
