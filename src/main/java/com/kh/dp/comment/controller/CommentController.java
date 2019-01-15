package com.kh.dp.comment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dp.comment.model.service.CommentService;
import com.kh.dp.comment.model.vo.TaskComment;
import com.kh.dp.member.model.service.MemberService;
import com.kh.dp.member.model.vo.Attachment;
import com.kh.dp.member.model.vo.Member;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/comment/insertcomment.do", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> insertComment(@RequestParam int pno, @RequestParam int mno,
			@RequestParam String ccontent, @RequestParam int ctno) {
		
		TaskComment tc = new TaskComment();
		tc.setCcontent(ccontent);
		tc.setCtno(ctno);
		tc.setCwriter(mno);
		System.out.println("tc : " + tc);
		int result = commentService.insertComment(tc);

		String msg = "댓글 작성 중";
		Attachment a = memberService.selectAttach(mno);
		
		Member m = memberService.selectOne(mno);
		Map<String, Object> hmap = new HashMap<>();
		hmap.put("comment", tc);
		hmap.put("img", a);
		hmap.put("m", m);
		
		
		return hmap;
	}
	
	@RequestMapping("/comment/deletecomment.do")
	public String deleteComment(@RequestParam int cno,@RequestParam int mno,@RequestParam int pno, Model model) {
		int result = commentService.deleteComment(cno);
		
		String msg = ""; 
		String loc = "";
		if(result >0) {
			msg = "댓글 삭제 완료";
			loc ="/project/projectPage.do?mno="+ mno +"&pno=" + pno;
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
}
