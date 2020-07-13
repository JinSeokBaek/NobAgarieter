package com.nob.domain;

import java.util.Date;

//2018_07_04 modify (l_user and other(?))
public class GroupBoardVO {
	private Integer gb_no;
	private Integer g_id;
	private String gb_title;
	private String gb_content;
	private Date gb_regdate;
	private Integer gb_replycnt;
	private Integer u_no;
	private Integer l_total;
	private String[] files;
	private String h_name;
	private String l_user;
	private String u_nickname;
	
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public Integer getL_total() {
		return l_total;
	}
	public String getL_user() {
		return l_user;
	}
	public void setL_user(String l_user) {
		this.l_user = l_user;
	}
	public void setL_total(Integer l_total) {
		this.l_total = l_total;
	}
	public Integer getGb_no() {
		return gb_no;
	}
	public void setGb_no(Integer gb_no) {
		this.gb_no = gb_no;
	}
	public Integer getG_id() {
		return g_id;
	}
	public void setG_id(Integer g_id) {
		this.g_id = g_id;
	}
	public String getGb_title() {
		return gb_title;
	}
	public void setGb_title(String gb_title) {
		this.gb_title = gb_title;
	}
	public String getGb_content() {
		return gb_content;
	}
	public void setGb_content(String gb_content) {
		this.gb_content = gb_content;
	}
	public Date getGb_regdate() {
		return gb_regdate;
	}
	public void setGb_regdate(Date gb_regdate) {
		this.gb_regdate = gb_regdate;
	}
	public Integer getGb_replycnt() {
		return gb_replycnt;
	}
	public void setGb_replycnt(Integer gb_replycnt) {
		this.gb_replycnt = gb_replycnt;
	}
	public Integer getU_no() {
		return u_no;
	}
	public void setU_no(Integer u_no) {
		this.u_no = u_no;
	}
	@Override
	public String toString() {
		return "GroupBoardVO [gb_no=" + gb_no + ", g_id=" + g_id + ", gb_title=" + gb_title + ", gb_content="
				+ gb_content + ", gb_regdate=" + gb_regdate + ", gb_replycnt=" + gb_replycnt + ", u_no=" + u_no
				+ ", l_total=" + l_total + "]";
	}
	
}
