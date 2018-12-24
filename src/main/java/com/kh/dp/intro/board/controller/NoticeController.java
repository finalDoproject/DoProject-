package com.kh.dp.intro.board.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dp.common.util.Utils;
import com.kh.dp.intro.board.model.service.BoardService;
import com.kh.dp.intro.board.model.vo.Board;

@Controller
public class NoticeController {
	
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/intro/board/notice.do")
	public String selectNoticeList(@RequestParam(value="cPage", required=false, defaultValue="1")
									int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(boardService.selectNoticeList(cPage, numPerPage));
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = boardService.selectNoticeTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "notice.do");
		
		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
				
		return "/intro/notice/notice";
	}
	
	
	@RequestMapping("/intro/board/noticeDetail.do")
	public String NoticeDetailView(@RequestParam int bno, Model model) {
		
		Board b = boardService.selectOneNotice(bno);
		System.out.println("b : " + b);
		
		model.addAttribute("board", boardService.selectOneNotice(bno));
		
		return "/intro/notice/noticeDetail";
	}
	
	@RequestMapping("/intro/board/insertNoticeView.do")
	public String NoticeInsertFormView() {
		
		return "/intro/notice/noticeForm";
	}
	
	@RequestMapping("/intro/board/insertNotice.do")
	public String insertNotice(Board board, Model model) {
		
		int result;
		

			result= boardService.insertNotice(board);

		
		String loc = "/intro/notice/notice";
		String msg = "";
		
		if(result > 0 ) {
			msg="공지사항글 등록 성공";
			loc = "/intro/board/noticeDetail.do?bno="+board.getBno();
		}else {
			msg="공지사항글 등록 실패";
		}
		
		model.addAttribute("loc" , loc)
		.addAttribute("msg" , msg);
		
		
		return "common/msg";
	}
	
	@RequestMapping("/intro/board/updateNoticeView.do")
	public String updateNoticeView(@RequestParam int bno, Model model) {
		
		model.addAttribute("board", boardService.selectOneNotice(bno));
		
		return "/intro/notice/noticeUpdateView";
	}
	
	@RequestMapping("/intro/board/updateNotice.do")
	public String updateNotices(Board board, Model model ) {
		
		int result = boardService.updateNotice(board);
		

		String loc = "/intro/notice/notice";
		String msg = "";
		
		if(result > 0) {
			msg="공지사항 글 수정 성공";
			loc ="/intro/board/noticeDetail.do?bno="+ board.getBno();
		}else {
			msg = "공지사항 글 수정 실패";
		}

		model.addAttribute("loc" , loc)
		.addAttribute("msg" , msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/intro/board/deleteNotice.do")
	public String deleteNotice(@RequestParam int bno, Model model) {
		
		int result = boardService.deleteNotice(bno);
		
		String loc = "/intro/notice/notice";
		String msg = "";
		
		if(result > 0) {
			msg="공지사항 글 삭제 성공";
			loc ="/intro/board/notice.do";
		}else {
			msg = "공지사항 글 삭제 실패";
		}

		model.addAttribute("loc" , loc)
		.addAttribute("msg" , msg);
		
		return "common/msg";
	}
	
}
