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
	public int checkEmailDuplicate(String email) {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("email", email);
		
		return memberDao.checkEmailDuplicate(hmap);
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
	

	
	@Override
	public Member searchId(String email) {
		
		return memberDao.searchId(email);
	}

	// 임시 비밀번호 발급
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
		
		// 임시 비밀번호 암호화
		m.setPassword(bcryptPasswordEncoder.encode(newPwd));
		
		int result = memberDao.updateNewPw(m);
		
		MimeMessage mail = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mail);
		
		try {
			// 보내는 사람 이메일
			helper.setFrom("ddProjectbb@gmail.com");
		} catch (MessagingException e1) {
		
			e1.printStackTrace();
		}
		
		String htmlStr = 
				 "<div align='center' style='border:2px solid #F88E6F; font-family:verdana'><br>"
				+ "<img width='500' height='280' src='http://192.168.20.41/dp/resources/images/mypage/users/friends.jpg'/>"
				+ "<h3>안녕하세요 '"+ m.getNickName()+"' 님</h3><br>"
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시 비밀번호 : <h2 style='color : #F88E6F'>'" + newPwd +"'</h2><br> 로그인 후 마이페이지에서 비밀번호 변경을 꼭 해주시기 바랍니다.</p>"
				+ "<p>오늘도 DOPROJECT와 멋진 프로젝트를 만들어보세요:D - 두플드림</p><br></div><br>"
				+ "※ 비밀번호를 바꾸신 적이 없으시면 ddProjectbb@gmail.com로 문의 바랍니다.";
		try {
			mail.setSubject("[DOPROJECT]"+" "+m.getUserId()+"님, 임시 비밀번호가 발급되었습니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(m.getEmail()));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public Member selectOne(int mno) {
		// TODO Auto-generated method stub
		return memberDao.selectOne(mno);
	}

	
}
