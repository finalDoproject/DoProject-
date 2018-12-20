package com.kh.dp.intro.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelpController {

	@RequestMapping("/intro/help/help.do")
	public String helpView() {
		
		return null;
	}
	
	
	@RequestMapping("/intro/help/helpDetail.do")
	public String helpDetailView() {
		
		return null;
	}
}

