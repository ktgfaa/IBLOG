package com.blog.iblog.mypage.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("smartEditorVO")
public class SmartEditorVO {
	private String callback;
	private String callback_func;
	private MultipartFile filedata;
	public String getCallback() {
		return callback;
	}
	public String getCallback_func() {
		return callback_func;
	}
	public MultipartFile getFiledata() {
		return filedata;
	}
	public void setCallback(String callback) {
		this.callback = callback;
	}
	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}
	public void setFiledata(MultipartFile filedata) {
		this.filedata = filedata;
	}
	
	
}
