package com.koreait.webboard.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	private boolean isAjaxRequest(HttpServletRequest request) {
		String header = request.getHeader("AJAX");
		if(header != null) {
			if (header.equals("true")) return true;
			else return false;
		}
		
		return false;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//preHandle은 컨트롤러로 요청이 보내지기전에 수행되는 메서드
		
		HttpSession session = request.getSession();
		
		//세션에 저장된 user정보를 획득 (로그인 정보가 존재하는지)
		Object obj = session.getAttribute("user");
		
		if(obj == null) { // 로그인이 되어있지 않은 상태
			if(isAjaxRequest(request)) { // Intercepter로 들어온 요청이 Ajax요청인지 검사
				response.sendError(404);
				return false;
			} else {
				response.sendRedirect("/WebBoard/login");
				return false;
			}
		}
		return true; // 조건문에 걸리지않으면 (로그인 상태이면) 컨트롤러에 요청정보를 전송하게 됨
	}
	
	//postHandle은 컨트롤러에 요청이 전송되어 컨트롤러메서드가 수행된 후 화면이 보여지기 전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
