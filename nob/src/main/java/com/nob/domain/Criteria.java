package com.nob.domain;

public class Criteria {
	private int page;
	private int perPageNum;
	private int groupPerPage;
	public Criteria() {
		this.page= 1;
		this.perPageNum=20;
		this.groupPerPage = 4;
	}
	/**
	 * @return the groupPerPage
	 */
	public int getGroupPerPage() {
		return groupPerPage;
	}
	/**
	 * @param groupPerPage the groupPerPage to set
	 */
	public void setGroupPerPage(int groupPerPage) {
		this.groupPerPage = groupPerPage;
	}
	/**
	 * @return the page
	 */
	public int getPage() {
		return page;
	}
	/**
	 * @param page the page to set
	 */
	public void setPage(int page) {
		if(page<=0) {
			this.page =1;
			return;
		}
		this.page = page;
	}
	/**
	 * @return the perPageNum
	 */
	public int getPerPageNum() {
		return perPageNum;
	}
	/**
	 * @param perPageNum the perPageNum to set
	 */
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<0||perPageNum>100) {
			this.perPageNum=16;
			return;
		}
		this.perPageNum = perPageNum;
	}
	public int getPageStart() {
		return (this.page-1) * perPageNum;
	}
	
	public int getGroupPageStart() {
		return (this.page-1) * groupPerPage;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", groupPerPage=" + groupPerPage + "]";
	}
	
}
