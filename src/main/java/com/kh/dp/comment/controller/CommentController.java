package com.kh.dp.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dp.comment.model.service.CommentService;
import com.kh.dp.comment.model.vo.TaskComment;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/comment/insertcomment.do")
	public String insertComment(TaskComment tc) {
		System.out.println("tc : " + tc);
		int result = commentService.insertComment(tc);
		
		String msg = "";
		if(result > 0) {
			msg="댓글 작성 완료!";
		}else {
			msg="댓글 작성 실패";
		}
		
		return "common/msg";
	}
	

}
