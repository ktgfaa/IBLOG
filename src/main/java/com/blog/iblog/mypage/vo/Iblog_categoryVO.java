package com.blog.iblog.mypage.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("iblog_categoryVO")
public class Iblog_categoryVO {
	private String id;
	private List<String> category_num;
	private List<String> category_value;
	private List<String> category_kind;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<String> getCategory_num() {
		return category_num;
	}

	public void setCategory_num(List<String> category_num) {
		this.category_num = category_num;
	}

	public List<String> getCategory_value() {
		return category_value;
	}

	public void setCategory_value(List<String> category_value) {
		this.category_value = category_value;
	}

	public List<String> getCategory_kind() {
		return category_kind;
	}

	public void setCategory_kind(List<String> category_kind) {
		this.category_kind = category_kind;
	}

}
