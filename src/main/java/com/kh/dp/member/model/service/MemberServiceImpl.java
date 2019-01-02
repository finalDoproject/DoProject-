package com.kh.dp.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.dp.member.model.dao.MemberDao;
import com.kh.dp.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	MemberDao memberDao;

	@Override
	public int insertMember(Member member) {
		
		return memberDao.insertMember(member);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		
		return memberDao.checkIdDuplicate(hmap);
	}

	@Override
	public Member selectOne(String userId) {
		
		return memberDao.selectOne(userId);
	}
	
	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		
		return memberDao.selectMemberList(cPage,numPerPage);
	}

	@Override
	public int selectMemberTotalContents() {
		
		return memberDao.selectMemberTotalContents();
	}

	@Override
	public int deleteMember(int mno) {
		
		return memberDao.deleteMember(mno);
	}
	


	@Override
	public Member mailSendWithPassword(String userId, String email, HttpServletRequest request) {
		
		return memberDao.searchPw(userId, email, request);
	
	/*
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ nickName +"' 님</h2><br><br>" 
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" +  +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://54.180.123.73/MS/'>MS :p 홈페이지 접속 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[MS :p] 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		// 비밀번호 암호화해주는 메서드
		
		// 데이터 베이스 값은 암호한 값으로 저장시킨다.
		memberDao.searchPassword
*/

	}

}
