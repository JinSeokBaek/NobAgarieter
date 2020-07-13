package com.nob.domain;

import java.util.Date;

public class NoticeVO {
	private Integer n_no;
	private String n_title;
	private String n_content;
	private Date n_regdate;
	private String n_category;
	public Integer getN_no() {
		return n_no;
	}
	public void setN_no(Integer n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Date getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}
	public String getN_category() {
		return n_category;
	}
	public void setN_category(String n_category) {
		this.n_category = n_category;
	}
	@Override
	public String toString() {
		return "NoticeVO [n_no=" + n_no + ", n_title=" + n_title + ", n_content=" + n_content + ", n_regdate="
				+ n_regdate + ", n_category=" + n_category + "]";
	}
	
	
}
