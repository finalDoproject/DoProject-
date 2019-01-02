package com.kh.dp.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.member.model.vo.Member;


@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member member) {
		System.out.println(member);
		return sqlSession.insert("member.insertMember", member);
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("member.checkIdDuplicate", hmap);
		
		return (Integer)hmap.get("result");
	}

	@Override
	public Member selectOne(String userId) {
		return sqlSession.selectOne("member.loginMember", userId);
	}

	
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

	@Override
	public Member searchPw(String userId, String email) {
		
		
		
		/*return sqlSession.update("member.searchPw",email);*/
		return null;
	}

}
