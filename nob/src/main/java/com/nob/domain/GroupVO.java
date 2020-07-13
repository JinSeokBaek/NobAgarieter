package com.nob.domain;

import java.util.Date;

public class GroupVO {
	private Integer g_id;
	private Integer u_no;
	private String g_name;
	private Date g_regdate;
	private String g_category;
	private String g_subcategory;
	
	//tak 버튼 필터 테스트
	private String gm_grant;
	
	//group 총원
	private Integer m_total;
	
	
	
	/**
	 * @return the m_total
	 */
	public Integer getM_total() {
		return m_total;
	}
	/**
	 * @param m_total the m_total to set
	 */
	public void setM_total(Integer m_total) {
		this.m_total = m_total;
	}
	/**
	 * @return the gm_grant
	 */
	public String getGm_grant() {
		return gm_grant;
	}
	/**
	 * @param gm_grant the gm_grant to set
	 */
	public void setGm_grant(String gm_grant) {
		this.gm_grant = gm_grant;
	}
	public Integer getG_id() {
		return g_id;
	}
	public void setG_id(Integer g_id) {
		this.g_id = g_id;
	}
	public Integer getU_no() {
		return u_no;
	}
	public void setU_no(Integer u_no) {
		this.u_no = u_no;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public Date getG_regdate() {
		return g_regdate;
	}
	public void setG_regdate(Date g_regdate) {
		this.g_regdate = g_regdate;
	}
	public String getG_category() {
		return g_category;
	}
	public void setG_category(String g_category) {
		this.g_category = g_category;
	}
	public String getG_subcategory() {
		return g_subcategory;
	}
	public void setG_subcategory(String g_subcategory) {
		this.g_subcategory = g_subcategory;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "GroupVO [g_id=" + g_id + ", u_no=" + u_no + ", g_name=" + g_name + ", g_regdate=" + g_regdate
				+ ", g_category=" + g_category + ", g_subcategory=" + g_subcategory + ", gm_grant=" + gm_grant
				+ ", m_total=" + m_total + "]";
	}
	
	
	
}
