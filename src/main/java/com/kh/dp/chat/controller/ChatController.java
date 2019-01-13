package com.kh.dp.chat.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dp.chat.model.service.ChatService;
import com.kh.dp.chat.model.vo.ChatPtm;
import com.kh.dp.member.model.vo.Member;
import com.kh.dp.project.model.vo.Project;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@RequestMapping(value="/chat.ch", method=RequestMethod.GET)
	public String selectProjectChatList(Model model, HttpSession session, HttpServletRequest req,
			@RequestParam("pno") int pno) {	
		// 해당 프로젝트 번호 가져와 그 프로젝트 내의 채팅 내역 불러오기		
		Member m = (Member)req.getSession().getAttribute("member");
		
		if(m == null) {
			String msg = "로그인이 필요한 기능입니다.";
			model.addAttribute("msg", msg);
			return "common/closeMsg";
		} else {
		// 저장되있는 채팅 내용 불러오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(chatService.selectProjectChatList(pno));
		// 해당 프로젝트에 참여중인 회원 불러오기
		ArrayList<Map<String, String>> secondList =
				new ArrayList<Map<String, String>>(chatService.selectChatRoomList(pno));
		// 해당 프로젝트 불러오기
		Project p = chatService.selectProject(pno);
		model.addAttribute("list", list).addAttribute("secondList", secondList).addAttribute("project", p);
		session.setAttribute("project", p);

		return "chat/chat";
		}
		
	}
	
	@RequestMapping(value="/chatOne.ch", method=RequestMethod.GET)
	public ModelAndView selectOneChatList(Model model, HttpSession session, HttpServletRequest req,
			@RequestParam("chWriter") int chWriter,
			@RequestParam("chReader") int chReader,
			@RequestParam("pno") int pno) {
		ModelAndView mv = new ModelAndView();
		
		// 저장되있는 채팅 내용 불러오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(chatService.selectOneChatList(pno, chWriter, chReader));
		
		String renamedFileName = chatService.selectOneFileName(chReader);
		String yourName = chatService.selectOneYourName(chReader);
		
		mv.addObject("chatOneList", list).addObject("renamedFileName", renamedFileName).addObject("yourName", yourName);
		mv.setViewName("jsonView");

		return mv;
	}
	
	@RequestMapping(value="/chatProject.ch", method=RequestMethod.GET)
	public ModelAndView selectProject(Model model, @RequestParam("pno") int pno) {
		ModelAndView mv = new ModelAndView();
		
		// 저장되있는 채팅 내용 불러오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(chatService.selectProjectChatList(pno));

		mv.addObject("chatProjectList", list);
		mv.setViewName("jsonView");
		/*System.out.println("ajax 채팅 : " + list);*/
		
		return mv;
	}
	
	@RequestMapping(value="/lastChat.ch", method=RequestMethod.GET)
	public ModelAndView selectSearchChatRoom(Model model, @RequestParam("me") int me, @RequestParam("you") String you) {
		
		// ajax 채팅방 리스트 검색용
		ModelAndView mv = new ModelAndView();
		String str = "";
		System.out.println("you : " + you);
		if(you.contains("p") || you.charAt(0) == '0') {
			str = chatService.selectPtmLastChat(me, Integer.parseInt(you.substring(1)));
		}else {
			str = chatService.selectMtmLastChat(me, Integer.parseInt(you));
		}
		
		mv.addObject("str", str);
		mv.setViewName("jsonView");
		/*System.out.println("ajax 검색 : " + list);*/
		
		return mv;
	}
	
	@RequestMapping(value="/chatWho.ch", method=RequestMethod.GET)
	public ModelAndView selectWho(Model model,@RequestParam("me") int me) {
		
		ModelAndView mv = new ModelAndView();
		
		String yourName = chatService.selectOneYourName(me);
		
		mv.addObject("yourName", yourName);
		mv.setViewName("jsonView");

		return mv;
	}
	
	@RequestMapping(value="/countChatPtm.ch", method=RequestMethod.GET)
	public int countChatPtm(@RequestParam("mno") int mno, @RequestParam("pno") int pno) {
		return chatService.selectOneChatPtm(pno);
	}
	
}
