package com.nob.domain;

import java.util.Date;

public class GroupMemberVO {
	private Integer gm_no;
	private Integer u_no;
	private Integer g_id;
	private String u_nickname;
	private String gm_grant;
	private Date gm_joindate;
	public Integer getGm_no() {
		return gm_no;
	}
	public void setGm_no(Integer gm_no) {
		this.gm_no = gm_no;
	}
	public Integer getU_no() {
		return u_no;
	}
	public void setU_no(Integer u_no) {
		this.u_no = u_no;
	}
	
	public Integer getG_id() {
		return g_id;
	}
	public void setG_id(Integer g_id) {
		this.g_id = g_id;
	}
	
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getGm_grant() {
		return gm_grant;
	}
	public void setGm_grant(String gm_grant) {
		this.gm_grant = gm_grant;
	}
	public Date getGm_joindate() {
		return gm_joindate;
	}
	public void setGm_joindate(Date gm_joindate) {
		this.gm_joindate = gm_joindate;
	}
	@Override
	public String toString() {
		return "GroupMemberVO [gm_no=" + gm_no + ", u_no=" + u_no + ", g_id=" + g_id + ", u_nickname=" + u_nickname
				+ ", gm_grant=" + gm_grant + ", gm_joindate=" + gm_joindate + "]";
	}
	
	
	
	
}
