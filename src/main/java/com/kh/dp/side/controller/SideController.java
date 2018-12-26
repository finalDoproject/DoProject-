package com.kh.dp.side.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dp.member.model.vo.Member;
import com.kh.dp.side.model.service.SideService;
import com.kh.dp.side.model.vo.Matching;

@Controller
public class SideController {

	@Autowired
    private SideService sideService;
	
	// 스케줄 매칭 인원 불러오기 위한 메소드
	@RequestMapping("/side/matchingRequest.do")
	public String MatchingRequest(Model model) {
		
		List<Member> mArr = new ArrayList<Member>();
		
		mArr = sideService.browseMember();
		
		model.addAttribute("member", mArr);
		
		return "side/request";
	}
	
	// 스케줄 매칭 요청 완료. DB로 향하는 메소드
	@RequestMapping("/side/matching.do")
	public String matching(HttpServletRequest req,@RequestParam String title, @RequestParam Date startDate,
						   @RequestParam Date endDate) {
		
		int mno = 1;
		
		Matching matcing = new Matching(title, startDate, endDate, mno);
		
		int result = sideService.insertMatching(matcing);
		System.out.println("result 결과 : "+result);
		return "redirect:/";
		
	}
	
	// 스케줄 참여 버튼 띄우기
	@RequestMapping("/side/matchingJoin.do")
	public String matcingJoin() {
		
		return "side/join";
	}
	
	
}
