package com.kh.dp.member.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dp.common.util.Utils;
import com.kh.dp.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/member/join.do")
	public String MemberView() {
		
		return null;
	}
	
	@RequestMapping("/member/adminPage.do")
	public String adminPage() {
		
		return "intro/adminPage";
	}
	
	
	@RequestMapping("/member/MemberList.do")
	public String SelectMemberList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 회원 목록 가져오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(memberService.selectMemberList(cPage, numPerPage));
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = memberService.selectMemberTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "MemberList.do");
		
		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "/intro/adminPage";
		
	}

}
