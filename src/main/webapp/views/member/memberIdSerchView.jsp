<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        input::placeholder{font-size: 8px;} 
        .under a{color: black; font-weight: bold; }
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
		<h1 align="center">아이디찾기</h1>
        <p align="center" style="font-size: 10px; color: darkgray;">회원가입시 등록한 정보로 찾을 수 있습니다</p>
        <br>
        <br>
        
        <form action="<%= contextPath %>/idFind.me"  method="post" align="center" name= "findId">
            <input type="text" name="memberName" placeholder="이름을 입력해주세요" required> <br><br>

            <input type="text" name="email" placeholder="가입시 작성한 이메일을 입력해주세요" required><br><br>
            

            <button type="submit">아이디 찾기</button>
            
        </form>
    </div>

    <br><br>
    <div class="under" align="center">
        <a href="<%= contextPath%>/pwdFindPage.me">PW찾기</a> &nbsp;&nbsp;| &nbsp;&nbsp;
        <a href="<%= contextPath %>/loginpage.me">로그인</a>
    </div>
    
    
    
  
    
    <%@ include file="../common/footer.jsp" %> 	 
    
    
</body>
</html>