<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.mvcProject.member.model.MemberDAO" %>
<html>
<head>
    <title>�α��� ó�� JSP</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8"); 
        
        String mail= request.getParameter("email");
        String pw = request.getParameter("password");
        
        // DB���� ���̵�, ��й�ȣ Ȯ��
        MemberDAO dao = MemberDAO.getInstance();
        int check = dao.loginCheck(mail, pw);
        
        String msg = "";
        
        if(check == 1)    // �α��� ����
        { 
            session.setAttribute("sessionID", mail);
            msg = "../view/mainPage.jsp";
        }
        else if(check == 0) // ��й�ȣ�� Ʋ�����
        {
            msg = "../view/LoginForm.jsp?msg=0";
        }
        else    // ���̵� Ʋ�����
        {
        	response.sendRedirect(msg="../view/LoginForm.jsp?msg=-1");
        }

        response.sendRedirect(msg);
    %>
</body>
</html>
