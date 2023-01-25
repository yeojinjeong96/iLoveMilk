<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
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
    .header{width: 1000px; height: 200px;}
    .header-1{float:left; width: 25%; height: 100%; box-sizing: border-box; padding-top: 160px;}
    .header-2{ 
        float:left;
        width: 15%;
        height: 100%;
        padding-left: 50px;
        padding-top: 50px;
        padding-bottom: 50px;
        box-sizing: border-box;
    }
    .header-3{
        float:left;
        width: 30%;
        height: 100%;
        font-size: xxx-large;
        line-height: 220px;
        padding-left: 20px;
        box-sizing: border-box;
    }
    .header-3>a{text-decoration: none;}
    .header-4{
        float:left;
        width: 30%;
        height: 100%;
        padding-right: 50px;
        box-sizing: border-box;
    }
    .header-4a{
        float:left;
        width: 100%;
        height: 40%;
        line-height: 110px;
        box-sizing: border-box;
    }
    .header-4a>a{padding: 10px; text-decoration: none;}
    .header-4btn{
        float:left;
        width: 100%;
        height: 60%;
        line-height: 200px;
        box-sizing: border-box;
    }
    .header-4btn>img{padding: 15px;}
    .outer{width:1000px;}
</style>
</head>
<body>
    <div class="wrap" align="center">
        <div class="header">
            <div class="header-1">
                <input type="text">
                <button class="btn btn-primary btn-sm">검색</button>
            </div>
            <div class="header-2"><a href="<%= contextPath %>"><img src="resources/images/logo.jpg" width="100px;"></a></div>
            <div class="header-3"><a href="<%= contextPath %>"><b class="text-primary">아이럽우유</b></a></div>
            <div class="header-4">
                <div class="header-4a" align="right">
                
                    <!-- 로그인 전 -->
                    <a href="" class="text-secondary">로그인</a>
                    <a href="" class="text-secondary">회원가입</a>
                    <a href="" class="text-secondary">고객센터</a>

                    <!-- 로그인 후 -->
                    <!-- <a href="" class="text-secondary">로그아웃</a>
                    <a href="" class="text-secondary">고객센터</a> -->
                    
                </div>
                <div class="header-4btn" align="right">
                    <a href=""><img src="resources/images/order.png" style="width:50px"></a>&nbsp;&nbsp;
                    <a href="<%= contextPath %>/cart.pr"><img src="resources/images/cart.png" style="width:50px"></a>&nbsp;
                    <a href=""><img src="resources/images/myPage.png" style="width:50px"></a>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <br>
</body>
</html>