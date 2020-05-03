package com.blog.iblog.member.vo;

import org.springframework.stereotype.Component;

@Component("memberPolisyVO")
public class MemberPolisyVO {
	private String total_val;
	private String service_val;
	private String info_val;
	
	public String getTotal_val() {
		return total_val;
	}
	public void setTotal_val(String total_val) {
		this.total_val = total_val;
	}
	public String getService_val() {
		return service_val;
	}
	public void setService_val(String service_val) {
		this.service_val = service_val;
	}
	public String getInfo_val() {
		return info_val;
	}
	public void setInfo_val(String info_val) {
		this.info_val = info_val;
	}

	
	
	
}
