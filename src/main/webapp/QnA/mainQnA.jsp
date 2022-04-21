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
	<link rel="stylesheet" href="../css/mainQnA.css">
</head>
<body>
	<%@include file="../common/header.jsp"%>

	<section class="articles_container">
        <div class="articlesHeader_wrapper">
            <h3>QnA 문의내역</h3>
            <div>
                <button onclick="location.href='writingForm.do'">글 작성</button>
            </div>
        </div>

        <div class="articles_wrapper">
            <div class="articlesList_wrapper">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="type">구분</div>
                    <div class="title">제목</div>
                    <div class="author">글쓴이</div>
                    <div class="date">작성일</div>
                </div>
                <c:forEach var="i" begin="${paging.getBeginRow() -1 }" end="${paging.getEndRow() - 1}" step="1">
                	<div>
	                    <a href="${contextPath}/qna/detailQna.do?qna_no=${qnaList[i].qna_no}">
	                        <div class="num">${qnaList[i].qna_no}</div>
	                        <div class="type">${qnaList[i].qna_type}</div>
	                        <div class="title">${qnaList[i].qna_title}</div>
	                        <div class="author">${qnaList[i].member_id}</div>
	                        <div class="date">${qnaList[i].qna_date}</div>
	                    </a>
	                </div>
                </c:forEach>
            </div>
            
            <div class="page">
                <a href="#" class="first"><<</a>
                <a href="#" class="prev"><</a>
                <c:forEach var="i" begin="${paging.getBeginPage()}" end="${paging.getEndPage()}" step="1">
                	<a href="${contextPath}/qna/qnalist.do?page=${i}" class="num">${i}</a>
                </c:forEach>
                <a href="#" class="next">></a>
                <a href="#" class="last">>></a>
            </div>
        </div>
    </section>
	
	<%@include file="../common/footer.jsp"%>
</body>
</html>