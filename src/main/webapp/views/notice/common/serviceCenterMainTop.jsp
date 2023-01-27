<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        margin:auto;
        margin-top: 50px;
    }
    .menu-area{background: rgb(222, 241, 248); width: 300px; border-radius: 20px;}
   .menu{display: table-cell; width: 100px; } 
   .menu>a{
        color:rgb(58, 137, 168);
        text-decoration: none;
        font-size: 18px;
        font-weight: bold;
        display:block;
        width:100%;
        height:100%;
        line-height: 50px;
    }
    .menu:hover{
        background: rgb(74, 158, 238);
    }

</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@include file="/views/common/header.jsp" %>
    <div class="outer" align="center" >
        <br>
        <h1>고객센터</h1>
        <br>
        <div class="menu-area">
            <div class="menu">  <a href="<%=contextPath%>/list.no?cpage=1">공지사항</a></div>
            <div class="menu">  <a href="<%=contextPath%>/enroll.q">1:1 문의</a> </div>
            <div class="menu">   <a href="<%=contextPath%>/list.faq?cpage=1">FAQ</a> </div>
        </div>
 
       
   
    </div>
	

</body>
</html>