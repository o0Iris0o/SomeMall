package com.somemall.vo;

import java.util.List;

public class Page {
	private int pageSize;//每页记录数
	private int currentPage;//当前页
	private int nextPage;//下一页
	private int previousPage;//前一页
	private int totalCount;//总记录数
	private int totalPage;//总页数
	private int startCount;//startCount =  (currentPage-1)*pageSize,是limit ?,? 的第一个参数
	private String[] keyWords;//模糊关键字
	
	private List data;//当前页的那些数据库的数据

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPreviousPage() {
		return previousPage;
	}

	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public String[] getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String[] keyWords) {
		this.keyWords = keyWords;
	}

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount() {
		this.startCount =  (currentPage-1)*pageSize;
	}
	
	
}
