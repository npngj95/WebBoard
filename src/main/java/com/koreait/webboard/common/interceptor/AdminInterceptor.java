package com.koreait.webboard.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//preHandle은 컨트롤러로 요청이 보내지기전에 수행되는 메서드
		
		HttpSession session = request.getSession();
		
		//세션에 저장된 users정보를 획득 (로그인 정보가 존재하는지)
		Object obj = session.getAttribute("admin");
		
		if(obj == null) { // 로그인이 되어있지 않은 상태
			response.sendRedirect("/WebBoard/admin/login");
			return false;
		}
		return true; // 조건문에 걸리지않으면 (로그인 상태이면) 컨트롤러에 요청정보를 전송하게 됨
	}
	
}
