package com.nob.domain;

public class LikeVO {
	private Integer u_no;
	private Integer l_bno;
	private Integer b_no;
	public Integer getB_no() {
		return b_no;
	}
	public void setB_no(Integer b_no) {
		this.b_no = b_no;
	}
	private Integer b_name;
	private Integer l_total;
	private Integer t_total;
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
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "LikeVO [u_no=" + u_no + ", l_bno=" + l_bno + ", b_name=" + b_name + ", l_total=" + l_total
				+ ", t_total=" + t_total + ", tbl_name=" + tbl_name + "]";
	}
	public Integer getT_total() {
		return t_total;
	}
	public void setT_total(Integer t_total) {
		
		this.t_total = t_total;
	}
	public Integer getL_total() {
		return l_total;
	}
	
	public void setL_total(Integer l_total) {
		
		this.l_total = l_total;
	}
	public Integer getU_no() {
		return u_no;
	}
	public void setU_no(Integer u_no) {
		this.u_no = u_no;
	}
	public Integer getL_bno() {
		return l_bno;
	}
	public void setL_bno(Integer l_bno) {
		this.l_bno = l_bno;
	}
	public Integer getB_name() {
		return b_name;
	}
	public void setB_name(Integer b_name) {
		this.b_name = b_name;
	}
	
	
}
