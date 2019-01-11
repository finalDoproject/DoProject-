package com.kh.dp.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.mypage.model.dao.MypageDao;
import com.kh.dp.mypage.model.vo.Mypage;

@Service
public class MypageServiceImpl implements MypageService {


	@Autowired
	MypageDao mypageDao;
	@Override
	public int insertContent(Mypage my) {
		
		return mypageDao.insertContent(my);
	}

	@Override
	public int updateContent(Mypage my) {
		
		return mypageDao.updateContent(my);
	}

	@Override
	public int deleteContent(int mcno) {
	
		return mypageDao.deleteContent(mcno);
	}

	@Override
	public List<Mypage> selectMypage(int mno) {
		
		return mypageDao.selectMypage(mno);
	}

}
