package com.blog.iblog.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class AccessDeniedForm {
	
	@RequestMapping(value= "/accessDeniedForm.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView accessDeniedForm(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

}
