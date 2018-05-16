package cn.appsys.tool;

/**
 * 分页工具类
 * 
 * @author Joysing
 *
 */
public class PageSupport {

	/**
	 * 当前页码-来自于用户输入
	 */
	private int currentPageNo = 1;

	/**
	 * 总数量（表）
	 * 
	 */
	private int totalCount = 0;

	/**
	 * 页面容量
	 * 
	 */
	private int pageSize = 0;

	/**
	 * 总页数-totalCount/pageSize（+1）
	 * 
	 */
	private int totalPageCount = 1;
	/**
	 * 分页开始的行数
	 */
	private int from = 0;

	public PageSupport(int currentPageNo, int totalCount, int pageSize) {
		super();
		this.currentPageNo = currentPageNo;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		// 设置总页数
		if (this.totalCount % this.pageSize == 0) {
			this.totalPageCount = this.totalCount / this.pageSize;
		} else if (this.totalCount % this.pageSize > 0) {
			this.totalPageCount = this.totalCount / this.pageSize + 1;
		} else {
			this.totalPageCount = 0;
		}
		// 设置记录的开始数
		if (currentPageNo > 0) {
			this.setFrom(pageSize * (currentPageNo - 1));
		} else {
			this.setFrom(0);
		}

	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		if (currentPageNo > 0) {
			this.currentPageNo = currentPageNo;
		}
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		if (totalCount > 0) {
			this.totalCount = totalCount;
			// 设置总页数
			this.setTotalPageCountByRs();
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if (pageSize > 0) {
			this.pageSize = pageSize;
		}
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public void setTotalPageCountByRs() {
		if (this.totalCount % this.pageSize == 0) {
			this.totalPageCount = this.totalCount / this.pageSize;
		} else if (this.totalCount % this.pageSize > 0) {
			this.totalPageCount = this.totalCount / this.pageSize + 1;
		} else {
			this.totalPageCount = 0;
		}
	}

	public int getFrom() {
		return from;
	}

	public void setFrom(int from) {
		this.from = from;
	}

}