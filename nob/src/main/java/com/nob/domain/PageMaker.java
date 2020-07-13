package com.nob.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum =5;
	private Criteria cri;
	
	/**
	 * @return the displayPageNum
	 */
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	/**
	 * @param displayPageNum the displayPageNum to set
	 */
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	/**
	 * @return the cri
	 */
	public Criteria getCri() {
		return cri;
	}
	/**
	 * @param cri the cri to set
	 */
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	/**
	 * @return the totalCount
	 */
	public int getTotalCount() {
		return totalCount;
	}
	/**
	 * @param totalCount the totalCount to set
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcDate();
	}
	
	private void calcDate() {
		endPage= (int) (Math.ceil(cri.getPage()/(double) displayPageNum)*displayPageNum);
		startPage = (endPage-displayPageNum)+1;
		int tempEndPage = (int) (Math.ceil(totalCount/(double)cri.getPerPageNum()));
		if(endPage>tempEndPage) {
			endPage=tempEndPage;
		}
		prev= startPage ==1 ? false :true;
		next= endPage*cri.getPerPageNum()>=totalCount ? false :true;
	}
	/**
	 * @return the startPage
	 */
	public int getStartPage() {
		return startPage;
	}
	/**
	 * @param startPage the startPage to set
	 */
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	/**
	 * @return the endPage
	 */
	public int getEndPage() {
		return endPage;
	}
	/**
	 * @param endPage the endPage to set
	 */
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	/**
	 * @return the prev
	 */
	public boolean isPrev() {
		return prev;
	}
	/**
	 * @param prev the prev to set
	 */
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	/**
	 * @return the next
	 */
	public boolean isNext() {
		return next;
	}
	/**
	 * @param next the next to set
	 */
	public void setNext(boolean next) {
		this.next = next;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents= UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();

	}
	
	public String makeSearch(int page) {
		UriComponents uriComponents=
		UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("perPageNum", cri.getPerPageNum()).queryParam("searchType",((SearchCriteria) cri).getSearchType()).queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword())).build();
		
		return uriComponents.toUriString();
		
	}
	private String encoding(String keyword) {
		if(keyword == null ||keyword.trim().length()==0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		}catch(UnsupportedEncodingException e) {
			return "";
		}
	}
	
}
