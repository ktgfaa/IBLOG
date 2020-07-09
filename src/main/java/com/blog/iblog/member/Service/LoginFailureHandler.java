package com.blog.iblog.member.Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginFailureHandler.class);
	
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		logger.info("onAuthenticationFailure 실행");
		HttpSession session = request.getSession();
        if(exception instanceof BadCredentialsException) {
        	logger.info("BadCredentialsException 실행");
        	session.setAttribute("result", "loginFailed");
        } else if(exception instanceof InternalAuthenticationServiceException) {
        	logger.info("InternalAuthenticationServiceException 실행");
        	session.setAttribute("result", "loginFailed");
        } else if(exception instanceof DisabledException) {
        	logger.info("DisabledException 실행");
        	session.setAttribute("result", "Disabled");
        } 

        request.getRequestDispatcher("/member/loginForm.do").forward(request, response);
		
	}

	
	

}
