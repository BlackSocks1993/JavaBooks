package com.mvcProject.QnA;

public class Paging {
	private int page =1; 			// 현재 페이지 (get)
    private int totalCount; 		// 전체 행의 수 (get)
    
    private int beginRow;			// 게시물 출력 시작
    private int endRow;				// 게시물 출력 끝
    private int section;			// 페이지 섹션
    private int totalPage;			// 전체 페이지
    private int beginPage;  		// 페이지 출력 시작
    private int endPage;    		// 페이지 출력 끝
    private int displayRow =7;  	// 한 페이지에 몇 개의 행이 표시될 것인가 (선택 set)
    private int displayPage =5;  	// 한 페이지에 몇 개의 페이지 버튼이 표시될 것인가 (선택 set)
    boolean prev; 					// 이전 버튼의 활성화 여부
    boolean next; 					// 다음 버튼의 활성화 여부

    // 한 페이지당 표시할 콘텐츠 = displayRow
    // beginPage = (page - 1) * displayRow + 1
    // (3 - 1) * 7 + 1 = 15
    // endPage = beginPage + displayRow -1
    // prev.true = Math.ceil(page / displayPage) > 1;
    
    public Paging(int page, int totalCount) {    	
    	this.beginRow = (page - 1) * displayRow + 1;
    	this.endRow = beginRow + displayRow -1;
    	this.section = (int) Math.ceil(page * 1.0 / displayPage);
    	this.beginPage = (section - 1) * displayPage + 1;
    	this.totalPage = (int) Math.ceil(totalCount * 1.0 / displayRow);
//    	(beginPage + displayPage + 1) > totalPage?
//    			this.endPage = beginPage + displayPage + 1 :
//    			this.endPage = totalPage;
    	
    	
    	this.endPage = beginPage + displayPage + 1;
    	if(this.section > 1) {
    		this.prev = true;
    	}
    			
    }

	public int getPage() {
		return page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getDisplayRow() {
		return displayRow;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}

	
	
	public void setPage(int page) {
		this.page = page;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
}
