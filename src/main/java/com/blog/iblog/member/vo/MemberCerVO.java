package com.blog.iblog.member.vo;

import org.springframework.stereotype.Component;

@Component("memberCerVO")
public class MemberCerVO {
	private String CerResult;
	private String email;
	private String id;
	private String pwd;
	private String userEmail;
	
	
	
	public String getCerResult() {
		return CerResult;
	}
	public String getEmail() {
		return email;
	}
	public String getId() {
		return id;
	}
	public String getPwd() {
		return pwd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setCerResult(String cerResult) {
		CerResult = cerResult;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
}
