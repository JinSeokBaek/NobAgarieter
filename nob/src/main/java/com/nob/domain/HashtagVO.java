package com.nob.domain;

public class HashtagVO {
	private Integer h_bno;
	private Integer b_name;
	private String h_name;
	@Override
	public String toString() {
		return "HashtagVO [h_bno=" + h_bno + ", b_name=" + b_name + ", h_name=" + h_name + "]";
	}
	public Integer getH_bno() {
		return h_bno;
	}
	public void setH_bno(Integer h_bno) {
		this.h_bno = h_bno;
	}
	public Integer getB_name() {
		return b_name;
	}
	public void setB_name(Integer b_name) {
		this.b_name = b_name;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
}
