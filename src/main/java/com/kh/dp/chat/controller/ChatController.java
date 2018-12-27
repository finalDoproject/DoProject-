package com.kh.dp.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dp.chat.model.service.ChatService;
import com.kh.dp.project.model.vo.Project;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@RequestMapping(value="/chat.ch", method=RequestMethod.GET)
	public String selectProjectChatList(Model model) {	
		// 해당 프로젝트 번호 가져와 그 프로젝트 내의 채팅 내역 불러오기 | 처음 실행 화면
		// 프로젝트 번호
		int pno = 1;
		
		// 저장되있는 채팅 내용 불러오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(chatService.selectProjectChatList(pno));
		
		// 해당 프로젝트에 참여중인 회원 불러오기
		ArrayList<Map<String, String>> secondList =
				new ArrayList<Map<String, String>>(chatService.selectChatRoomList(pno));
		// 해당 프로젝트 불러오기
		Project p = chatService.selectProject(pno);
		
		model.addAttribute("list", list).addAttribute("secondList", secondList).addAttribute("project", p);
		
		System.out.println("list1 : " + list);
		System.out.println("list2 : " + secondList);
		System.out.println("project : " + p);
		
		return "chat/chat";
	}
	
	public String selectChatRoomList() {
		// 채팅 좌측부분 채팅방 리스트 출력용
		return "";
	}
	
	@RequestMapping(value="/chatOne.ch", method=RequestMethod.GET)
	public ModelAndView selectOneChatList(Model model,
			@RequestParam("chWriter") int chWriter,
			@RequestParam("chReader") int chReader) {
		ModelAndView mv = new ModelAndView();
		// 좌측 출력된 채팅방 클릭시 해당 채팅방의 내역 불러오기
		// 프로젝트 번호
		int pno = 1;

		// 저장되있는 채팅 내용 불러오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(chatService.selectOneChatList(pno, chWriter, chReader));
		
		mv.addObject("chatOneList", list);
		mv.setViewName("jsonView");
		System.out.println("ajax 채팅 : " + list);

		return mv;
	}
	
	public String insertChat() {
		// 채팅 기록 저장용
		return "";
	}
	
	public String selectSearchChatRoom() {
		// ajax 채팅방 리스트 검색용
		return "";
	}
	
}
