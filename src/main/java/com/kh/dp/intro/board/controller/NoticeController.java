package com.kh.dp.intro.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("/intro/board/notice.do")
	public String NoticeView() {
		
		return "intro/notice/notice";
	}
	
		
	@RequestMapping("/intro/board/insertnotice.do")
	public String insertNotice() {
			
		return "intro/notice/noticeForm";
	}
}
