package com.nob.domain;

public class VideoVO {
	private Integer v_id;
	private String v_link;
	private String v_title;
	private String v_desc;
	private String v_category;
	public Integer getV_id() {
		return v_id;
	}
	public void setV_id(Integer v_id) {
		this.v_id = v_id;
	}
	public String getV_link() {
		return v_link;
	}
	public void setV_link(String v_link) {
		this.v_link = v_link;
	}
	public String getV_title() {
		return v_title;
	}
	public void setV_title(String v_title) {
		this.v_title = v_title;
	}
	public String getV_desc() {
		return v_desc;
	}
	public void setV_desc(String v_desc) {
		this.v_desc = v_desc;
	}
	public String getV_category() {
		return v_category;
	}
	public void setV_category(String v_category) {
		this.v_category = v_category;
	}
	@Override
	public String toString() {
		return "MovieVO [v_id=" + v_id + ", v_link=" + v_link + ", v_title=" + v_title + ", v_desc=" + v_desc
				+ ", v_category=" + v_category + "]";
	}
	
	
}
