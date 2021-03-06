package com.blog.iblog.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.iblog.member.Service.MemberService;
import com.blog.iblog.member.Service.UserDetailsServiceImp;
import com.blog.iblog.member.dao.MemberDAO;
import com.blog.iblog.member.mailService.MailService;
import com.blog.iblog.member.vo.AddMemberVO;
import com.blog.iblog.member.vo.MemberCerVO;
import com.blog.iblog.member.vo.MemberPolisyVO;
import com.blog.iblog.member.vo.MemberVO;

@Controller("memberController")
public class MemberController {

	@Autowired
	private MailService mailService;

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberVO memberVO = new MemberVO();

	private String num = "";

	private PasswordEncoder passwordEncoder;

	@Autowired
	private UserDetailsServiceImp userDetailsServiceImp;

	// 회원가입 하기
	@RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") AddMemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = memberService.addMember(member);
		ModelAndView mav = new ModelAndView();
		if (result == 1) {
			mav.setViewName("redirect:/member/loginForm.do");
		} else if (result == 0) {
			mav.setViewName("redirect:/main.do");
		}
		return mav;
	}

	// 본인 확인후 다음페이지 넘어가기
	@RequestMapping(value = "/member/cer_conNext.do", method = RequestMethod.POST)
	public ModelAndView cer_conNext(@ModelAttribute("cer") MemberCerVO memberCerVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String userEmail = memberCerVO.getUserEmail();
		String cerResult = memberCerVO.getCerResult();

		if (cerResult.equals("yes")) {
			mav.addObject("cerResult", cerResult);
			mav.addObject("userEmail", userEmail);
			mav.setViewName("redirect:/member/joinForm.do");
		} else {
			mav.setViewName("redirect:/member/TOSForm.do");
		}

		return mav;
	}

	// 이메일 인증 체크
	@RequestMapping(value = "/member/certification2.do", method = RequestMethod.POST)
	public ModelAndView certification2(@RequestParam(value = "confirm", required = false) String confirm,
			@RequestParam(value = "id", required = false) String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("num : " + num);
		System.out.println("confirm : " + confirm);
		System.out.println(" : " + id);
		if (confirm.equals(num)) {
			if (id == null) {
				mav.addObject("cer_result", "true");
				mav.setViewName("redirect:/member/identityForm.do");
			} else {
				mav.addObject("EnableResult", "succese");
				mav.addObject("id", id);
				mav.setViewName("redirect:/member/idEnableForm.do");
			}

		} else {
			if (id == null) {
				mav.setViewName("redirect:/member/TOSForm.do");
			} else {
				mav.setViewName("redirect:/member/idEnableForm.do?EnableResult=email_Cer&id=" + id);
			}
		}

		return mav;
	}

	// 이메일 인증 이메일 보내기
	@RequestMapping(value = "/member/certification.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView email_certification(@ModelAttribute("certification") MemberCerVO memberCerVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		session.removeAttribute("userEmail");
		ModelAndView mav = new ModelAndView();

		String userEmail = memberCerVO.getEmail();
		int count = memberDAO.emailcheck(userEmail);
		String emailmessage = null;

		if (count == 1) {
			emailmessage = "false";
		} else if (count == 0) {
			for (int i = 0; i < 10; i++) {

				double dValue = Math.random();

				int iValue = (int) (dValue * 10);

				num += Integer.toString(iValue);

			}

			StringBuffer sb = new StringBuffer();
			sb.append("<html><head>");
			sb.append("<meta http-equiv='content-Type' content='text/html;charset=euc-kr'>");
			sb.append("</head><body>");
			sb.append("<img src='http://192.168.123.11:8080/iblog/resources/image/logo/Mainlogo4.png'/><br>");
			sb.append("<h1>안녕하세요!! IBLOG 입니다</h1><br>");
			sb.append("<h2>인증번호</h2>" + "<h1 style='color:red;'>" + num + "</h1>" + " <h2>입니다.</h2><br>");
			sb.append("</body></html>");
			String str = sb.toString();
			mailService.certificationMail(userEmail, "메일 인증", str);
			emailmessage = "true";
			session.setAttribute("userEmail", userEmail);

		}

		mav.addObject("emailMessage", emailmessage);
		mav.setViewName("redirect:/member/identityForm.do");
		return mav;
	}

	// 아이디 중복확인
	@RequestMapping(value = "/member/idCheck.do", method = RequestMethod.POST)
	public ModelAndView idcheck(@ModelAttribute("check") MemberCerVO memberCerVO, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		int count = 0;
		HttpSession session = request.getSession();

		if (memberCerVO.getId() == null || memberCerVO.getId() == "") {
			session.setAttribute("idcheckresult", "no");
			mav.addObject("cerResult", "yes");
			mav.setViewName("redirect:/member/joinForm.do");
		} else {
			String userid = memberCerVO.getId();
			count = memberService.idcheck(userid);
			if (count == 1) {
				session.setAttribute("idcheckresult", "false");
				mav.addObject("cerResult", "yes");
			} else if (count == 0) {
				session.setAttribute("idcheckresult", "true");
				mav.addObject("cerResult", "yes");
				session.setAttribute("userid", userid);
			}

			mav.setViewName("redirect:/member/joinForm.do");
		}
		return mav;
	}

	// 계정 활성화 풀기
	@RequestMapping(value = "/member/idEnabled.do", method = RequestMethod.POST)
	public ModelAndView idEnabled(@ModelAttribute("idEnabled") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		memberService.enabledUpdate(member.getUsername());

		ModelAndView mav = new ModelAndView("redirect:/member/loginForm.do");
		return mav;
	}

	// 계정 활성화 인증받기
	@RequestMapping(value = "/member/idEnabled_check.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView idEnabled_check(@ModelAttribute("idEnabled_check") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		session.removeAttribute("EnableResult");
		ModelAndView mav = new ModelAndView();

		memberVO = (MemberVO) userDetailsServiceImp.loadUserByUsername(member.getId());

		if (memberVO == null) {
			rAttr.addAttribute("EnableResult", "idfailed");
			mav.setViewName("redirect:/member/idEnableForm.do");
		} else {
			setUp();
			boolean pwdMatch = passwordEncoder.matches(member.getPwd(), memberVO.getPassword());

			if (memberVO != null && pwdMatch == true) {
				if (memberVO.isEnabled() == true) {
					rAttr.addAttribute("EnableResult", "enfailed");
					mav.setViewName("redirect:/member/idEnableForm.do");
				} else {
					for (int i = 0; i < 10; i++) {

						double dValue = Math.random();

						int iValue = (int) (dValue * 10);

						num += Integer.toString(iValue);
					}
					String userEmail = memberDAO.emailsearch(memberVO.getUsername());
					System.out.println(userEmail);
					StringBuffer sb = new StringBuffer();
					sb.append("<html><head>");
					sb.append("<meta http-equiv='content-Type' content='text/html;charset=euc-kr'>");
					sb.append("</head><body>");
					sb.append("<img src='http://192.168.123.11:8080/iblog/resources/image/logo/Mainlogo4.png'/><br>");
					sb.append("<h1>안녕하세요!! IBLOG 입니다</h1><br>");
					sb.append("<h2>인증번호</h2>" + "<h1 style='color:red;'>" + num + "</h1>" + " <h2>입니다.</h2><br>");
					sb.append("</body></html>");
					String str = sb.toString();
					mailService.certificationMail(userEmail, "메일 인증", str);
					rAttr.addAttribute("EnableResult", "email_Cer");
					rAttr.addAttribute("id", memberVO.getUsername());
					mav.setViewName("redirect:/member/idEnableForm.do");
				}
			} else {
				rAttr.addAttribute("EnableResult", "pwdfailed");
				mav.setViewName("redirect:/member/idEnableForm.do");
			}
		}
		return mav;
	}

	// 계정 활성화 폼
	@RequestMapping(value = "/member/idEnableForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView idEnableForm(@RequestParam(value = "EnableResult", required = false) String EnableResult,
			@RequestParam(value = "id", required = false) String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("EnableResult", EnableResult);
		mav.addObject("id", id);

		return mav;
	}

	// 본인 인증 폼
	@RequestMapping(value = "/member/identityForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView identityForm(@RequestParam(value = "emailMessage", required = false) String emailMessage,
			@RequestParam(value = "total_val", required = false) String total_val,
			@RequestParam(value = "cer_result", required = false) String cer_result, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// String viewName = getViewName(request);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("emailMessage", emailMessage);
		mav.addObject("cer_result", cer_result);

		// 이용약관 안했을시 , 이메일 보냈을때, 인증 할때 경우의수
		if (total_val == null) {
			if (emailMessage == null) {
				emailMessage = "null";
			} else if (emailMessage.equals("true") || emailMessage.equals("false")) {
				mav.addObject("total_val", "yes");
			}

			if (cer_result == null) {
				cer_result = "null";
			} else if (cer_result.equals("true")) {
				mav.addObject("total_val", "yes");
			}
		} else if (total_val.equals("yes")) {
			mav.addObject("total_val", total_val);
		}

		mav.setViewName(viewName);
		return mav;
	}

	// 아이디 찾기 폼
	@RequestMapping(value = "/member/idSearchForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView idSearchForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		return mav;
	}

	// 회원가입폼
	@RequestMapping(value = "/member/joinForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView joinForm(@RequestParam(value = "cerResult", required = false) String cerResult,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		String userEmail = (String) session.getAttribute("userEmail");
		String userid = (String) session.getAttribute("userid");
		String idcheckresult = (String) session.getAttribute("idcheckresult");
		session.removeAttribute("userid");
		session.removeAttribute("idcheckresult");
		ModelAndView mav = new ModelAndView();

		if (cerResult == null) {
			mav.setViewName("redirect:/member/TOSForm.do");
		} else if (cerResult.equals("yes")) {
			mav.addObject("userEmail", userEmail);
			mav.addObject("cerResult", cerResult);
			mav.addObject("userid", userid);
			mav.addObject("idcheckresult", idcheckresult);
			mav.setViewName(viewName);
		}
		return mav;
	}

	// 이용약관 동의 한 후 다음페이지 넘어가기
	@RequestMapping(value = "/member/join_polisy.do", method = RequestMethod.POST)
	public ModelAndView joinPolisy(@ModelAttribute("polisy") MemberPolisyVO memberPolisyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String total_val = memberPolisyVO.getTotal_val();
		String service_val = memberPolisyVO.getService_val();
		String info_val = memberPolisyVO.getInfo_val();

		if (total_val.equals("yes") && service_val.equals("yes") && info_val.equals("yes")) {
			mav.addObject("total_val", total_val);
			mav.setViewName("redirect:/member/identityForm.do");
		} else {
			mav.setViewName("redirect:/member/TOSForm.do");
		}

		return mav;
	}

	// 로그인 폼
	@RequestMapping(value = "/member/loginForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginForm(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogon");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	// 비밀번호 찾기 폼
	@RequestMapping(value = "/member/pwdSearchForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView pwdSearchForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		return mav;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/member/pwdsendMail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView pwdsendMail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		ModelAndView mav = new ModelAndView();

		String useremail = request.getParameter("useremail");
		String userid = request.getParameter("userid");
		String userid2 = memberService.idsearch(useremail);

		String emailmessage = null;

		if (userid.equals(userid2)) {
			String userpwd = memberService.pwdsearch(useremail, userid);

			StringBuffer sb = new StringBuffer();
			sb.append("<html><head>");
			sb.append("<meta http-equiv='content-Type' content='text/html;charset=euc-kr'>");
			sb.append("</head><body>");
			sb.append("<img src='http://192.168.123.11:8080/iblog/resources/image/logo/Mainlogo4.png'/><br>");
			sb.append("<h1>안녕하세요!! IBLOG 입니다</h1><br>");
			sb.append("<h2>귀하의 임의 비밀번호는</h2>" + "<h1 style='color:red;'>" + userpwd + "</h1>" + " <h2>입니다.</h2><br>");
			sb.append("<strong>변경된 임시 비밀번호로 로그인 한 후 변경 해주세요!!</strong><br>");
			sb.append("<a href='http://192.168.123.11:8080/iblog/member/loginForm.do'>로그인 하러가기</h1>");
			sb.append("</body></html>");
			String str = sb.toString();
			mailService.pwdsendMail(useremail, "비밀번호 찾기", str);

			emailmessage = "true";
			mav.addObject("emailMessage", emailmessage);

		} else {
			emailmessage = "false";
			mav.addObject("emailMessage", emailmessage);
		}
		mav.setViewName("redirect:/member/loginForm.do");
		return mav;
	}

	// 아이디 찾기
	@RequestMapping(value = "/member/sendMail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView sendSimpleMail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		ModelAndView mav = new ModelAndView();
		String useremail = request.getParameter("email");
		String userid = memberService.idsearch(useremail);

		String emailmessage = null;

		if (userid != null) {
			StringBuffer sb = new StringBuffer();
			sb.append("<html><head>");
			sb.append("<meta http-equiv='content-Type' content='text/html;charset=euc-kr'>");
			sb.append("</head><body>");
			sb.append("<img src='http://192.168.123.11:8080/iblog/resources/image/logo/Mainlogo4.png'/><br>");
			sb.append("<h1>안녕하세요!! IBLOG 입니다</h1><br>");
			sb.append("<h2>귀하의 id는</h2>" + "<h1 style='color:red;'>" + userid + "</h1>" + " <h2>입니다.</h2><br>");
			sb.append("<strong>보안상 받으신 메일은 삭제를 권장드립니다!!!</strong><br>");
			sb.append("<a href='http://192.168.123.11:8080/iblog/member/loginForm.do'>로그인 하러가기</h1>");
			sb.append("</body></html>");
			String str = sb.toString();
			mailService.sendMail(useremail, "아이디 찾기", str);
			emailmessage = "true";
			mav.addObject("emailMessage", emailmessage);

		} else {
			emailmessage = "false";
			mav.addObject("emailMessage", emailmessage);
		}

		mav.setViewName("redirect:/member/loginForm.do");
		return mav;
	}

	public void setUp() throws Exception {
		passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

	// 약간 동의 폼
	@RequestMapping(value = "/member/TOSForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView TOSForm(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// String viewName = getViewName(request);
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

}
