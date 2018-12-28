package com.kh.dp.intro.board.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dp.common.util.Utils;
import com.kh.dp.intro.board.model.service.BoardService;
import com.kh.dp.intro.board.model.vo.Board;

@Controller
public class HelpController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/intro/board/help.do")
	public String selecthelpList(@RequestParam(value="cPage", required=false, defaultValue="1")
									int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(boardService.selectHelpList(cPage, numPerPage));
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = boardService.selectHelpTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "help.do");
		
		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
				
		return "/intro/help/help";
	}
	
	
	@RequestMapping("/intro/board/helpDetail.do")
	public String helpDetailView(@RequestParam int bno, Model model) {
		
		model.addAttribute("board", boardService.selectOneHelp(bno));
		
		return "/intro/help/helpDetail";
	}
	
	@RequestMapping("/intro/board/insertHelpView.do")
	public String helpInsertFormView() {
		
		return "/intro/help/helpForm";
	}
	
	@RequestMapping("/intro/board/insertHelp.do")
	public String insertHelp(Board board, Model model) {
		
		int result;
		

			result= boardService.insertHelp(board);

		
		String loc = "/intro/help/help";
		String msg = "";
		
		if(result > 0 ) {
			msg="고객센터글 등록 성공";
			loc = "/intro/board/helpDetail.do?bno="+board.getBno();
		}else {
			msg="고객센터글 등록 실패";
		}
		
		model.addAttribute("loc" , loc)
		.addAttribute("msg" , msg);
		
		
		return "common/msg";
	}
	
	@RequestMapping("/intro/board/updateHelpView.do")
	public String updateHelpView(@RequestParam int bno, Model model) {
		
		model.addAttribute("board", boardService.selectOneHelp(bno));
		
		return "/intro/help/helpUpdateView";
	}
	
	@RequestMapping("/intro/board/updateHelp.do")
	public String updateHelp(Board board, Model model ) {
		
		int result = boardService.updateHelp(board);
		

		String loc = "/intro/help/help";
		String msg = "";
		
		if(result > 0) {
			msg="고객센터 글 수정 성공";
			loc ="/intro/board/helpDetail.do?bno="+ board.getBno();
		}else {
			msg = "고객센터 글 수정 실패";
		}

		model.addAttribute("loc" , loc)
		.addAttribute("msg" , msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/intro/board/deleteHelp.do")
	public String deleteHelp(@RequestParam int bno, Model model) {
		
		int result = boardService.deleteHelp(bno);
		
		String loc = "/intro/help/help";
		String msg = "";
		
		if(result > 0) {
			msg="고객센터 글 삭제 성공";
			loc ="/intro/board/help.do";
		}else {
			msg = "고객센터 글 삭제 실패";
		}

		model.addAttribute("loc" , loc)
		.addAttribute("msg" , msg);
		
		return "common/msg";
	}
	
}

