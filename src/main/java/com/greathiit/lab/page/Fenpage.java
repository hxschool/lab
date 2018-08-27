package com.greathiit.lab.page;


public class Fenpage {
	private Integer currentPage;//当前页
	private Integer pageSize;//每页显示的记录数
	private Integer totalPages;//总页数
	private Integer totalCounts;//总纪录数
	private Integer startRow;//数据库查询中开始的页数
	public Fenpage(Integer currentPage, Integer totalCounts) {
		super();
		this.currentPage = currentPage;
		this.pageSize = 15;
		this.totalPages =totalCounts%15==0?totalCounts==0?1:totalCounts/pageSize:totalCounts/pageSize+1;
		this.totalCounts = totalCounts;
		this.startRow = currentPage*pageSize;
	}
	public Fenpage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}
	public Integer getTotalCounts() {
		return totalCounts;
	}
	public void setTotalCounts(Integer totalCounts) {
		this.totalCounts = totalCounts;
	}
	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	

}
