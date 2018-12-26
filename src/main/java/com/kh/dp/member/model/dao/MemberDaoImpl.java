package com.kh.dp.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("member.selectMemberList", rowBounds);
	}

	@Override
	public int selectMemberTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectMemberTotalContents");
	}

	@Override
	public int deleteMember(int mno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.deleteMember", mno);
	}

}
