<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.milk.member.model.vo.Member" %>
    
<%
	Member findPwd = (Member)session.getAttribute("findPwd");
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
		<h1 align="center"> 비밀번호 변경 </h1>
        <p align="center" style="font-size: 10px; color: darkgray;">새로운 비밀번호를 입력해주세요</p>
        <br>
        <br>
        
      <%
    	String memberId = findPwd.getMemberId();
		int memberNo = findPwd.getMemberNo();
		String memberPwd = findPwd.getMemberPwd();
		String memberName = findPwd.getMemberName();
    	String email = findPwd.getEmail();
    	%>
    </div>
    <div align="center">
      <form action="<%=contextPath %>/updateSerchPwd.me" method="post">
      
			<input type="hidden" name ="memberId" value="<%= memberId %>">
			<input type="hidden" id="password" name="memberPwd" value="<%= memberPwd %>" required>
					                   
			<table>
			
			<tr>
			<td>변경할 비밀번호</td>
			<td><input type="password" id="passwordchange" name="updatePwd"  placeholder="영소문/숫자를 조합하세요(8~20자)" required></td>
			</tr>
			
			<tr>
			<td>변경할 비밀번호 확인</td>
			<td><input type="password" id="passwordchange" placeholder="새 비밀번호 확인" required></td>
			</tr>
			
			</table>
			
			<br>
								                    
			<button type="submit" class = "btn btn-secondary btn-sm">비밀번호 변경</button>
								                
		</form>
    </div>

    <br><br>
    
    
    <%@ include file="../common/footer.jsp" %> 	 
    
</body>
</html>