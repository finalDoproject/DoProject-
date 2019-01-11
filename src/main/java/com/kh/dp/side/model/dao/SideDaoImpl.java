package com.kh.dp.side.model.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.vo.Join;
import com.kh.dp.side.model.vo.Matching;
import com.kh.dp.side.model.vo.MatchingInfo;
import com.kh.dp.task.model.vo.Task;
import com.sun.org.apache.xalan.internal.xsltc.compiler.Parser;

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

	@Override
	public int isClicked(int mNo,int requestNo,int dtNo) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mNo", mNo);
		map.put("requestNo", requestNo);
		map.put("dtNo", dtNo);
		
		return sqlSession.selectOne("matching.isClicked", map);
	}

	@Override
	public int deleteDT(int mNo, int requestNo, int dtNo) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mNo", mNo);
		map.put("requestNo", requestNo);
		map.put("dtNo", dtNo);
		
		return sqlSession.delete("matching.deleteDT", map);
	}

	@Override
	public int browseResult(int requestNo, int i) {
		
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("requestNo", requestNo);
		map.put("i", i);
		
		return sqlSession.selectOne("matching.browseResult", map);
		
		}
	
	@Override
	public int countMember(int requestNo) {
		
		return sqlSession.selectOne("matching.countMember", requestNo);
	}

	@Override
	public List<Map<String, String>> FileList(int currentPage, int numPerPage, int pno) {
		
		RowBounds rowBounds = new RowBounds((currentPage-1)*numPerPage, numPerPage);
		
		Map<String, String> map = new HashMap<String,String>();
		
		map.put("pno", String.valueOf(pno));

		return sqlSession.selectList("matching.fileList", map, rowBounds);
	}

	@Override
	public int FileTotalContents(int pno) {
		
		return sqlSession.selectOne("matching.fileTotalContents", pno);
	}

	@Override
	public List<Task> totalCalendar(int pno) {
		
		
		return sqlSession.selectList("task.selectTaskList", pno);
	}

}
