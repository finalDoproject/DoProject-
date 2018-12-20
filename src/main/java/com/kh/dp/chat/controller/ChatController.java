package com.kh.dp.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping("/chat/chat.ch")
	public String ChattingView() {
		
		return "/chat/chat";
	}
	
}
