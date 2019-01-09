package com.kh.dp.member.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kh.dp.member.model.vo.Attachment;
import com.kh.dp.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	int checkIdDuplicate(String userId);

	Member selectOne(String userId);
	
	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();
	
	int deleteMember(int mno);
	
	int withdrawMember(String userId);

	int updateMember(Member member);

	Member selectOneNickname(String nickname);

	
	
	
	

	int updateNewPw(Member m);

	Attachment selectAttach(int mno);
	
	int updateAttachment(Attachment a);


	
}
