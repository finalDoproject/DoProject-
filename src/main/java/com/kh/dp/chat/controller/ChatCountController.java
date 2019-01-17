package com.kh.dp.chat.controller;

import java.util.ArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.kh.dp.chat.model.service.ChatService;
import com.kh.dp.member.model.vo.Member;
import com.kh.dp.project.model.vo.Project;

@Controller
public class ChatCountController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/countSSE")
	public ResponseBodyEmitter handleRequest(HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		Project p = (Project)session.getAttribute("project");
		@SuppressWarnings("unchecked")
		ArrayList<Member> list = (ArrayList<Member>)session.getAttribute("secondList");

		final SseEmitter emitter = new SseEmitter();
		ExecutorService service = Executors.newSingleThreadExecutor();
		service.execute(() -> {
			for(int i = 0; i < 500; i++) {
				try {
					String ptm = chatService.selectOneChatPtm(m.getNickName(), p.getPno());
					emitter.send("p"+p.getPno()+":"+ptm, MediaType.TEXT_PLAIN);
					String mtm = null;
					for(Member you : list) {
						if(m.getMno() != you.getMno()) {
							mtm = chatService.selectOneChatMtm(m.getNickName(), p.getPno(), m.getMno(), you.getMno());
							emitter.send("m"+you.getMno()+":"+mtm, MediaType.TEXT_PLAIN);
						}
					}
					Thread.sleep(200);
				} catch(Exception e) {
					e.printStackTrace();
					emitter.completeWithError(e);
					return;
				}
			}
			emitter.complete();
		});
		return emitter;
	}
	
}
