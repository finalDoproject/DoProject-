package com.kh.dp.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dp.common.util.Utils;
import com.kh.dp.member.model.service.MemberService;
import com.kh.dp.member.model.vo.Member;

@SessionAttributes(value= {"member"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 비밀번호 암호객체
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/join.do")
	public String MemberView() {
		
		return null;
	}
	
	// 로그인 버튼 클릭시 로그인페이지 이동
	@RequestMapping("/member/login.do")
	public String Memberlogin() {
		
	return "/member/Login";
	}
	
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll(Member member, Model model) {
		System.out.println("member : " + member);
		// 원래비번
		String rawPwd = member.getPassword();
		System.out.println("암호화 전 비번 : "+rawPwd);
		
		member.setPassword(bcryptPasswordEncoder.encode(rawPwd));
		System.out.println("암호화된 비번 : "+member.getPassword());
		
		int result = memberService.insertMember(member);
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) msg = "회원 가입에 성공했습니다!"+"     "+member.getNickName()+"님 환영합니다!"+"     "+"멋진 프로젝트를 만들어보세요!";
		else msg = "회원가입에 실패했습니다.";
		
		model.addAttribute("loc",loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(@RequestParam String userId){
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable = memberService.checkIdDuplicate(userId) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	@RequestMapping(value="/member/memberLogin.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam String userId, @RequestParam String password) {
		
		ModelAndView mv = new ModelAndView();
		
		Member m = memberService.selectOne(userId);
		
		String loc = "/";
		String msg = "";
		
		if( m == null) {
			msg = "존재하지 않는 회원입니다.";
		} else {
			
			if(bcryptPasswordEncoder.matches(password, m.getPassword())) {
				msg="로그인에 성공했습니다.";
				mv.addObject("member", m);
				loc="/project/projectMain.do";
			} else {
				msg = "비밀번호를 다시 확인해주세요.";
			}
		}
		
		mv.addObject("loc", loc).addObject("msg", msg);
		mv.setViewName("common/msg");

		return mv;
	}
	
	@RequestMapping("/member/MemberList.do")
	public String SelectMemberList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 회원 목록 가져오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(memberService.selectMemberList(cPage, numPerPage));
		
		System.out.println("list : " + list);
		// 2. 전체 게시글 개수 가져오기
		int totalContents = memberService.selectMemberTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "MemberList.do");
		
		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "/intro/adminPage";
		
	}
	
	@RequestMapping("/member/adminDeleteMember.do")
	public String deleteMember(@RequestParam int mno, Model model) {
		
		int result = memberService.deleteMember(mno);
		
		String loc = "/member/MemberList.do";
		String msg = "";
		
		if(result > 0) {
			msg="회원  삭제 성공";
			loc ="/member/MemberList.do";
		}else {
			msg = "회원 삭제 실패";
		}

		model.addAttribute("loc" , loc)
		.addAttribute("msg" , msg);
		
		return "common/msg";
		
	}

}
