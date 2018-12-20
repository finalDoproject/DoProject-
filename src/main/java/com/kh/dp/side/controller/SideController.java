package com.kh.dp.side.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.service.SideService;

@Controller
public class SideController {

	//@Autowired
	//private SideService sideService;
	
	@RequestMapping("/side/matchingRequest.do")
	public String sMatching() {
		
		List<Member> mArr = new ArrayList<Member>();
		
		//mArr = sideService.browseMember();
		
		
		return "side/request";
	}
}
