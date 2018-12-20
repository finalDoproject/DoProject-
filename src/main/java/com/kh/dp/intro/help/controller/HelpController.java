package com.kh.doproject.intro.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelpController {

	@RequestMapping("/intro/help/help.do")
	public String NoticeView() {
		
		return null;
	}
}
