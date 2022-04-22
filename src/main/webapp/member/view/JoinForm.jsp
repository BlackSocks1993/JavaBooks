<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

<script type="text/javascript">
    
        // 빈칸 체크
        function blankCheck()
        {
        	if(!document.userInfo.name.value){
                alert("이름을 입력하세요.");
                return false;
            }
        	
            if(!document.userInfo.email.value){
                alert("이메일을 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.passwordcheck.value){
                alert("비밀번호를 확인해주세요.");
                return false;
            }
            
            if(!document.userInfo.phone.value){
                alert("연락처를 입력해주세요.");
                return false;
            }
            
            if(!document.userInfo.address.value){
                alert("주소를 입력해주세요.");
                return false;
            }

            // if (비밀번호 != 비밀번호 확인) 
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
    </script>

</head>


<body>
<%@include file="../common/header.jsp"%>

    <div id="wrap">
        <br><br>
        <b><font size="6" >회원가입</font></b>
        <br><br><br>
        
      
        <form method="post" action="../pro/JoinPro.jsp" name="userInfo" onsubmit="return blankCheck()">
            <table>
            
        	    <tr>
                    <td id="title">이름<font color="red">*</font></td>
                    <td>
                        <input type="text" name="name" maxlength="20">
                    </td>
                </tr>
                

                <tr>
                    <td id="title">이메일<font color="red">*</font></td>
                    <td>
                        <input type="text" name="email" maxlength="50">                  
                       
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호<font color="red">*</font></td>
                    <td>
                        <input type="password" name="password" maxlength="20">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인<font color="red">*</font></td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="20">
                    </td>
                </tr>
                    

                    
                <tr>
                    <td id="title">연락처<font color="red">*</font></td>
                    <td>
                        <input type="text" name="phone" />
                    </td>
                </tr>
                
                <tr>
                    <td id="title">주소<font color="red">*</font></td>
                    <td>
                        <input type="text" size="50" name="address"/>
                    </td>
                </tr>
                
                <tr>
                    <td id="title">상세주소</td>
                    <td>
                        <input type="text" size="50" name="betterAdr"/>
                    </td>
                </tr>
                
            </table>
            <br>
            <input type="submit" value="가입"/>  
            <input type="button" value="취소" onclick="javascript:window.location='LoginForm.jsp'">
        </form>
    </div>

<%@include file="../common/footer.jsp"%>
</body>
</html>