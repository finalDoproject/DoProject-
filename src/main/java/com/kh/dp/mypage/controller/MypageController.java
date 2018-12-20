package com.kh.doproject.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/mypage/mypage.do")
	public String mypageView() {
		
		return null;
	}
	
}
