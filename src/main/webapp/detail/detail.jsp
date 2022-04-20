<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="com.mvcProject.category.*"
    import="com.mvcProject.product.*"
    import="java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBooks | 상품 상세 페이지</title>
<link rel="stylesheet" href="../css/header_footer.css">
<link rel="stylesheet" href="../css/detail.css">
</head>
<body>
	<%@include file="../common/header.jsp"%>

	<%
	ProductDTO dto = new ProductDTO();
	
    request.setCharacterEncoding("UTF-8");
    String product_img = request.getParameter("product_img");
    String product_name = request.getParameter("product_name");
    String product_author = request.getParameter("product_author");
    String product_publisher = request.getParameter("product_publisher");
    String product_date = request.getParameter("product_date");
    String product_detail = request.getParameter("product_detail");
    int product_price = Integer.parseInt(request.getParameter("product_price"));
    

    
    
    
	%>

	<section>
		<div class="product_image">
			<img src="<%=product_img%>" alt="">
		</div>
		<div class="product_detail">
			<div class="product_name">
				<div class="item">도서명</div>
				<div id="product_name"><%=product_name%></div>
				<div class="item"><%=product_author%></div>
				<div class="item"><%=product_publisher%></div>
				<div><%=product_date%></div>
			</div>
			<hr>
			<div class="product_price">
				<div class="item">판매가</div>
				<div><%=product_price%>원</div>
				<div class="item">배송비</div>
				<div>2500원</div>
			</div>
			<hr>
			<div class="product_delivery">
				<div class="item">배송안내</div>
				<div>4/13(수) 발송예정</div>
			</div>
			<hr>
			<div class="total_price">
				<div class="item">총 상품 금액</div>
				<div><%=product_price + 2500%>원</div>
			</div>
			<hr>
			<div class="product_purchase">
				<a href="" class="item"><input type="button" value="장바구니"></a>
				<a href="../orderPage/payment.jsp?product_price=<%=product_price%>&product_name=<%=product_name%>&product_img=<%=product_img%>" class="item"><input type="button" value="바로구매"></a>
			</div>
		</div>
	</section>
		<div class="product_detail_wrapper">
			<div class="detail_title">책소개</div>
			<div class="detail_info"><%=product_detail%></div>
		</div>

	<%@include file="../common/footer.jsp"%>
</body>
</html>