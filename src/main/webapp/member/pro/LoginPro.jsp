<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.mvcProject.member.model.MemberDAO" %>
<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8"); 
        
        String mail= request.getParameter("email");
        String pw = request.getParameter("password");
        
        // DB에서 아이디, 비밀번호 확인
        MemberDAO dao = MemberDAO.getInstance();
        int check = dao.loginCheck(mail, pw);
        
        String msg = "";
        
        if(check == 1)    // 로그인 성공
        { 
            session.setAttribute("sessionID", mail);
            msg = "../view/mainPage.jsp";
        }
        else if(check == 0) // 비밀번호가 틀릴경우
        {
            msg = "../view/LoginForm.jsp?msg=0";
        }
        else    // 아이디가 틀릴경우
        {
        	response.sendRedirect(msg="../view/LoginForm.jsp?msg=-1");
        }

        response.sendRedirect(msg);
    %>
</body>
</html>
