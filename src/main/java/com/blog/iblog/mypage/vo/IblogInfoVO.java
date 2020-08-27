package com.blog.iblog.mypage.vo;

import org.springframework.stereotype.Component;

@Component("iblogInfoVO")
public class IblogInfoVO {
	private String blogAddress;
	private String blogName;
	private int iblog_count;
	private String id;
	private String skin;
	private String subject;
	private String title;
	
	
	
	public String getBlogAddress() {
		return blogAddress;
	}
	public String getBlogName() {
		return blogName;
	}
	public int getIblog_count() {
		return iblog_count;
	}
	public String getId() {
		return id;
	}
	public String getSkin() {
		return skin;
	}
	public String getSubject() {
		return subject;
	}
	public String getTitle() {
		return title;
	}
	public void setBlogAddress(String blogAddress) {
		this.blogAddress = blogAddress;
	}
	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}
	public void setIblog_count(int iblog_count) {
		this.iblog_count = iblog_count;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setSkin(String skin) {
		this.skin = skin;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
