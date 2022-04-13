<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="../css/header_footer.css">
	<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<%@include file="../common/header.jsp"%>

	<section>
        <div class="category_wrapper">
          <div class="title">
            <p>카테고리</p>
          </div>
          <ul>
            <li><a href="#">소설/시</a></li>
            <li><a href="#">에세이</a></li>
          </ul>
        </div>

        <div class="bestSeller_wrapper">
          <div class="mainTitle">베스트 셀러</div>
          <div class="fiction_wrapper">
            <p>소설/시</p>
            <div class="bestSeller_items">
              <a href="#"><img src="https://image.yes24.com/Goods/108590831/L" alt=""></a>
              <a href="#"><img src="https://image.yes24.com/Goods/108590831/L" alt=""></a>
              <a href="#"><img src="https://image.yes24.com/Goods/108590831/L" alt=""></a>
            </div>
          </div>
          <div class="essay_wrapper">
            <p>에세이</p>
            <div class="bestSeller_items">
              <a href="#"><img src="https://image.yes24.com/Goods/108590831/L" alt=""></a>
              <a href="#"><img src="https://image.yes24.com/Goods/108590831/L" alt=""></a>
              <a href="#"><img src="https://image.yes24.com/Goods/108590831/L" alt=""></a>
            </div>
          </div>
        </div>

        <div class="searchAndAd">
          <form action="">
            <input type="text">
            <input type="button" value="검색">
          </form>
          <div class="ad">
            <a href="http://www.yes24.com/Campaign/06_eBook/2021/0701Ebookfirst.aspx"><img src="https://image.yes24.com/images/00_Event/2021/1026Ebookfirst/welcome_Bookclub_480x738.jpg" alt="ad"></a>
          </div>
        </div>
    </section>
	
	<%@include file="../common/footer.jsp"%>
</body>
</html>