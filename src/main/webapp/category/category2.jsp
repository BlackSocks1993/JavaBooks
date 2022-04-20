<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="com.mvcProject.category.*"
    import="java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에세이 | JavaBooks</title>
<link rel="stylesheet" href="../css/header_footer.css">
<link rel="stylesheet" href="../css/category.css">
</head>
<body>
	<%@include file="../common/header.jsp"%>

	<section>
		<div class="category_wrapper">
	          <div class="title">
	            <p>카테고리</p>
	          </div>
	          <ul>
	            <li><a href="category1.jsp">소설/시</a></li>
	            <li><a href="category2.jsp">에세이</a></li>
	          </ul>
		</div>
		
			
		<div class="fiction_wrapper">
			<div class="mainTitle">에세이</div>
			<div class="detail_wrapper">
				<%
				CategoryDAO dao = new CategoryDAO();

				List<CategoryDTO> categoryList = dao.selectCategoryList2();
				if (categoryList != null) {
					for (int i = 0; i < categoryList.size(); i++) {
						int product_no = categoryList.get(i).getProduct_no();
						String product_name = categoryList.get(i).getProduct_name();
						String product_author = categoryList.get(i).getProduct_author();
						String product_publisher = categoryList.get(i).getProduct_publisher();
						Date product_date = categoryList.get(i).getProduct_date();
						String product_detail = categoryList.get(i).getProduct_detail();
						String product_img = categoryList.get(i).getProduct_img();
						int product_price = categoryList.get(i).getProduct_price();
					%>
					<div class="detail_items">
						<div class="items_image">
							<a href="../detail/detail.jsp?product_no=<%=product_no%>&product_img=<%=product_img%>&product_name=<%=product_name%>&product_author=<%=product_author%>&product_publisher=<%=product_publisher%>&product_date=<%=product_date%>&product_detail=<%=product_detail%>&product_price=<%=product_price%>"><img src="<%=product_img%>" alt=""></a>
						</div>
						<div class="items_info">
							<ul>
								<li class="book_name"><a href="../detail/detail.jsp?product_no=<%=product_no%>&product_img=<%=product_img%>&product_name=<%=product_name%>&product_author=<%=product_author%>&product_publisher=<%=product_publisher%>&product_date=<%=product_date%>&product_detail=<%=product_detail%>&product_price=<%=product_price%>"><%=product_name%></a></li>
								<li><%=product_author%></li>
								<li><%=product_publisher%></li>
								<li><%=product_date%></li>
								<br>
								<li><%=product_price%>원</li>
							</ul>
						</div>
						<div class="items_text">
						<%=product_detail%>
						</div>
					</div>
					<%
					}
				} 
				%>
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