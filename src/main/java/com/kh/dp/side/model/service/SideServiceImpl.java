package com.kh.dp.side.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.dao.SideDao;
import com.kh.dp.side.model.vo.Join;
import com.kh.dp.side.model.vo.Matching;
import com.kh.dp.side.model.vo.MatchingInfo;

@Service
public class SideServiceImpl implements SideService {

	@Autowired
	private SideDao sideDao;
	
	@Override
	public List<Member> browseMember(int pno) {
		
		return sideDao.browseMember(pno);
	}

	@Override
	public int insertMatching(Matching matching) {
		
		return sideDao.insertMatching(matching);
	}

	@Override
	public int insertMatchingDT(Join join) {
		
		return sideDao.insertMatchingDT(join);
	}


	@Override
	public int insertMember(int mno) {
		return sideDao.insertMember(mno);
	}

	@Override
	public List<MatchingInfo> browseMatchingInfo(int mno) {
		
		return sideDao.browseMatchingInfo(mno);
	}

	@Override
	public List browseDT(int mNo, int requestNo) {
		
		return sideDao.browseDT(mNo, requestNo);
	}

	@Override
	public int insertMySelf(int mno) {
		
		return sideDao.insertMySelf(mno);
	}

}
