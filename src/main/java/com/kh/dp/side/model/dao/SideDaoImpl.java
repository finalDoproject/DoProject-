package com.kh.dp.side.model.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.vo.Join;
import com.kh.dp.side.model.vo.Matching;

@Repository
public class SideDaoImpl implements SideDao {

	@Autowired 
	SqlSessionTemplate sqlSession;

	@Override
	public List<Member> browseMember() {
		
		return sqlSession.selectList("matching.browseMember");
	}

	@Override
	public int insertMatching(Matching matching) {
		
		return sqlSession.insert("matching.insertMatching", matching);
	}

	@Override
	public int insertMatchingDT(Join join) {
		
		return sqlSession.insert("matching.insertMatchingDT", join);
	}
	
	

}
