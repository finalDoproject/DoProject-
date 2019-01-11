package com.kh.dp.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.dp.member.model.vo.Member;

public class SignincheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인 후 뒤로가기 막기
		
				HttpSession session = request.getSession();
				
				Member m = (Member)session.getAttribute("member");
				
				if(m != null ) {
								
					request.setAttribute("loc", "/");
					request.setAttribute("msg", "이미 로그인된 사용자입니다.");
					request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
					.forward(request, response);
					
					return false;
				}
				
				return super.preHandle(request, response, handler);
				
		}
}
