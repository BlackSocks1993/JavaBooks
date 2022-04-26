<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="../css/header_footer.css">
	<link rel="stylesheet" href="../css/detailQnA.css">
</head>
<body>
	<%@include file="../common/header.jsp"%>

	<section class="content_container">
        <div class="contentNum">
            <span>글번호</span>
            <span class="cValue">${qnaDto.getQna_no()}</span>
        </div>
        <div class="content_wrapper">
            <div class="userInfo_wrapper">
                <div class="qType">
                    <span>분류</span>
                    <span class="qValue">${qnaDto.getQna_type()}</span>
                </div>
                <div class="userInfo">
                    <div class="userNameTel">
                        <div class="itemName">
                            <p>이름</p>
                            <p>연락처</p>
                        </div>
                        <div>
                            <p>김이름</p>
                            <p>010-1234-1234</p>
                        </div>
                    </div>
                    <div class="userId">
                        <div class="itemName">
                            <p>아이디</p>
                        </div>
                        <div>
                            <p>${qnaDto.getMember_id()}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="article_wrapper">
                <h3 class="detail_title">
                    ${qnaDto.getQna_title()}
                </h3>
                <div class="article_content">
                    ${qnaDto.getQna_content()}
                </div>
            </div>
            <div class="reply_del">
            	<button onclick="location.href='qnalist.do'">답글쓰기</button>
            	<button onclick="javascript:document.modfrm.submit();">수정하기</button>
            	<button onclick="javascript:document.delfrm.submit();">삭제하기</button>
            	<form name="modfrm" action="modQna.do" method="post">
            		<input type="hidden" name="qna_no" value="${qnaDto.getQna_no()}" />
            	</form>
            	<form name="delfrm" action="delQna.do" method="post">
            		<input type="hidden" name="qna_no" value="${qnaDto.getQna_no()}" />
            	</form>
            </div>
        </div>
    </section>
	
	<%@include file="../common/footer.jsp"%>
</body>
</html>