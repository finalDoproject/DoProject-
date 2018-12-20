package com.kh.doproject.intro.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("/intro/notice/notice.do")
	public String NoticeView() {
		
		return null;
	}

}
