package com.kh.doproject.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("/member/join.do")
	public String MemberView() {
		
		return null;
	}

}
