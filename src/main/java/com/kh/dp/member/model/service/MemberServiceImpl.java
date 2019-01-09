package com.kh.dp.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.dp.member.model.dao.MemberDao;
import com.kh.dp.member.model.vo.Attachment;
import com.kh.dp.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

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
	public int withdrawMember(String userId) {
		
		return memberDao.withdrawMember(userId);
	}
	
	@Override
	public int updateMember(Member member) {
		
		return memberDao.updateMember(member);
	}

	@Override
	public Member selectOneNickname(String nickname) {
		return memberDao.selectOneNickname(nickname);
	}

	@Override
	public Attachment selectAttach(int mno) {
		return memberDao.selectAttach(mno);
	}
	
	@Override
	public int updateAttachment(Attachment a) {
		int result = 0;
		
		result = memberDao.updateAttachment(a);
		return result;
	}
	
	
	public static String getRamdomPassword() { 
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		
		int idx = 0; 
		
		StringBuffer sb = new StringBuffer(); 
		
		for (int i = 0; i < 8; i++) { 
		
		idx = (int) (charSet.length * Math.random());
		
		sb.append(charSet[idx]); } 
		
		return sb.toString(); 
		}
	
	
	@Override
	public int updateNewPw(Member m) {
		
		String newPwd = getRamdomPassword();
		
		m.setPassword(bcryptPasswordEncoder.encode(newPwd));
		
		int result = memberDao.updateNewPw(m);
		
		MimeMessage mail = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mail);
		
		try {
			helper.setFrom("ddProjectbb@gmail.com");
		} catch (MessagingException e1) {
		
			e1.printStackTrace();
		}
		
		String htmlStr = "<h2>안녕하세요 '"+ m.getNickName()+"' 님</h2><br><br>" 
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + newPwd +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://54.180.123.73/MS/'>MS :p 홈페이지 접속 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[MS :p] 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(m.getEmail()));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		
		return result;
	}

	
	
}
