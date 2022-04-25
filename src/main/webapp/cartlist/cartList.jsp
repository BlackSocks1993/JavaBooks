<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.mvcProject.cartList.controller.*"
	import="com.mvcProject.cartList.model.*" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바북스 | 장바구니</title>

<link rel="stylesheet" href="../css/header_footer.css">
<link rel="stylesheet" href="../css/cartlist.css">

</head>
<body>

	<%@include file="../common/header.jsp"%>

	<section>

		<div class="user">
			환영합니다 <br> ${userName} 회원님 의 장바구니 입니다.
		</div>

		<div class="list-empty">
			<c:if test="${cartList.size() == 0 }">
			장바구니에 상품이 없습니다.
			</c:if>
		</div>
		
		<br>
		<hr>
		<br>

		<div class="list">

			<%
				CartDAO dao = new CartDAO();
				List<CartDTO> cartList = dao.getCartList(3);
				String product_img;
				String product_name;
				int cart_amount;
				int product_price;
				String qureyString = "?test=test";
				int total = 0; 
				
				if (cartList != null) {
					for (int i = 0; i < cartList.size(); i++) {
						//String produdct_img = ((CartDTO)cartList.get(i)).getProduct_img();
						product_img = cartList.get(i).getProduct_img();
						qureyString += "&product_img="+product_img;
						product_name = cartList.get(i).getProduct_name();
						qureyString += "&product_name="+product_name;
						cart_amount = cartList.get(i).getCart_amount();
						qureyString += "&cart_amount="+cart_amount;
						product_price = cartList.get(i).getProduct_price();
						qureyString += "&product_price="+product_price;
						
						total += (cart_amount*product_price);
					}
				}
					%>


			<table class="cart">
				<tr>
					<th colspan="2">상품정보</th>
					<th>수량</th>
					<th>금액</th>
				</tr>

				<c:choose>
					<c:when test="${!empty cartList}">
						<c:forEach items="${cartList}" var="pro">

							<tr align="center">
								<td><img class="pro_img" src="${pro.product_img}"></td>
								<td>${pro.product_name}</td>
								<td class="products_table_price_td"><fmt:formatNumber
										value="${pro.product_price}" pattern="#,### 원" /> | 수량 ${pro.cart_amount} 개
								<td><fmt:formatNumber
										value="${pro.product_price*pro.cart_amount}" pattern="#,### 원" /></td>
							</tr>
						</c:forEach>
						<tr>
							<td style="font-weight :bold" colspan="4"> 총 금액 : <%=total %> 원
							</td>
						</tr>
					</c:when>

					<c:otherwise>
						<tr>
							<td colspan="4">장바구니에 상품이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</section>


	<div class="btn">
		<a href="/books/orderPage/payment.jsp<%=qureyString%>" class="item"><input type="button" value="구매하기"></a>
		<a href="books/detail/detail.jsp"><input type="button" value="취소하기"></a>
	</div>

	<br>
	<br>
	<br>
	

	<%@include file="../common/footer.jsp"%>

</body>
</html>