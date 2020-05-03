package com.blog.iblog.member.vo;

import org.springframework.stereotype.Component;

@Component("memberCerVO")
public class MemberCerVO {
	private String id;
	private String pwd;
	private String email;
	private String userEmail;
	private String CerResult;
	
	
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getCerResult() {
		return CerResult;
	}
	public void setCerResult(String cerResult) {
		CerResult = cerResult;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
