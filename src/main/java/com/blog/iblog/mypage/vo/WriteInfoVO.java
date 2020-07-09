package com.blog.iblog.mypage.vo;

import org.springframework.stereotype.Component;

@Component("writeInfoVO")
public class WriteInfoVO {
	private String id;
	private String write_main_category;
	private String write_sub_category;
	private String write_subject;
	private String write_description;
	private String write_address;
	private String write_date;
	private int write_count;
	
	
	
	

	public int getWrite_count() {
		return write_count;
	}

	public void setWrite_count(int write_count) {
		this.write_count = write_count;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getWrite_address() {
		return write_address;
	}

	public void setWrite_address(String write_address) {
		this.write_address = write_address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWrite_main_category() {
		return write_main_category;
	}

	public void setWrite_main_category(String write_main_category) {
		this.write_main_category = write_main_category;
	}

	public String getWrite_sub_category() {
		return write_sub_category;
	}

	public void setWrite_sub_category(String write_sub_category) {
		this.write_sub_category = write_sub_category;
	}



	public String getWrite_subject() {
		return write_subject;
	}

	public void setWrite_subject(String write_subject) {
		this.write_subject = write_subject;
	}

	public String getWrite_description() {
		return write_description;
	}

	public void setWrite_description(String write_description) {
		this.write_description = write_description;
	}

}
