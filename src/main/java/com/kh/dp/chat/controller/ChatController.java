package com.kh.dp.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	@RequestMapping(value="/chat.ch", method=RequestMethod.GET)
	public String ChattingView() {		
		return "chat/chat";
	}
	
}
