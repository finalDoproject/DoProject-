package com.kh.dp.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.member.model.vo.Attachment;
import com.kh.dp.member.model.vo.Member;


@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member member) {
		System.out.println(member);
		int result = sqlSession.insert("member.insertFile");
		int result2 = sqlSession.insert("member.insertMember", member);
		
		return result+result2;
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("member.checkIdDuplicate", hmap);
		
		return (Integer)hmap.get("result");
	}
	
	@Override
	public int checkEmailDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("member.checkEmailDuplicate", hmap);
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
	public int updateNewPw(Member m) {
	
		return sqlSession.update("member.memberNewPw", m);
	}

	@Override
	public Member searchId(String email) {
		
		return sqlSession.selectOne("member.searchId", email);
	}


	@Override
	public int withdrawMember(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.withdrawMember", userId);
	}
	
	@Override
	public int updateMember(Member member) {
		
		return sqlSession.update("member.updateMember", member);
	}

	@Override
	public Member selectOneNickname(String nickname) {
		return sqlSession.selectOne("member.selectOneNickname", nickname);
	}

	@Override
	public Attachment selectAttach(int mno) {
		
		return sqlSession.selectOne("member.selectAttach", mno);
	}

	@Override
	public int updateAttachment(Attachment a) {
		
		return sqlSession.update("member.updateAttachment", a);
	}
	
	
	@Override
	public Member selectOne(int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneMno", mno);
	}
	

}
