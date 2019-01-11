package com.kh.dp.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.dp.mypage.model.vo.Mypage;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertContent(Mypage my) {
		System.out.println(my);
		return sqlSession.insert("my.insertContent",  my);
	}

	
	@Override
	public int updateContent(Mypage my) {
		
		return sqlSession.update("my.updateContent", my);
	}

	
	@Override
	public int deleteContent(int mcno) {
		
		return sqlSession.delete("my.deleteContent", mcno);
	}

	@Override
	public List<Mypage> selectMypage(int mno) {
		
		return sqlSession.selectList("my.selectMypage", mno);
	}

}
