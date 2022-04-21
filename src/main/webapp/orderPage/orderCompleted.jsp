<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" import="com.mvcProject.product.*" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바북스 | 주문 완료 페이지</title>
<link rel="stylesheet" href="../css/orderCompleted.css">
<link rel="stylesheet" href="../css/header_footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

<%
/* 주문 상품 정보 */
String[] arr_product_price = request.getParameterValues("product_price");
String[] arr_product_name = request.getParameterValues("product_name");
String[] arr_product_img = request.getParameterValues("product_img");

/* 결제 금액 */
String product_price = request.getParameter("product_price");
int total_price = Integer.parseInt(request.getParameter("product_price")) + 2500;

/* 배열로 온것들을 리스트로 담는다 */
List productsList = new ArrayList();
for(int i=0; i<arr_product_price.length; i++){
	ProductDTO pDTO = new ProductDTO();
	pDTO.setProduct_price(Integer.parseInt(arr_product_price[i]));
	pDTO.setProduct_name(arr_product_name[i]);
	pDTO.setProduct_img(arr_product_img[i]);

	productsList.add(pDTO);
}

request.setAttribute("productsList", productsList);

%>
	<nav>
		<%@include file="../common/header.jsp"%>
	</nav>
	
	<div id="container">
	
		<section>
			<div class="message">
				<span class="completed_message"><strong>고객님의 주문이 완료되었습니다.</strong></span><br>
				<span class="completed_message">자바북스를 이용해주셔서 감사합니다.</span><br>
				고객님의 주문번호는 ${order_no} 입니다.
			</div>
			
			
			<div class="wrap_tb">
				<table class="tb_info" border="1">
					<tr class="tb_info_tr">
						<td>배송지 정보</td>
						<td>
							<%= request.getParameter("order_phone") %><br>
							<%= request.getParameter("order_name") %><br>
							<%= request.getParameter("order_addr") %><br>
						
						</td>
					</tr>
					<tr class="tb_info_tr">
						<td>배송메모</td>
						<td><%= request.getParameter("order_memo") %></td>
					</tr>
					<tr class="tb_info_tr">
						<td>결제금액</td>
						<td><fmt:formatNumber value="<%= total_price %>" pattern="#,### 원" /></td>
					</tr>
				</table>
			</div>
			
			
			
		</section>
		
		<aside class="order_detail">
			<div>
				
					<c:choose>
						<c:when test="${!empty productsList}">
							<c:forEach items="${productsList}" var="pro" >
								<div id="flex_container">
								
									<div>
										<img class="pro_img" src="${pro.product_img}">
									</div>
									<div class="container_sec_ch">
										<div>
											${pro.product_name }
										</div>
										<div>
											<fmt:formatNumber value="${pro.product_price}" pattern="#,### 원" /> | 수량 1개
										</div>
									</div>
									
								</div>	
							</c:forEach>
						</c:when>
						
						<c:otherwise>
								<td colspan="3">등록된 자료가 없습니다.</td>
						</c:otherwise>
					</c:choose>
					
			</div>
			
			<div class="payment_confirm_message">
				<table class="tb_pay">
					<tr>
						<td>상품금액</td>
						<td><fmt:formatNumber value="<%= product_price %>" pattern="#,### 원" /></td>
					</tr>
					<tr>
						<td>배송비</td>
						<td><fmt:formatNumber value="2500" pattern="#,### 원" /></td>
					</tr>
					<tr>
						<td>결제수단</td>
						<td><%= request.getParameter("payment_method") %></td>
					</tr>
				</table>
			<div class="total_payment">
				결제 금액<br>
				<fmt:formatNumber value="<%= total_price %>" pattern="#,### 원" />
			</div>
			</div>
		</aside>
	</div>
	
	<footer>
		<%@include file="../common/footer.jsp"%>
	</footer>
</body>
</html>