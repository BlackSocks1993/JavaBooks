<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <%
        request.setCharacterEncoding("utf-8"); 
    %>
    
    <title>로그인</title>
     <script type="text/javascript">
    
     //빈칸체크
        function blankCheck()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.email.value)
            {
                alert("이메일을 입력하세요");    
                inputForm.email.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
        }
        
    		

       </script>
       
        <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
             }
             
             
            table{
            margin-left:auto; 
            margin-right:auto;
            border:1px solid powderblue
        }
        
        td{
            border:1px solid powderblue
        }
        
        #title{
            background-color:powderblue
        }
       
        </style>
</head>
<body>
<div id="wrap">
        <br><br>
        <b><font size="6" >로그인</font></b>
        <br><br><br>


<form name="loginInfo" method="post" action="../pro/LoginPro.jsp" 
        onsubmit="return blankCheck()">
    
    <table>
        <tr>
            <td bgcolor="powderblue">이메일</td>
            <td><input type="text" name="email" maxlength="30"></td>
        </tr>
        <tr>
            <td bgcolor="powderblue">비밀번호</td>
            <td><input type="password" name="password" maxlength="20"></td>
        </tr>
    </table>
    <br>
    <input type="submit" value="로그인"/>
    <input type="button" value="회원가입" onclick="javascript:window.location='JoinForm.jsp'" />
</form>

<% 

    String msg=request.getParameter("msg");
    
	//비밀번호err
    if(msg!=null && msg.equals("0")) 
    {
        out.println("<br>");
        
        %>
        <script> alert("비밀번호를 확인해주세요.");</script>
        <% 
    }
	
    //로그인 성공시
    else if(msg!=null&&msg.equals("1"))
    {
    	out.println("<br>");
    	%>

        <script> alert(memberBean.getName()+"님 환영합니다.");</script>
        <%
    }
  //이메일 err
    else if(msg!=null && msg.equals("-1"))
    {    
        out.println("<br>");
        %>
       <script> alert("이메일을 확인해주세요.");</script>
       <%
    }
    %>
</div>    

</body>
</html>