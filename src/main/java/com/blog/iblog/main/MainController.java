package com.blog.iblog.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.blog.iblog.member.vo.MemberVO;

@Controller("mainController")
public class MainController {


	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String memDel = (String)session.getAttribute("memDel");
		session.removeAttribute("memDel");
		if(memDel == null) {
			mav.addObject("memDel", "null");
		} else if(memDel.equals("ok")) {
			mav.addObject("memDel", memDel);
			session.removeAttribute("member");
			session.removeAttribute("isLogon");
		} else if(memDel.equals("no")) {
			mav.addObject("memDel", memDel);
		} 
		mav.setViewName(viewName);
		return mav;
	}
	
	
}
