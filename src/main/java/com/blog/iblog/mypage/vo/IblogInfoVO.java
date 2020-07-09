package com.blog.iblog.mypage.vo;

import org.springframework.stereotype.Component;

@Component("iblogInfoVO")
public class IblogInfoVO {
	private String id;
	private String blogName;
	private String title;
	private String blogAddress;
	private String subject;
	private String skin;
	private int iblog_count;
	
	
	
	public int getIblog_count() {
		return iblog_count;
	}
	public void setIblog_count(int iblog_count) {
		this.iblog_count = iblog_count;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBlogName() {
		return blogName;
	}
	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBlogAddress() {
		return blogAddress;
	}
	public void setBlogAddress(String blogAddress) {
		this.blogAddress = blogAddress;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSkin() {
		return skin;
	}
	public void setSkin(String skin) {
		this.skin = skin;
	}
	
	
}
