package com.nob.domain;

import java.util.Date;

public class UserVO {
	private Integer u_no;
	private String u_email;
	private String u_pwd;
	private String u_name;
	private String u_gender;
	private String u_nickname;
	private double u_bmi;
	private Date u_joindate;
	private Date u_updatedate;
	private String u_authkey;
	public Integer getU_no() {
		return u_no;
	}
	public void setU_no(Integer u_no) {
		this.u_no = u_no;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_gender() {
		return u_gender;
	}
	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public double getU_bmi() {
		return u_bmi;
	}
	public void setU_bmi(double u_bmi) {
		this.u_bmi = u_bmi;
	}
	public Date getU_joindate() {
		return u_joindate;
	}
	public void setU_joindate(Date u_joindate) {
		this.u_joindate = u_joindate;
	}
	
	public Date getU_updatedate() {
		return u_updatedate;
	}
	public void setU_updatedate(Date u_updatedate) {
		this.u_updatedate = u_updatedate;
	}
	public String getU_authkey() {
		return u_authkey;
	}
	public void setU_authkey(String u_authkey) {
		this.u_authkey = u_authkey;
	}
	@Override
	public String toString() {
		return "UserVO [u_no=" + u_no + ", u_email=" + u_email + ", u_pwd=" + u_pwd + ", u_name=" + u_name
				+ ", u_gender=" + u_gender + ", u_nickname=" + u_nickname + ", u_bmi=" + u_bmi + ", u_joindate="
				+ u_joindate + ", u_updatedate=" + u_updatedate + ", u_authkey=" + u_authkey + "]";
	}
	
	
	
}
