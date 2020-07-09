package com.blog.iblog.member.Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.blog.iblog.member.dao.MemberDAO;
import com.blog.iblog.member.vo.MemberVO;
import com.blog.iblog.mypage.dao.MypageDAO;
import com.blog.iblog.mypage.vo.IblogInfoVO;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	private String loginidname;
	private String defaultUrl;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String username = authentication.getName();
		System.out.println("user id : " + username);
		System.out.println("user islogon : " + authentication.isAuthenticated());
		MemberVO member = memberDAO.getuserID(username);
		IblogInfoVO iblogInfoVO = mypageDAO.iblogInfo(username);
		HttpSession session = request.getSession();
		session.setAttribute("member", member);
		if(iblogInfoVO ==null) {
			session.setAttribute("iblogInfoVO", "none");
		} else {
			session.setAttribute("iblogInfoVO", iblogInfoVO);
		}
		session.setAttribute("isLogon", authentication.isAuthenticated());
		//에러 세션 지우기
		clearAuthenticationAttributes(request);
		
		//Redirect URL 작업
		resultRedirectStrategy(request, response, authentication);
		
	}
	
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session==null) return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		if(savedRequest!=null) {
			logger.info("권한이 필요한 페이지에 접근했을 경우");
			useSessionUrl(request, response);
		} else {
			logger.info("직접 로그인 url로 이동했을 경우");
			useDefaultUrl(request, response);
		}
		
	}
	
	protected void useSessionUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String targetUrl = savedRequest.getRedirectUrl();
		redirectStratgy.sendRedirect(request, response, targetUrl);
	}
	
	protected void useDefaultUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		redirectStratgy.sendRedirect(request, response, "/main.do");
	}

	public String getLoginidname() {
		return loginidname;
	}

	public void setLoginidname(String loginidname) {
		this.loginidname = loginidname;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

}
