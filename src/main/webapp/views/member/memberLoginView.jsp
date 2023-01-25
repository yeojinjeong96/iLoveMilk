<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberLoginView</title>
    <style>
        .under a{color: black; font-weight: bold;}
        .outer{
        weight: 700px;
         margin:auto;
        margin-top:50px;
        }
    </style>
    
</head>
<body>

	<%@ include file="../common/header.jsp" %> 	
   <div class="outer" align="center">
   
   		 
		

        <br>
		<h1 align="center">로그인</h1>
        <p align="center" style="font-size: 10px; color: darkgray;">회원로그인을 하시면 각종 혜택 및 정보를 제공 받으실 수 있습니다.</p>
        <br>
        <br>
        <form action="<%= contextPath %>/login.me" method="post">
        
            <input type="text" placeholder="아이디" required> <br><br>

            <input type="password" placeholder="비밀번호" required><br><br>
            
            <p><input type="checkbox"> 아이디저장</p>

            <button type="submit">로그인</button>  
            
            <br><br>
            
             <div class="under" align="center">
		        <a onclick="enrollPage();">회원가입</a> &nbsp;&nbsp;| &nbsp;&nbsp;
		        <a>ID찾기</a> &nbsp;&nbsp;| &nbsp;&nbsp;
		        <a>PW찾기</a>
		    </div>
            
            
        </form>
    </div>

	<%@ include file="../common/footer.jsp" %> 	 
    
   
</body>
</html>