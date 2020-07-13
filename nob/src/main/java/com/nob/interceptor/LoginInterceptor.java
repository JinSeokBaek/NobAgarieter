package com.nob.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final String LOGIN="login";
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session=request.getSession();
		ModelMap modelMap=modelAndView.getModelMap();
		Object userVO=modelMap.get("userVO");
		logger.info((String)modelMap.get("msg"));
		if(userVO!=null) {
			logger.info("Login Success");
			session.setAttribute(LOGIN, userVO);
			Object dest=session.getAttribute("dest");
			logger.info((String)dest);
			response.sendRedirect(dest!=null?(String)dest:"/");
		}
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		if(session.getAttribute(LOGIN)!=null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
}
