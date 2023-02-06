<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content{height: 500px;}
    .content-1{
		margin-top: 50px;
		margin-left: 200px;
		box-sizing: border-box;
		float:left;
	}
	.content-2{
		margin-top: 100px;
		margin-left: 50px;
		box-sizing: border-box;
		float:left;
	}
	.content-2 input{height: 60px; width: 250px; margin-top: 10px;}
	.content-3{margin-top: 10px;}
</style>
</head>
<body>
	<%@ include file="../common/managerHeader.jsp" %>

	<div class="wrap" align="center">
		<div class="outer">
			<div class="content">
				<br><br>
				<div class="content-1">
					<a href="<%= contextPath %>"><img src="resources/images/logo.jpg" width="250px"></a>
				</div>
				<div class="content-2">
					<form action="<%= contextPath %>/login.ma" method="post">
						<div><input type="text" id="managerId" name="managerId" placeholder="아이디" required></div>
						<div><input type="password" id="managerPwd" name="managerPwd" placeholder="비밀번호" required></div>
						<div class="content-3"><button style="width:250px" type="submit" class="btn btn-primary btn-lg">로그인</button></div>
					</form>
				</div>
			</div>
		</div>
		<br><br><br><br><br>
	</div>
</body>
</html>