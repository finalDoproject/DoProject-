package com.kh.dp.side.model.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.vo.Join;
import com.kh.dp.side.model.vo.Matching;
import com.kh.dp.side.model.vo.MatchingInfo;

@Repository
public class SideDaoImpl implements SideDao {

	@Autowired 
	SqlSessionTemplate sqlSession;

	@Override
	public List<Member> browseMember(int pno) {
		
		return sqlSession.selectList("matching.browseMember", pno);
	}

	@Override
	public int insertMatching(Matching matching) {
		
		return sqlSession.insert("matching.insertMatching", matching);
	}

	@Override
	public int insertMatchingDT(Join join) {
		
		return sqlSession.insert("matching.insertMatchingDT", join);
	}
	
	@Override
	public int insertMember(int mno) {
		return sqlSession.insert("matching.insertMember", mno);
	}

	@Override
	public List<MatchingInfo> browseMatchingInfo(int mno) {
		
		return sqlSession.selectList("matching.browseMatchingInfo", mno);
	}

	@Override
	public List browseDT(int mNo, int requestNo) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mNo", mNo);
		map.put("requestNo", requestNo);
		
		return sqlSession.selectList("matching.browseDT", map);
	}
	
	@Override
	public int insertMySelf(int mno) {
		
		return sqlSession.insert("matching.insertMySelf", mno);
	}

}
