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

	
	
	
	
	public static String getRamdomPassword(int len) { 
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		
		int idx = 0; 
		
		StringBuffer sb = new StringBuffer(); 
		
		for (int i = 0; i < len; i++) { 
		
		idx = (int) (charSet.length * Math.random());
		
		sb.append(charSet[idx]); } 
		
		return sb.toString(); 
		}
	
	
	@Override
	public int updateNewPw(String email) {
		
		
/*		
		String password = "";
		  for(int i = 0; i < 8; i++){
		   char lowerStr = (char)(Math.random() * 26 + 97);
		   if(i%2 == 0){
		    password += (int)(Math.random() * 10);
		   }else{
		    password += lowerStr;
		   }
		  }*/

		
		
		
		String newPwd = getRamdomPassword(8);
		
		return memberDao.updateNewPw(email);
	}




		
		
	
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
