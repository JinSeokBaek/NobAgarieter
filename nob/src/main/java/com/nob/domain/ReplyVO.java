package com.nob.domain;

import java.util.Date;
//2018_07_04 modify (l_user and l_total and other(?))
public class ReplyVO {
	private Integer r_id;
	private Integer b_no;
	private String b_category;
	private Integer l_user;
	private Integer l_total;
	public Integer getL_user() {
		return l_user;
	}
	public void setL_user(Integer l_user) {
		this.l_user = l_user;
	}
	public Integer getL_total() {
		return l_total;
	}
	public void setL_total(Integer l_total) {
		this.l_total = l_total;
	}
	public String getU_no() {
		return u_no;
	}
	/**
	 * @return the r_id
	 */
	public Integer getR_id() {
		return r_id;
	}
	/**
	 * @param r_id the r_id to set
	 */
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	private String r_replytext;
	private String u_no;
	private String u_nickname;
	/**
	 * @return the u_nickname
	 */
	public String getU_nickname() {
		return u_nickname;
	}
	/**
	 * @param u_nickname the u_nickname to set
	 */
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	/**
	 * @param u_no the u_no to set
	 */
	public void setU_no(String u_no) {
		this.u_no = u_no;
	}
	private Date r_regdate;
	private String r_content;
	private String tbl_name;
	
	/**
	 * @return the tbl_name
	 */
	public String getTbl_name() {
		return tbl_name;
	}
	/**
	 * @param tbl_name the tbl_name to set
	 */
	public void setTbl_name(String tbl_name) {
		this.tbl_name = tbl_name;
	}
	public Integer getB_no() {
		return b_no;
	}
	public void setB_no(Integer b_no) {
		this.b_no = b_no;
	}
	public String getB_category() {
		return b_category;
	}
	public void setB_category(String b_category) {
		this.b_category = b_category;
	}
	public String getR_replytext() {
		return r_replytext;
	}
	public void setR_replytext(String r_replytext) {
		this.r_replytext = r_replytext;
	}
	

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ReplyVO [r_id=" + r_id + ", b_no=" + b_no + ", b_category=" + b_category + ", r_replytext="
				+ r_replytext + ", u_no=" + u_no + ", u_nickname=" + u_nickname + ", r_regdate=" + r_regdate
				+ ", r_content=" + r_content + ", tbl_name=" + tbl_name + "]";
	}
	/**
	 * @return the r_regdate
	 */
	public Date getR_regdate() {
		return r_regdate;
	}
	/**
	 * @param r_regdate the r_regdate to set
	 */
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	/**
	 * @return the r_content
	 */
	public String getR_content() {
		return r_content;
	}
	/**
	 * @param r_content the r_content to set
	 */
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	
	
}
