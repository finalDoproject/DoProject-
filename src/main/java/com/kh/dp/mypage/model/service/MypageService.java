package com.kh.dp.mypage.model.service;

import java.util.List;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.mypage.model.vo.Mypage;

public interface MypageService {
	
	int insertContent(Mypage my);
	
	int updateContent(Mypage my);
	
	int deleteContent(Mypage my);

	List<Mypage> selectMypage(int mno);
	
}
