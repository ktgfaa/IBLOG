package com.blog.iblog.smarteditor2.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blog.iblog.mypage.vo.SmartEditorVO;

@Controller("smarteditor2Controller")
public class Smarteditor2Controller {

	private static final Logger logger = LoggerFactory.getLogger(Smarteditor2Controller.class);
	
	// 파일 업로드 폼 
	@RequestMapping(value= "/smarteditor2/photo_uploader.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView photo_uploader(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("photo_uploader 실행");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	// 파일 업로드 폼 
	@RequestMapping(value= "/smarteditor2/file_uploader_html5.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView file_uploader_html5(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("file_uploader_html5 실행");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	// 이미지 싱글 업로드
	@RequestMapping(value= "/smarteditor2/singleImageUploader.do", method=RequestMethod.POST)
	public String singleImageUploader(
			SmartEditorVO smartEditorVO,
			HttpServletRequest request) throws UnsupportedEncodingException {
		logger.info("singleImageUploader 실행");
		
		String callback = smartEditorVO.getCallback();
		String callback_func = smartEditorVO.getCallback_func();
		String file_result = "";
		String result = "";
		MultipartFile multiFile = smartEditorVO.getFiledata();
		try {
			if(multiFile != null && multiFile.getSize() > 0 &&
					StringUtils.isNotBlank(multiFile.getName())) {
				if(multiFile.getContentType().toLowerCase().startsWith("image/")) {
					String oriName = multiFile.getName();
					String uploadPath = request.getSession().getServletContext().getRealPath("/img");
					String path = uploadPath + "/smarteditor/";
					File file = new File(path);
					if(!file.exists()) {
						file.mkdirs();
					}
					String fileName = UUID.randomUUID().toString();
					smartEditorVO.getFiledata().transferTo(new File(path + fileName));
					file_result += "&bNewLine=true&sFileName=" + oriName +
							"&sFileURL=/img/smarteditor/" + fileName;
				} else {
					file_result += "&errstr=error";
				}
			} else {
				file_result += "&errstr=error";
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(callback);
		System.out.println(callback_func);
		System.out.println(file_result);
		System.out.println(multiFile);
		result = "redirect:" + 	callback +
				"?callback_func=" + URLEncoder.encode(callback_func,"UTF-8") + file_result;
		
		return result;
	}
}
