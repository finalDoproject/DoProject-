package com.kh.dp.member.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kh.dp.member.model.vo.Attachment;
import com.kh.dp.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	int checkIdDuplicate(String userId);
	
	int checkEmailDuplicate(String email);

	Member selectOne(String userId);
	
	Member searchId(String email);
	
	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();
	
	int deleteMember(int mno);
	
	int withdrawMember(String userId);

	int updateMember(Member member);

	Member selectOneNickname(String nickname);

	int updateNewPw(Member m);

	Member selectOne(int mno);

	

	Attachment selectAttach(int mno);
	
	int updateAttachment(Attachment a);


	
}
