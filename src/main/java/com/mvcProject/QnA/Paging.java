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

    /**
     * 객체 생성 시 전체 게시물의 수를 필수로 넣어줘야 한다.
     * @param totalCount
     */
    public Paging(int totalCount) {
    	this.totalCount = totalCount;
    }

    /**
     * paging() 메소드 호출 시 파라미터로 page를 받고 페이징 기능 구현에 필요한 값을 getter로 받아서 사용한다.
     * @param page
     */
    public void paging(int page) {
    	this.totalPage = (int) Math.ceil(totalCount * 1.0 / displayRow);
    	this.page = page <= totalPage ?
    			page : totalPage;
    	this.beginRow = (this.page - 1) * displayRow + 1;
    	this.endRow = (beginRow + displayRow -1) < totalCount ?
    			(beginRow + displayRow -1) : totalCount;
    	this.section = (int) Math.ceil(this.page * 1.0 / displayPage);
    	this.beginPage = (section - 1) * displayPage + 1;
    	this.endPage = (beginPage + displayPage - 1) < totalPage ?
    			beginPage + displayPage - 1 : totalPage;
    	this.prev = section > 1 ?
    			true : false;
    	this.next = (section < (int) totalPage * 1.0 / displayPage) ?
    			true : false;
    }

	public int getPage() {
		return page;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getBeginRow() {
		return beginRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public int getSection() {
		return section;
	}

	public int getTotalPage() {
		return totalPage;
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

	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}

	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
}
