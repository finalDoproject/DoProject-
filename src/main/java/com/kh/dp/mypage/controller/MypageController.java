package com.kh.dp.mypage.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dp.member.model.service.MemberService;
import com.kh.dp.member.model.vo.Attachment;
import com.kh.dp.member.model.vo.Member;
import com.kh.dp.mypage.model.service.MypageService;
import com.kh.dp.mypage.model.vo.Mypage;
import com.kh.dp.task.model.service.TaskService;
import com.kh.dp.task.model.vo.Task;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MypageService myService;
	
	@Autowired
	private TaskService taskService;

	@RequestMapping("/mypage/mypage.do")
	public String mypageView() {
		
		return null;
	}
	
	@RequestMapping("/mypage/profile.do")
	public String profileView(@RequestParam int mno, Model model) {
		Attachment a = memberService.selectAttach(mno);
		
		model.addAttribute("a", a);
		
		return null;
	}
	
	@RequestMapping("/mypage/keeping.do")
	public String keepingView() {
		
		return null;
	}
	
	
	@RequestMapping("/mypage/mycalendar.do")
	public String mycalendarView() {
		return null;
	}
	
	@RequestMapping("/mypage/insert.do")
	public String insertInfo(@RequestParam long start, @RequestParam long end, @RequestParam String content, HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		
		Mypage my = new Mypage();
		my.setMcContent(content);
		my.setMcEnd(new Date(end - 86400000));
		my.setMcStart(new Date(start));
		my.setMcMno(m.getMno());
		
		System.out.println("insert:"+my.getMcMno());
		
		myService.insertContent(my);
		
		return "/mypage/mycalendar";
	}
	
	@RequestMapping("/mypage/update.do")
	public String updateInfo(@RequestParam int mcno, @RequestParam String content, HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		
		Mypage my = new Mypage();
		my.setMcContent(content);
		my.setMcno(mcno);
		my.setMcMno(m.getMno());

		System.out.println("update:"+my.getMcMno());
		System.out.println("여기 옵니다~~!");
		myService.updateContent(my);
		
		return "/mypage/mycalendar";
	}
	
	@RequestMapping("/mypage/delete.do")
	public String deleteInfo(@RequestParam int mcno, HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		
		Mypage my = new Mypage();
		my.setMcno(mcno);
		my.setMcMno(m.getMno());
		
		System.out.println("삭제됩니다~~");
		myService.deleteContent(my);
		
		return "/mypage/mycalendar";
	}
	
	@RequestMapping("/mypage/selectMypage.do")
	@ResponseBody
	public List<Mypage> selectMypage(HttpSession session){
		List<Mypage> result = null;
		Member m = null;
		
		try {
			m = (Member)session.getAttribute("member");
			
			result = myService.selectMypage(m.getMno());
			
			System.out.println(result);
		} catch(Exception e) {
			e.getStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/mypage/mypost.do")
	public String selectMytask(@RequestParam int mno, Model model) {
		
		ArrayList<Task> tasklist = 
				new ArrayList<Task>(taskService.selectListmyTask(mno));
		
		model.addAttribute("task", tasklist);
		
		return "/mypage/mypost";
	}
}
