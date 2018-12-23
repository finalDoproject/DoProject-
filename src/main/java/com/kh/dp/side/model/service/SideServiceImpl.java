package com.kh.dp.side.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.dao.SideDao;
import com.kh.dp.side.model.vo.Matching;

@Service
public class SideServiceImpl implements SideService {

	@Autowired
	private SideDao sideDao;
	
	@Override
	public List<Member> browseMember() {
		
		return sideDao.browseMember();
	}

	@Override
	public int insertMatching(Matching matching) {
		
		return sideDao.insertMatching(matching);
	}

}
