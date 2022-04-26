<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.mvcProject.orderPage.*" import="java.util.*" import="java.sql.Date"
    import="com.mvcProject.product.*" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바북스 | 주문 상세 페이지</title>

<link rel="stylesheet" href="../css/payment.css">

<link rel="stylesheet" href="../css/header_footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<%

/* detail.jsp에서 쿼리 스트링에서 받아오는 값 */

/* product_price라는 key값을 가져오는데 key값이 똑같으면 배열로 온다 */
String[] arr_product_price = request.getParameterValues("product_price");
String[] arr_product_name = request.getParameterValues("product_name");
String[] arr_product_img = request.getParameterValues("product_img");
String[] arr_product_author = request.getParameterValues("product_author");
String[] arr_product_publisher = request.getParameterValues("product_publisher");
String[] arr_product_date = request.getParameterValues("product_date");
String[] arr_product_detail = request.getParameterValues("product_detail");

/* 결제정보div에 넣을 상품 가격 값 가져오기 */
String product_price = request.getParameter("product_price");
int total_price = Integer.parseInt(request.getParameter("product_price")) + 2500;

/* 최종결제금액을 위한 변수 sum 초기화 */
int sum = 0;

/* 배열로 온것들을 리스트로 담는다 */
List productsList = new ArrayList();
for(int i=0; i<arr_product_price.length; i++){
	ProductDTO pDTO = new ProductDTO();
	pDTO.setProduct_price(Integer.parseInt(arr_product_price[i]));
	pDTO.setProduct_name(arr_product_name[i]);
	pDTO.setProduct_img(arr_product_img[i]);
	pDTO.setProduct_author(arr_product_author[i]);
	pDTO.setProduct_publisher(arr_product_publisher[i]);
	pDTO.setProduct_date(Date.valueOf(arr_product_date[i]));
	pDTO.setProduct_detail(arr_product_detail[i]);

	sum += pDTO.getProduct_price();
	
	productsList.add(pDTO);
}

request.setAttribute("productsList", productsList);


%>


</head>
<body>
	<nav>
		<%@include file="../common/header.jsp"%>
	</nav>
	<form action="/books/order/addOrder.do" method="post">
	<div id="container">
		<section>
			<div>
				<h1>주문/결제 페이지 입니다.</h1>
				<span>배송/결제 정보를 정확히 입력해주세요.</span>
			</div>
			
			<div>
				<div id="purchaser_info">
					<h2>*구매자 정보*</h2>
					<table>
						<tr>
							<td>주문자</td>
							<td><%= session.getAttribute("member_name") %>
							 | <%= session.getAttribute("member_phone") %>
							 | <%= session.getAttribute("member_email") %></td>
						</tr>
					</table>
				</div>

				
				<div>
					<h2>*배송정보*</h2>
						<table>
							<tr>
								<td>이름</td>
								<td><input class="input" type="text" name="order_name"></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input class="input" type="text" name="order_phone"><br></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input class="input" type="text" name="order_addr"><br></td>
							</tr>
							<tr>
								<td>배송메모</td>
								<td>
									<textarea id="textarea" name="order_memo"
												cols="50" rows="5" placeholder='배송메모를 입력해주세요.'>
									</textarea><br>
								</td>
							</tr>
						</table>
				</div>
				
				<h2>*결제하기*</h2>
				
				<div>
					
					<table class="product_info">
						<tr>
							<th colspan="2">상품정보</th>
							<th>판매가</th>
						</tr>
						
						<c:choose>
							<c:when test="${!empty productsList}">
								
								<c:forEach items="${productsList}" var="pro" >
									<tr align="center">
										<td><img class="pro_img" src="${pro.product_img}"></td>
										<td>${pro.product_name }</td>
										<td class="products_table_price_td">
											<fmt:formatNumber value="${pro.product_price}" pattern="#,### 원" /> | 수량 1 개
											<input type="hidden" name="product_price" value="${pro.product_price}">
											<input type="hidden" name="order_product_quantity" value="1">
											<input type="hidden" name="product_name" value="${pro.product_name}">
											<input type="hidden" name="product_img" value="${pro.product_img}">
										</td>
									</tr>							
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								<tr>
									<td colspan="3">등록된 자료가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						
					</table>
				</div>
			</div>
			
			
		</section>
		
		<aside class="total_info">
			<div class="total_info_div">
				<h2 id="pay_info">*결제정보*</h2>
				<div class="total_info_price_div">
					<ul>
						<li>
							<span class="price_span_label">상품 금액 : </span>
							<span class="totalPrice_span"><fmt:formatNumber value="<%= product_price %>" pattern="#,### 원" /></span>
						</li>
						<li>
							<span class="price_span_label">배송비 : </span>
							<span class="delivery_price_span"><fmt:formatNumber value="2500" pattern="#,### 원" /></span>
						</li>
						<li class="price_total_li">
							<strong class="price_span_label total_price_label">최종 결제 금액</strong>
							<strong class="strong_red">
								<span class="total_price_red finalTotalPrice_span">
									<fmt:formatNumber value="<%= total_price %>" pattern="#,### 원" />
								</span>
							</strong>
						</li>
					</ul>
				</div>
			

			<div class="pay_option">
				<h3 id="h3_pay_option">결제방법</h3>
				<input type="radio" name="payment_method" value="신용카드">신용카드
				<input type="radio" name="payment_method" value="무통장 입금">무통장 입금
			</div>
			
			<div class="click_button_div">
				<input type="submit" value="결제하기">
				<!-- 주문한 상품 목록 사이즈 값을 controller에서 for문 돌릴 예정 -->
				<input type="hidden" name="productsList_size" value="<%= productsList.size() %>">
				<a href="/books/detail/detail.jsp?product_price=
					<%=arr_product_price[0]%>&product_name=<%=arr_product_name[0]%>&product_date=<%=arr_product_date[0]%>
					&product_img=<%=arr_product_img[0]%>&product_author=<%=arr_product_author[0]%>
					&product_publisher=<%=arr_product_publisher[0]%>&product_detail=<%=arr_product_detail[0]%>">
					<input type="button" value="취소하기">
				</a>
			</div>
			</div>
		</aside>
		</div>
	</form>
	
<footer>
		<%@include file="../common/footer.jsp"%>
</footer>
</body>
</html>