package com.nob.domain;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {
	private Integer b_no;
	private String b_title;
	private String b_content;
	private Integer u_no;
	private Date b_regdate;
	private int b_viewcnt;
	private int b_replycnt;
	private String b_category;
	
	
	/*like 추가*/
	private int total;
	private String h_name;
	/*게시판 분류*/
	private String b_name;
	private String[] files;
	
	/*user */
	private String u_nickname;
	
	/*event*/
	private String b_date;
	
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	/**
	 * @return the thumbnailimage
	 */
	public String getThumbnailimage() {
		return thumbnailimage;
	}
	/**
	 * @param thumbnailimage the thumbnailimage to set
	 */
	public void setThumbnailimage(String thumbnailimage) {
		this.thumbnailimage = thumbnailimage;
	}
	/*image*/
	private String thumbnailimage;
	
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
	 * @return the files
	 */
	public String[] getFiles() {
		return files;
	}
	/**
	 * @param files the files to set
	 */
	public void setFiles(String[] files) {
		this.files = files;
	}
	/**
	 * @return the b_name
	 */
	public String getB_name() {
		return b_name;
	}
	/**
	 * @param b_name the b_name to set
	 */
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	/**
	 * @return the h_name
	 */
	public String getH_name() {
		return h_name;
	}
	/**
	 * @param h_name the h_name to set
	 */
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	
	
	/**
	 * @return the total
	 */
	public int getTotal() {
		return total;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(int total) {
		this.total = total;
	}
	public Integer getB_no() {
		return b_no;
	}
	public void setB_no(Integer b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Integer getU_no() {
		return u_no;
	}
	public void setU_no(Integer u_no) {
		this.u_no = u_no;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	public int getB_viewcnt() {
		return b_viewcnt;
	}
	public void setB_viewcnt(int b_viewcnt) {
		this.b_viewcnt = b_viewcnt;
	}
	public int getB_replycnt() {
		return b_replycnt;
	}
	public void setB_replycnt(int b_replycnt) {
		this.b_replycnt = b_replycnt;
	}
	public String getB_category() {
		return b_category;
	}
	public void setB_category(String b_category) {
		this.b_category = b_category;
	}
	@Override
	public String toString() {
		return "BoardVO [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", u_no=" + u_no
				+ ", b_regdate=" + b_regdate + ", b_viewcnt=" + b_viewcnt + ", b_replycnt=" + b_replycnt
				+ ", b_category=" + b_category + ", total=" + total + ", h_name=" + h_name + ", b_name=" + b_name
				+ ", files=" + Arrays.toString(files) + ", u_nickname=" + u_nickname + ", b_date=" + b_date
				+ ", thumbnailimage=" + thumbnailimage + "]";
	}

	
	
}
