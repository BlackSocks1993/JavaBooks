<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.mvcProject.member.model.MemberBean" %>  
<%@ page import="com.mvcProject.member.model.MemberDAO" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>회원가입 처리 JSP</title>
   <style>
        #wrap{
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>

</head>
<body>
  <%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
    <%
    // 한글 깨짐을 방지하기 위한 인코딩 처리
            request.setCharacterEncoding("utf-8");
    %>
    
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="com.mvcProject.member.model.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
     <%
     MemberDAO dao = MemberDAO.getInstance();
    
        // 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
        // insertMember()는 회원 정보를 MEMBER 테이블에 저장한다.
        dao.insertMember(memberBean);
        
        
    %>
    
    <div id="wrap">
        <br><br>
        <br><br>
        <br><br>
        <font color="blue"><b><%=memberBean.getName() %></b></font>님 가입을 축하드립니다.
        <br><br>

        <br>
        <input type="button" value="쇼핑몰 둘러보기" onclick="location.href='../view/mainPage.jsp'">
	</div>

</body>
</html>