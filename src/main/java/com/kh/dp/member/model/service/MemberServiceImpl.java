package com.kh.dp.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.member.model.dao.MemberDao;
import com.kh.dp.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao memberDao;

	@Override
	public int insertMember(Member member) {
		
		return memberDao.insertMember(member);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		
		return memberDao.checkIdDuplicate(hmap);
	}

	@Override
	public Member selectOne(String userId) {
		
		return memberDao.selectOne(userId);
	}
	
	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		
		return memberDao.selectMemberList(cPage,numPerPage);
	}

	@Override
	public int selectMemberTotalContents() {
		
		return memberDao.selectMemberTotalContents();
	}

	@Override
	public int deleteMember(int mno) {
		
		return memberDao.deleteMember(mno);
	}

}
