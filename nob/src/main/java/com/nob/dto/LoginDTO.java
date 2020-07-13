package com.nob.dto;

public class LoginDTO {
	private String u_email;
	private String u_pwd;
	private Integer u_no;
	public Integer getU_no() {
		return u_no;
	}
	public void setU_no(Integer u_no) {
		this.u_no = u_no;
	}
	private boolean userCookie;
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
	public boolean isUserCookie() {
		return userCookie;
	}
	public void setUserCookie(boolean userCookie) {
		this.userCookie = userCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [u_email=" + u_email + ", u_pwd=" + u_pwd + ", u_no=" + u_no + ", userCookie=" + userCookie
				+ "]";
	}
	
	
}
