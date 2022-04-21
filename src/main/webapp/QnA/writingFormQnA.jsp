<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.mvcProject.QnA.QnADTO"
    import="java.lang.StringBuffer"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="../css/header_footer.css">
	<link rel="stylesheet" href="../css/writingFormQnA.css">
</head>
<body>
	<%@include file="../common/header.jsp"%>

	<section class="writing_container">
		<c:choose>
			<c:when test="${empty dto}">
				<form action="post.do" method="post">
			</c:when>
			<c:when test="${not empty dto}">
				<form action="edit.do?qna_no=${dto.getQna_no()}" method="post">
			</c:when>
		</c:choose>
        
            <p>상담을 원하는 분야를 선택해주세요.</p>
       			<label><input type="radio" name="cType" value="order">주문 / 배송</label>
                <label><input type="radio" name="cType" value="return">반품 / 교환</label>
                <label><input type="radio" name="cType" value="refund">환불</label>
                <label><input type="radio" name="cType" value="other">기타</label>
            <div class="counselField">
                
            </div>
            
            <c:choose>
            	<c:when test="${empty dto}">
            		<input type="text" name="title" placeholder="제목을 입력하세요">
            	</c:when>
            	<c:when test="${not empty dto}">
            		<input type="text" name="title" value="${dto.getQna_title()}">
            	</c:when>
            </c:choose>
            
            <c:choose>
            	<c:when test="${empty dto}">
            		<textarea name="content" placeholder="내용을 입력해주세요!"></textarea>
            	</c:when>
            	<c:when test="${not empty dto}">
            		<%
           				QnADTO dto = (QnADTO) request.getAttribute("dto");
           				StringBuffer sb = new StringBuffer(dto.getQna_content());
           				
           				
           				if(sb.indexOf("<") != -1 && sb.lastIndexOf(">") != -1) {
           					sb.delete(sb.indexOf("<"), sb.indexOf("<") + 3);
           					sb.delete(sb.lastIndexOf(">") - 3, sb.lastIndexOf(">") + 1);
           				}
           				request.setAttribute("resultStr", sb.toString().replaceAll("</p><p>", "\r\n").trim());
            		%>
            		<textarea name="content" placeholder="내용을 입력해주세요!">${resultStr}</textarea>
            	</c:when>
            </c:choose>
            
            
            <div class="bnt_set">
                <button>취소</button>
                <input type="submit" value="제출">
            </div>
        </form>
    </section>
	
	<%@include file="../common/footer.jsp"%>
	
	<script>
		let qType = '${dto.getQna_type()}';
		console.log(qType);
		if (qType !== null && qType) {
			switch(qType) {
				case '주문/배송':
					document.querySelector('input[value="order"]').setAttribute('checked', '');
					break;
				case '반품/교환':
					document.querySelector('input[value="return"]').setAttribute('checked', '');
					break;
				case '환불':
					document.querySelector('input[value="refund"]').setAttribute('checked', '');
					break;
				case '기타':
					document.querySelector('input[value="other"]').setAttribute('checked', '');
			}
		}
	</script>
</body>
</html>