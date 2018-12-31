package com.kh.dp.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.dp.email.service.MailSenderService;



@Controller
public class MailController {

	@Autowired
	private MailSenderService mailSenderService;
	
	
	
}
