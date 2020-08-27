package com.blog.iblog.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.blog.iblog.member.Service.MemberService;
import com.blog.iblog.member.dao.MemberDAO;
import com.blog.iblog.member.vo.MemberVO;
import com.blog.iblog.mypage.dao.MypageDAO;
import com.blog.iblog.mypage.service.MypageService;
import com.blog.iblog.mypage.vo.IblogInfoVO;
import com.blog.iblog.mypage.vo.Iblog_categoryVO;
import com.blog.iblog.mypage.vo.WriteInfoVO;

@Controller("mypageController")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	MemberService memberService;

	@Autowired
	MypageDAO mypageDAO;

	@Autowired
	MypageService mypageService;

	private PasswordEncoder passwordEncoder;

	// 카테고리 추가
	@RequestMapping(value = "/mypage/addCategory.do", method = RequestMethod.POST)
	public ModelAndView addCategory(@ModelAttribute("iblog_categoryVO") Iblog_categoryVO iblog_categoryVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mypageService.addCategory(iblog_categoryVO);

		mav.setViewName("redirect:/mypage/iblogfixForm.do");
		return mav;
	}

	// 글 추가
	@RequestMapping(value = "/mypage/addWrite.do", method = RequestMethod.POST)
	public ModelAndView addWrite(@ModelAttribute("WriteInfoVO") WriteInfoVO writeInfoVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("addWrite 실행");
		ModelAndView mav = new ModelAndView();
		String write_description = writeInfoVO.getWrite_description().replaceAll(" ", "");
		write_description = write_description.replaceAll("\\p{Z}", "");
		int result = mypageDAO.selectbyWriteAdr(writeInfoVO.getId());
		
		if (result == 0) {
			writeInfoVO.setWrite_address("1");
		} else {
			writeInfoVO.setWrite_address(Integer.toString(result + 1));
		}

		mypageService.addWrite(writeInfoVO);

		mav.setViewName("redirect:/mypage/mypageForm.do");
		return mav;
	}

	// 글쓰기 폼
	@RequestMapping(value = "/mypage/addWriteForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("addWriteForm 실행");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		List<Map<String, String>> main_category = mypageDAO.selectbyMainCategory(member.getUsername());
		List<Map<String, String>> sub_category = mypageDAO.selectbySubCategory(member.getUsername());
		@SuppressWarnings("unchecked")
		List<Map<String, String>> sub_cw = (List<Map<String, String>>) session.getAttribute("sub_cw");
		
		String main_value = (String) session.getAttribute("main_value");
		session.removeAttribute("sub_cw");
		session.removeAttribute("main_value");
		
		if (main_category == null) {
			session.setAttribute("write_main_category", "none");
		} else {
			session.setAttribute("write_main_category", main_category);
		}

		if (sub_category == null) {
			session.setAttribute("write_sub_category", "none");
		} else {
			session.setAttribute("write_sub_category", sub_category);
		}

		if (sub_cw == null) {
			mav.addObject("sub_cw", "none");
		} else {
			mav.addObject("sub_cw", sub_cw);
		}
		
		if (main_value == null) {
			mav.addObject("main_value", "none");
		} else {
			mav.addObject("main_value", main_value);
		}
		
		mav.setViewName(viewName);
		return mav;
	}

	// 카테고리 삭제
	@RequestMapping(value = "/mypage/delCategory.do", method = RequestMethod.POST)
	public ModelAndView delCategory(@ModelAttribute("iblog_categoryVO") Iblog_categoryVO iblog_categoryVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("delCategory 실행");
		ModelAndView mav = new ModelAndView();
		System.out.println("modelA id : " + iblog_categoryVO.getId());
		String result = mypageDAO.selectbySubCategoryNUm(iblog_categoryVO);
		mypageService.delWrite(result, iblog_categoryVO.getId());

		mypageService.delCategory(iblog_categoryVO);

		mav.setViewName("redirect:/mypage/iblogfixForm.do");
		return mav;
	}

	// 아이블로그 수정
	@RequestMapping(value = "/mypage/fixIblog.do", method = RequestMethod.POST)
	public ModelAndView fixIblog(@ModelAttribute("iblogInfoVO") IblogInfoVO iblogInfoVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("fixIblog 실행");
		ModelAndView mav = new ModelAndView();
		mypageService.updateIblog(iblogInfoVO);
		mav.setViewName("redirect:/mypage/iblogfixForm.do");
		return mav;
	}

	// 아이블로그 관리 폼
	@RequestMapping(value = "/mypage/iblogfixForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView iblogfixForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("iblogfixForm 실행");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.removeAttribute("iblogInfoVO");
		MemberVO member = (MemberVO) session.getAttribute("member");
		IblogInfoVO iblogInfoVO = mypageDAO.iblogInfo(member.getUsername());
		List<Map<String, String>> categoryMainList = mypageDAO.selectbyMainCategory(member.getUsername());
		List<Map<String, String>> categorySubList = mypageDAO.selectbySubCategory(member.getUsername());
		if (categoryMainList == null) {
			System.out.println("categoryMainList null");
		} else {

			session.setAttribute("categoryMainList", categoryMainList);
			session.setAttribute("categorySubList", categorySubList);
		}
		session.setAttribute("iblogInfoVO", iblogInfoVO);
		mav.setViewName(viewName);
		return mav;
	}

	// 회원 탈퇴
	@RequestMapping(value = "/mypage/deleteMem.do", method = RequestMethod.POST)
	public ModelAndView memberDelCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("memberDelForm 실행");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		MemberVO member = (MemberVO) session.getAttribute("member");
		int result = memberDAO.deleteMember(member.getUsername());
		if (result == 1) {
			session.setAttribute("memDel", "ok");
			mav.setViewName("redirect:/main.do");
		} else {
			session.setAttribute("memDel", "no");
			mav.setViewName("redirect:/main.do");
		}
		return mav;
	}

	// 회원 탈퇴 비번 체크
	@RequestMapping(value = "/mypage/memberDelCheck.do", method = RequestMethod.POST)
	public ModelAndView memberDelCheck(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("memberDelForm 실행");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		setUp();

		MemberVO member = (MemberVO) session.getAttribute("member");
		String pwd = memberVO.getPassword();
		String pwd2 = memberDAO.pwdsearch(member.getUsername());

		boolean pwdMatch = passwordEncoder.matches(pwd, passwordEncoder.encode(pwd2));
		logger.info("pwdMatch : " + pwdMatch);

		if (pwdMatch) {
			mav.setViewName("redirect:/mypage/memberDelForm.do?delpas=now");
			session.setAttribute("delpas", "now");
		} else {
			mav.setViewName("redirect:/mypage/memberDelForm.do?delpas=x");
		}

		return mav;
	}

	// 회원 탈퇴 폼
	@RequestMapping(value = "/mypage/memberDelForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberDelForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("memberDelForm 실행");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String delpas = request.getParameter("delpas");
		String delpas2 = (String) session.getAttribute("delpas");
		session.removeAttribute("delpas");
		logger.info("delpas : " + delpas);
		if (delpas == null) {
			mav.addObject("delpas", "not");
		} else if (delpas2 == null && delpas.equals("x")) {
			mav.addObject("delpas", "x");
		} else if (delpas2 == null) {
			mav.addObject("delpas", "not");
		} else if (delpas.equals("now") && delpas2.equals("now")) {
			mav.addObject("delpas", delpas);
		} else if (delpas.equals("don") && delpas2.equals("don")) {
			mav.addObject("delpas", delpas);
		}

		mav.setViewName(viewName);
		return mav;
	}

	// 개인정보 폼
	@RequestMapping(value = "/mypage/myInfoForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myInfoForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("myInfoForm 실행");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String inPas = request.getParameter("inPas");
		String inPas2 = (String) session.getAttribute("inPas");
		session.removeAttribute("inPas");
		logger.info("inPas : " + inPas);
		if (inPas == null) {
			mav.addObject("inPas", "not");
		} else if (inPas2 == null && inPas.equals("x")) {
			mav.addObject("inPas", "x");
		} else if (inPas2 == null) {
			mav.addObject("inPas", "not");
		} else if (inPas.equals("now") && inPas2.equals("now")) {
			mav.addObject("inPas", inPas);
		} else if (inPas.equals("don") && inPas2.equals("don")) {
			mav.addObject("inPas", inPas);
		}
		mav.setViewName(viewName);
		return mav;
	}

	// 개인 정보 비번 체크
	@RequestMapping(value = "/mypage/myinfoPasCheck.do", method = RequestMethod.POST)
	public ModelAndView myinfoPasCheck(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("myinfoPasCheck 실행");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		setUp();

		MemberVO member = (MemberVO) session.getAttribute("member");
		String pwd = memberVO.getPassword();
		String pwd2 = memberDAO.pwdsearch(member.getUsername());

		boolean pwdMatch = passwordEncoder.matches(pwd, passwordEncoder.encode(pwd2));
		logger.info("pwdMatch : " + pwdMatch);

		if (pwdMatch) {
			mav.setViewName("redirect:/mypage/myInfoForm.do?inPas=now");
			session.setAttribute("inPas", "now");
		} else {
			mav.setViewName("redirect:/mypage/myInfoForm.do?inPas=x");
		}

		return mav;
	}

	// 개인 정보 수정
	@RequestMapping(value = "/mypage/myInfoUp.do", method = RequestMethod.POST)
	public ModelAndView myInfoUp(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("myInfoUp 실행");
		ModelAndView mav = new ModelAndView();
		memberDAO.meminfoUpdate(memberVO);

		mav.setViewName("redirect:/mypage/mypageForm.do");

		return mav;
	}

	// 마이페이지 폼
	@RequestMapping(value = "/mypage/mypageForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("mypageForm 실행");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		String PasSet = request.getParameter("PasSet");
		String PasSet2 = (String) session.getAttribute("PasSet");
		String myRank = "";

		session.removeAttribute("PasSet");
		logger.info("PasSet : " + PasSet);
		if (PasSet == null) {
			mav.addObject("PasSet", "not");
		} else if (PasSet2 == null && PasSet.equals("x")) {
			mav.addObject("PasSet", "x");
		} else if (PasSet.equals("yet")) {
			mav.addObject("PasSet", PasSet);
		} else if (PasSet2 == null) {
			mav.addObject("PasSet", "not");
		} else if (PasSet.equals("now") && PasSet2.equals("now")) {
			mav.addObject("PasSet", PasSet);
		} else if (PasSet.equals("don") && PasSet2.equals("don")) {
			mav.addObject("PasSet", PasSet);
		}

		MemberVO member = (MemberVO) session.getAttribute("member");

		session.removeAttribute("member");
		member = memberDAO.getuserID(member.getUsername());
		List<IblogInfoVO> ibloginfoVO = mypageDAO.selectbyblogcount_desc();
		for (int i = 0; i < ibloginfoVO.size(); i++) {
			System.out.println("ibloginfoVO.get(i).getId() : " + ibloginfoVO.get(i).getId());
			System.out.println("member.getId() : " + member.getId());
			if (ibloginfoVO.get(i).getId().equals(member.getId())) {
				myRank = Integer.toString(i + 1);
			}
		}
		session.setAttribute("member", member);
		System.out.println("myRank : " + myRank);
		mav.addObject("myRank", myRank);
		System.out.println(viewName);
		mav.setViewName(viewName);
		return mav;
	}

	// 새 블로그 만들기 액션
	@RequestMapping(value = "/mypage/newIblog.do", method = RequestMethod.POST)
	public ModelAndView newIblog(@ModelAttribute("iblogInfoVO") IblogInfoVO iblogInfoVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("newIblog 실행");
		ModelAndView mav = new ModelAndView();

		int result = mypageService.newIblog(iblogInfoVO);
		
		if (result == 1) {
			memberService.runblogUpdate("run", iblogInfoVO.getId());
		}

		mav.setViewName("redirect:/mypage/mypageForm.do");
		return mav;
	}

	// 새 블로그 만들기 폼
	@RequestMapping(value = "/mypage/newIblogMakeForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView newIblogMakeForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("newIblogMakeForm 실행");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 비밀번호 수정 확인
	@RequestMapping(value = "/mypage/passetCheck.do", method = RequestMethod.POST)
	public ModelAndView passetCheck(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("passetCheck 실행");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		setUp();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String pwd = memberVO.getPassword();
		String pwd2 = memberDAO.pwdsearch(member.getUsername());

		boolean pwdMatch = passwordEncoder.matches(pwd, passwordEncoder.encode(pwd2));
		logger.info("pwdMatch : " + pwdMatch);

		if (pwdMatch) {
			mav.setViewName("redirect:/mypage/mypageForm.do?PasSet=now");
			session.setAttribute("PasSet", "now");
		} else {
			mav.setViewName("redirect:/mypage/mypageForm.do?PasSet=x");
		}

		return mav;
	}

	public void setUp() throws Exception {
		passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

	// 비밀번호 수정
	@RequestMapping(value = "/mypage/updatePas.do", method = RequestMethod.POST)
	public ModelAndView updatePas(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("updatePas 실행");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		setUp();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String pwd = memberVO.getPassword();
		memberDAO.passwordUpdate(member.getUsername(), pwd);

		mav.setViewName("redirect:/mypage/mypageForm.do?PasSet=don");
		session.setAttribute("PasSet", "don");

		return mav;
	}

	// 서브 카테고리 변경
	@RequestMapping(value = "/mypage/writeCngSub.do", method = RequestMethod.POST)
	public ModelAndView writeCngSub(@ModelAttribute("iblog_categoryVO") Iblog_categoryVO iblog_categoryVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("writeCngSub 실행");
		ModelAndView mav = new ModelAndView();
		String cat_num = mypageDAO.selectbySubCategoryNum_write(iblog_categoryVO.getId(),
				iblog_categoryVO.getCategory_value().get(0));
		List<Map<String, String>> sub_category_write = mypageDAO.selectbySubCategory_write(iblog_categoryVO.getId(),
				cat_num);
		HttpSession session = request.getSession();
		session.setAttribute("sub_cw", sub_category_write);
		session.setAttribute("main_value", iblog_categoryVO.getCategory_value().get(0));
		System.out.println(sub_category_write.get(0).get("CATEGORY_NUM"));
		mav.setViewName("redirect:/mypage/addWriteForm.do");
		return mav;
	}

}
