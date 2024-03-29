<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.milk.manager.model.vo.Manager" %>
<% 
	String contextPath = request.getContextPath();
	// "/milk"
	
	Manager loginManager = (Manager)session.getAttribute("loginManager");
	// 로그인 시도 전 managerHeader.jsp 로딩시 : null
	// 로그인 성공 후 managerHeader.jsp 로딩시 : 로그인한 회원의 정보가 담겨있는 Manager객체
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	//알럿
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .header{width: 1000px; height: 80px;}
    .header>div{
        height: 100%;
        box-sizing: border-box;
        float: left;
    }
    .header-1{width: 6%;}
    .header-1>img{margin-top: 15px;}
    .header-2{width: 54%;  text-align: left;}
    .header-2>h2{margin-left: 20px; margin-top: 30px;}
    .header-3{width: 40%; text-align: right; padding-top: 15px;}
    .header-3>a{text-decoration: none;}
    .outer{width:1000px;}
</style>
</head>
<body>
	<%if(alertMsg != null){ %>
	<script>
		alert('<%=alertMsg%>');
	</script>
	<%session.removeAttribute("alertMsg"); %>
	<%} %>

    <div class="wrap" align="center">
        <div class="header">
            <div class="header-1"><img src="resources/images/logo.jpg" style="width: 60px;"></div>
            <div class="header-2"><h2 class="text-primary"><a href="<%= contextPath %>/main.ma" style="text-decoration: none;"><b>아이럽우유 관리자</b></a></h2></div>
            
            <% if(loginManager != null){ %>
	            <!-- 로그인 후 -->
	            <div class="header-3">
	            	<b><%= loginManager.getManagerName() %></b> 님
	            	&nbsp;&nbsp;
	                <a href="<%= request.getContextPath() %>/logout.ma" class="text-secondary">로그아웃</a>
	                &nbsp;&nbsp;
	                <a href="<%= request.getContextPath() %>/main.ma" class="text-secondary">메인페이지</a>
	            </div>
	        <% } %>
        </div>
    </div>
    <hr>
</body>
</html>