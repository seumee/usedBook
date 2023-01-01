package com.book.usedbook.auto;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.book.usedbook.member.dto.MemberDTO;
import com.book.usedbook.member.service.MemberService;
import com.book.usedbook.session.MemberSession;

public class AutoLogin extends HandlerInterceptorAdapter implements MemberSession{
	@Autowired
	MemberService ms;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie loginCookie = WebUtils.getCookie(request, "bookLoginCookie");
		if(loginCookie != null) {
			MemberDTO dto = ms.getUserSessionId(loginCookie.getValue());
			if(dto != null) {
				request.getSession().setAttribute(LOGIN, dto.getId());
			}
		}
		return true;
	}
}