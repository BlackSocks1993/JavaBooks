<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="qnaDto" value="${qnaDto}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="qnaList" value="${rQnaList}"/>
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
            <span class="cValue">100</span>
        </div>
        <div class="content_wrapper">
            <div class="userInfo_wrapper">
                <div class="qType">
                    <span>분류</span>
                    <span class="qValue">배송</span>
                </div>
                <div class="userInfo">
                    <div class="userNameTel">
                        <div class="itemName">
                            <p>이름</p>
                            <p>연락처</p>
                        </div>
                        <div>
                            <p>김ㅇㅇ</p>
                            <p>010-1234-1234</p>
                        </div>
                    </div>
                    <div class="userId">
                        <div class="itemName">
                            <p>아이디</p>
                        </div>
                        <div>
                            <p>koo@gmail.coma</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="article_wrapper">
                <h3 class="detail_title">
                    제목입니다.
                </h3>
                <div class="article_content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores distinctio suscipit accusantium molestias ullam aut nulla, voluptates placeat dolores laudantium ut exercitationem odit sunt quasi esse, nisi magnam deleniti cum!
                </div>
            </div>
        </div>
    </section>
	
	<%@include file="../common/footer.jsp"%>
</body>
</html>