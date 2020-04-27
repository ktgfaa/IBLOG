package com.blog.iblog.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.iblog.member.Service.MemberService;
import com.blog.iblog.member.vo.MemberVO;

@Controller("memberController")
public class MemberController extends MultiActionController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberVO memberVO = new MemberVO();
	
	@RequestMapping(value= "/member/*Form.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView loginForm(@RequestParam(value="result", required=false) String result,
			@RequestParam(value="action", required=false) String action, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogon", true);
			String action = (String)session.getAttribute("action");
			session.removeAttribute("action");
			if(action !=null) {
				mav.setViewName("redirect" + action);
			} else {
				mav.setViewName("redirect:/main.do");
			}
		} else {
			rAttr.addAttribute("result","loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}
	
	 
	
}
