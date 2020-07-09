package com.blog.iblog.blog.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.blog.iblog.member.vo.MemberVO;
import com.blog.iblog.mypage.dao.MypageDAO;
import com.blog.iblog.mypage.service.MypageService;
import com.blog.iblog.mypage.vo.IblogInfoVO;
import com.blog.iblog.mypage.vo.WriteInfoVO;

@Controller("blogController")
public class BlogController {
	
	private static final Logger logger = LoggerFactory.getLogger(BlogController.class);
	
	@Autowired
	MypageDAO mypageDAO;
	
	@Autowired
	MypageService mypageService;
	
	// 자신 블로그 폼 불러오기
	@RequestMapping(value= "/**/blog.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView iblogMainForm(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("iblogMainForm 실행");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");	
		String[] array = viewName.split("/");
		String blogAddress = array[1];
		IblogInfoVO iblogVO = (IblogInfoVO)session.getAttribute("iblogbyAddress");
		
		
		logger.info(viewName + "1");
		if(iblogVO == null || !iblogVO.getBlogAddress().equals(blogAddress)) {
			logger.info(viewName + '2');
			IblogInfoVO iblogInfoVO = mypageDAO.iblogInfobyaddress(blogAddress);
			
			if(iblogInfoVO == null) {
				mav.setViewName("redirect:/main.do");
			} else {
				logger.info(viewName + "3");
				String skin = iblogInfoVO.getSkin();
				MemberVO member = (MemberVO)session.getAttribute("member");
				
				List<Map<String,String>> main_category = mypageDAO.selectbyMainCategory(iblogInfoVO.getId());
				List<Map<String,String>> sub_category = mypageDAO.selectbySubCategory(iblogInfoVO.getId());
				List<WriteInfoVO> writeInfoVOList = mypageDAO.selectbyWriteTitle(iblogInfoVO.getId());
				List<WriteInfoVO> writeLastVO = mypageDAO.selectbyWriteLast(iblogInfoVO.getId());
				logger.info(skin);
				System.out.println("writeLastVO : " + writeLastVO);
				if(skin.equals("skin1")) {
					skin = "1";
				} else if (skin.equals("skin2")) {
					skin = "2";
				} else if (skin.equals("skin3")) {
					skin = "3";
				} else if (skin.equals("skin4")) {
					skin = "4";
				}
				
				if(member == null) {
					int count = iblogInfoVO.getIblog_count();
					iblogInfoVO.setIblog_count(count+1);
					mypageDAO.updateIblogCount(iblogInfoVO);
					iblogInfoVO = mypageDAO.iblogInfo(iblogInfoVO.getId());
				} else {
					String id = member.getId();
					if(!id.equals(iblogInfoVO.getId())) {
						int count = iblogInfoVO.getIblog_count();
						iblogInfoVO.setIblog_count(count+1);
						mypageDAO.updateIblogCount(iblogInfoVO);
						iblogInfoVO = mypageDAO.iblogInfo(iblogInfoVO.getId());
					}
				}
				
				if(main_category.isEmpty()) {
					mav.addObject("main_category", "none");
				} else {
					mav.addObject("main_category", main_category);
				}
				
				if(sub_category.isEmpty()) {
					mav.addObject("sub_category", "none");
				} else {
					mav.addObject("sub_category", sub_category);
				}
				
				if(writeInfoVOList.isEmpty()) {
					System.out.println("writeInfoVOList none");
					mav.addObject("writeInfoVOList", "none");
				} else {
					System.out.println("writeInfoVOList none 아님");
					mav.addObject("writeInfoVOList", writeInfoVOList);
				}
				
				if(writeLastVO.isEmpty()) {
					System.out.println("writeLastVO none");
					mav.addObject("writeLastVO", "none");
				} else {
					System.out.println("writeLastVO none 아님");
					mav.addObject("writeLastVO", writeLastVO);
				}

				mav.addObject("iblogbyAddress", iblogInfoVO);
				mav.setViewName("/"+blogAddress + "/blog"+skin);
			}
			
		} else {
			iblogVO = mypageDAO.iblogInfobyaddress(blogAddress);
			String skin = iblogVO.getSkin();
			List<Map<String,String>> main_category = mypageDAO.selectbyMainCategory(iblogVO.getId());
			List<Map<String,String>> sub_category = mypageDAO.selectbySubCategory(iblogVO.getId());
			List<WriteInfoVO> writeInfoVOList = mypageDAO.selectbyWriteTitle(iblogVO.getId());
			List<WriteInfoVO> writeLastVO = mypageDAO.selectbyWriteLast(iblogVO.getId());
			logger.info(skin);
			System.out.println(main_category);
			System.out.println(sub_category);
			System.out.println(writeInfoVOList);
			if(skin.equals("skin1")) {
				skin = "1";
			} else if (skin.equals("skin2")) {
				skin = "2";
			} else if (skin.equals("skin3")) {
				skin = "3";
			} else if (skin.equals("skin4")) {
				skin = "4";
			}
			
			if(main_category.isEmpty()) {
				mav.addObject("main_category", "none");
			} else {
				mav.addObject("main_category", main_category);
			}
			
			if(sub_category.isEmpty()) {
				mav.addObject("sub_category", "none");
			} else {
				mav.addObject("sub_category", sub_category);
			}
			
			if(writeInfoVOList.isEmpty()) {
				System.out.println("none");
				mav.addObject("writeInfoVOList", "none");
			} else {
				System.out.println("none 아님");
				mav.addObject("writeInfoVOList", writeInfoVOList);
			}
			
			if(writeLastVO.isEmpty()) {
				System.out.println("writeLastVO none");
				mav.addObject("writeLastVO", "none");
			} else {
				System.out.println("writeLastVO none 아님");
				mav.addObject("writeLastVO", writeLastVO);
			}
			
			logger.info(viewName + "4");
			mav.setViewName("/"+blogAddress + "/blog"+skin);
		}
		

		
		return mav;
	}
	
	// 선택 블로그 글 불러오기
	@RequestMapping(value= "/**/blog.do/**/write.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView writeForm(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("writeForm 실행");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String view = (String)request.getRequestURI();
		String[] array = view.split("/");
		String blogAddress = array[2];
		String writeAddress = array[4];
		
		System.out.println("blogAddress : " + blogAddress);
		System.out.println("writeAddress : " + writeAddress);
		
		
		IblogInfoVO iblogVO = mypageDAO.iblogInfobyaddress(blogAddress);
		String skin = iblogVO.getSkin();
		MemberVO member = (MemberVO)session.getAttribute("member");
		List<Map<String,String>> main_category = mypageDAO.selectbyMainCategory(iblogVO.getId());
		List<Map<String,String>> sub_category = mypageDAO.selectbySubCategory(iblogVO.getId());
		List<WriteInfoVO> writeInfoVOList = mypageDAO.selectbyWriteTitle(iblogVO.getId());
		List<WriteInfoVO> writeInfoVOListASC = mypageDAO.selectbyWriteAsc(iblogVO.getId());
		
		List<WriteInfoVO> writeLastVO = mypageDAO.selectbyWriteLast(iblogVO.getId());
		logger.info(skin);
		if(skin.equals("skin1")) {
			skin = "1";
		} else if (skin.equals("skin2")) {
			skin = "2";
		} else if (skin.equals("skin3")) {
			skin = "3";
		} else if (skin.equals("skin4")) {
			skin = "4";
		}
		
		if(member == null) {
			if(!writeInfoVOListASC.isEmpty()) {
				int count = mypageDAO.selectbyWriteCount(iblogVO.getId(), writeAddress);
				mypageDAO.updateWriteCount(iblogVO.getId(), writeAddress,count+1);
				writeInfoVOList = mypageDAO.selectbyWriteTitle(iblogVO.getId());
			}
		} else {
			String id = member.getId();
			if(!id.equals(iblogVO.getId())) {
				if(!writeInfoVOListASC.isEmpty()) {
					int count = mypageDAO.selectbyWriteCount(iblogVO.getId(), writeAddress);
					mypageDAO.updateWriteCount(iblogVO.getId(), writeAddress,count+1);
					writeInfoVOList = mypageDAO.selectbyWriteTitle(iblogVO.getId());
				}
			}
		}
		
		if(main_category.isEmpty()) {
			mav.addObject("main_category", "none");
		} else {
			mav.addObject("main_category", main_category);
		}
		
		if(sub_category.isEmpty()) {
			mav.addObject("sub_category", "none");
		} else {
			mav.addObject("sub_category", sub_category);
		}
		
		if(writeInfoVOList.isEmpty()) {
			System.out.println("none");
			mav.addObject("writeInfoVOList", "none");
		} else {
			System.out.println("none 아님");
			mav.addObject("writeInfoVOList", writeInfoVOList);
			mav.addObject("writeAddress", writeAddress);
		}
		
		if(writeLastVO.isEmpty()) {
			System.out.println("writeLastVO none");
			mav.addObject("writeLastVO", "none");
		} else {
			System.out.println("writeLastVO none 아님");
			mav.addObject("writeLastVO", writeLastVO);
		}
		
		
		
		mav.addObject("iblogbyAddress", iblogVO);
		
		logger.info("blogAddress : " + blogAddress);
		logger.info("writeAddress : " + writeAddress);
		mav.setViewName("/"+blogAddress + "/blog"+skin + "/"+writeAddress+"/write");
		return mav;
	}
	
	// 수정폼 불러오기
	@RequestMapping(value= "/blog/updateWriteForm.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updateWriteForm(
			@ModelAttribute("writeInfoVO") WriteInfoVO writeInfoVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("updateWriteForm 실행");
		ModelAndView mav = new ModelAndView();
		
		if(writeInfoVO == null) {
			System.out.println("writeInfoVO none");
			mav.addObject("writeInfoVO", "none");
		} else {
			System.out.println("writeInfoVO none 아님");
			mav.addObject("writeInfoVO", writeInfoVO);
		}
		
		List<Map<String,String>> main_category = mypageDAO.selectbyMainCategory(writeInfoVO.getId());
		List<Map<String,String>> sub_category = mypageDAO.selectbySubCategory(writeInfoVO.getId());
		List<WriteInfoVO> writeInfoVOList = mypageDAO.selectbyWriteTitle(writeInfoVO.getId());
		List<WriteInfoVO> writeLastVO = mypageDAO.selectbyWriteLast(writeInfoVO.getId());
		IblogInfoVO iblogInfoVO = mypageDAO.iblogInfo(writeInfoVO.getId());
		String skin = iblogInfoVO.getSkin();
		
		if(skin.equals("skin1")) {
			skin = "1";
		} else if (skin.equals("skin2")) {
			skin = "2";
		} else if (skin.equals("skin3")) {
			skin = "3";
		} else if (skin.equals("skin4")) {
			skin = "4";
		}
		
		if(main_category.isEmpty()) {
			mav.addObject("main_category", "none");
		} else {
			mav.addObject("main_category", main_category);
		}
		
		if(sub_category.isEmpty()) {
			mav.addObject("sub_category", "none");
		} else {
			mav.addObject("sub_category", sub_category);
		}
		
		if(writeInfoVOList.isEmpty()) {
			System.out.println("none");
			mav.addObject("writeInfoVOList", "none");
		} else {
			System.out.println("none 아님");
			mav.addObject("writeInfoVOList", writeInfoVOList);
		}
		
		if(writeLastVO.isEmpty()) {
			System.out.println("writeLastVO none");
			mav.addObject("writeLastVO", "none");
		} else {
			System.out.println("writeLastVO none 아님");
			mav.addObject("writeLastVO", writeLastVO);
		}
		
		mav.setViewName("/blog/updateWriteForm" + skin);
		return mav;
	}
	
	// 블로그 업데이트
	@RequestMapping(value= "/blog/updateWrite.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updateWrite(
			@ModelAttribute("writeInfoVO") WriteInfoVO writeInfoVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("updateWrite 실행");
		ModelAndView mav = new ModelAndView();
		
		IblogInfoVO iblogInfoVO = mypageDAO.iblogInfo(writeInfoVO.getId());
		
		System.out.println("iblogInfoVO.getBlogAddress() : " + iblogInfoVO.getBlogAddress());
		System.out.println("iblogInfoVO.getSkin() : " + iblogInfoVO.getSkin());
		System.out.println("writeInfoVO.getWrite_address() : " + writeInfoVO.getWrite_address());
		
		mypageService.updateWrite(writeInfoVO);
		
		mav.setViewName("redirect:/"+iblogInfoVO.getBlogAddress() + "/blog.do");
		return mav;
	}
	
	// 블로그 삭제
	@RequestMapping(value= "/blog/deleteWrite.do", method=RequestMethod.POST)
	public ModelAndView deleteWrite(
			@ModelAttribute("writeInfoVO") WriteInfoVO writeInfoVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("deleteWrite 실행");
		ModelAndView mav = new ModelAndView();
		
		IblogInfoVO iblogInfoVO = mypageDAO.iblogInfo(writeInfoVO.getId());
		mypageService.deleteWrite(writeInfoVO);
		
		mav.setViewName("redirect:/"+iblogInfoVO.getBlogAddress() + "/blog.do");
		return mav;
	}
}
