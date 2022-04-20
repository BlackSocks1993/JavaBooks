<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<nav>
		<%@include file="../common/header.jsp"%>
	</nav>
	
	<div id="container">
	
		<section>
			<div class="message">
				<span class="completed_message"><strong>고객님의 주문이 완료되었습니다.</strong></span><br>
				<span class="completed_message">자바북스를 이용해주셔서 감사합니다.</span><br>
				고객님의 주문번호는 order_num 입니다.
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
						<td><%= request.getParameter("final_total_price") %></td>
					</tr>
				</table>
			</div>
			
			
			
		</section>
		
		<aside class="order_detail">
			<div>
				<table>
					<tr>
						<td><img src="images/sample1.png"></td>
						<td>
							<table>
								<tr>
									<td>책 제목</td>
								</tr>
								<tr>
									<td>가격</td>
								</tr>
								<tr>
									<td>수량 : 1개</td>
								</tr>
							</table>
						
						</td>
					</tr>
				</table>
			</div>
			
			<div class="payment_confirm_message">
				<table class="tb_pay">
					<tr>
						<td>상품금액</td>
						<td>40,000원</td>
					</tr>
					<tr>
						<td>배송비</td>
						<td>3,500원</td>
					</tr>
					<tr>
						<td>결제수단</td>
						<td><%= request.getParameter("payment_method") %></td>
					</tr>
				</table>
			<div class="total_payment">
				결제 금액<br>
				13,500원
			</div>
			</div>
		</aside>
	</div>
	
	<footer>
		<%@include file="../common/footer.jsp"%>
	</footer>
</body>
</html>