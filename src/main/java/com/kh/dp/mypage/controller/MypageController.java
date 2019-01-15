package com.kh.dp.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dp.member.model.service.MemberService;
import com.kh.dp.member.model.vo.Attachment;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/mypage/mypage.do")
	public String mypageView() {
		
		return null;
	}
	
	@RequestMapping("/mypage/profile.do")
	public String profileView(@RequestParam int mno, Model model) {
		Attachment a = memberService.selectAttach(mno);
		
		model.addAttribute("a", a);
		
		return null;
	}
	
	@RequestMapping("/mypage/keeping.do")
	public String keepingView() {
		
		return null;
	}
	
	@RequestMapping("/mypage/mypost.do")
	public String mypostView() {
		
		return null;
	}
	
	@RequestMapping("/mypage/mycalendar.do")
	public String mycalendarView() {
		
		return null;
	}
	
}
