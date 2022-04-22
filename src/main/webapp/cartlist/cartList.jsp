<!-- 장바구니 -->

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<!-- 스타일시트 경로 -->


</head>
<body>

	${userName} 회원님 의 장바구니 입니다.

	<hr>

	${name}
			<%-- <fmt:formatNumber value="${cartList.product_price}"
					pattern="#,### 원" /> | 수량 ${cartList.amount_cart}개 --%>



</body>
</html>