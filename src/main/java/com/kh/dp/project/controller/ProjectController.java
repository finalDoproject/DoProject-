package com.kh.doproject.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {

	@RequestMapping("/project/projectMain.do")
	public String ProjectView() {
		
		return null;
	}
}
