package com.nob.domain;

public class CalorieVO {
	private Integer c_no;
	private String c_name;
	private Integer c_serve;
	private double c_amount;
	public Integer getC_no() {
		return c_no;
	}
	public void setC_no(Integer c_no) {
		this.c_no = c_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public Integer getC_serve() {
		return c_serve;
	}
	public void setC_serve(Integer c_serve) {
		this.c_serve = c_serve;
	}
	public double getC_amount() {
		return c_amount;
	}
	public void setC_amount(double c_amount) {
		this.c_amount = c_amount;
	}
	@Override
	public String toString() {
		return "CalorieVO [c_no=" + c_no + ", c_name=" + c_name + ", c_serve=" + c_serve + ", c_amount=" + c_amount
				+ "]";
	}
	
	
}
