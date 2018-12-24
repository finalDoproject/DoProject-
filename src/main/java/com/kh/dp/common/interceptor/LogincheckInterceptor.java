package com.kh.dp.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.dp.member.model.vo.Member;

public class LogincheckInterceptor extends HandlerInterceptorAdapter{
	
	private Logger logger = 
			LoggerFactory.getLogger(LogincheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		// 사용자 로그인 확인 후 알람 띄우기
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("member");
		
		if(m == null) {
			logger.info("비 로그인 상태에서["+request.getRequestURI()+"]로 접근하였습니다!");
			
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 후 이용 가능한 서비스 입니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
}
