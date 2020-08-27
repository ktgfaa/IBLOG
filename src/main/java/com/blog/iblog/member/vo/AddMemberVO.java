package com.blog.iblog.member.vo;

import org.springframework.stereotype.Component;

@Component("AddMemberVO")
public class AddMemberVO {
    private String authority;
    private String email;
    private String enabled;
    private String id;
    private String name;
    private String password;
	public String getAuthority() {
		return authority;
	}
	public String getEmail() {
		return email;
	}
	public String getEnabled() {
		return enabled;
	}
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getPassword() {
		return password;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    
    
    
    
}
