package com.kh.dp.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.member.model.dao.MemberDao;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao memberDao;

	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return memberDao.selectMemberList(cPage,numPerPage);
	}

	@Override
	public int selectMemberTotalContents() {
		// TODO Auto-generated method stub
		return memberDao.selectMemberTotalContents();
	}

}
