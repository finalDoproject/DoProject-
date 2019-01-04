package com.kh.dp.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/mypage/mypage.do")
	public String mypageView() {
		
		return null;
	}
	
	@RequestMapping("/mypage/profile.do")
	public String profileView() {
		
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
