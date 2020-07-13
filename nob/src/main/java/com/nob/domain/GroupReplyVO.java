package com.nob.domain;

import java.util.Date;
//2018_07_04 modify (l_user and other(?))
public class GroupReplyVO {
	private Integer gr_id;
	private Integer gb_no;
	private String gr_content;
	private Date gr_regdate;
	private Integer u_no;
	private Integer l_total;
	private String h_name;
	private Integer l_user;
	private String u_nickname;
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public Integer getL_user() {
		return l_user;
	}
	public void setL_user(Integer l_user) {
		this.l_user = l_user;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public Integer getL_total() {
		return l_total;
	}
	public void setL_total(Integer l_total) {
		this.l_total = l_total;
	}
	public Integer getGr_id() {
		return gr_id;
	}
	public void setGr_id(Integer gr_id) {
		this.gr_id = gr_id;
	}
	public Integer getGb_no() {
		return gb_no;
	}
	public void setGb_no(Integer gb_no) {
		this.gb_no = gb_no;
	}
	public String getGr_content() {
		return gr_content;
	}
	public void setGr_content(String gr_content) {
		this.gr_content = gr_content;
	}
	public Date getGr_regdate() {
		return gr_regdate;
	}
	public void setGr_regdate(Date gr_regdate) {
		this.gr_regdate = gr_regdate;
	}
	public Integer getU_no() {
		return u_no;
	}
	public void setU_no(Integer u_no) {
		this.u_no = u_no;
	}
	@Override
	public String toString() {
		return "GroupReplyVO [gr_id=" + gr_id + ", gb_no=" + gb_no + ", gr_content=" + gr_content + ", gr_regdate="
				+ gr_regdate + ", u_no=" + u_no + ", l_total=" + l_total + ", h_name=" + h_name + ", l_user=" + l_user
				+ ", u_nickname=" + u_nickname + "]";
	}
	
}
