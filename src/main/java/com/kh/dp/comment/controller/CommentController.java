package com.kh.dp.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dp.comment.model.service.CommentService;
import com.kh.dp.comment.model.vo.TaskComment;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/comment/insertcomment.do")
	public String insertComment(TaskComment tc, Model model, @RequestParam int pno, @RequestParam int mno ) {
		System.out.println("tc : " + tc);
		System.out.println("pno in comment ? : " + pno);
		System.out.println("mno in comment ? : " + mno);
		int result = commentService.insertComment(tc);
		String msg = "";
		String loc = "";
		
		if(result > 0) {
			msg="댓글 작성 완료!";
			loc="/project/projectPage.do?pno="+pno+"&mno="+mno;
		}else {
			msg="댓글 작성 실패";
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		
		return "/project/projectPage.do?pno=" + pno + "&mno=" + mno;
	}
}
