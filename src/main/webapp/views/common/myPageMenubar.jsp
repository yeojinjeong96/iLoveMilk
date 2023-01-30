<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        .menu a{
            color:rgb(68, 78, 142);
            text-decoration: none;
            display:table-cell;
            width:100%;
            height:30px;
            margin:px;
        }
        .menu.mainmenu a{
            color:rgb(12, 16, 132);
            text-decoration: none;
            font-size: 20px;
            font-weight: border;
        }
        .nav{
            margin-left: 10px;
            margin-top: 10px;
           
            height: 600px;
            width: 200px;
        }
    </style>
</head>
<body>
    <div class="nav">
               
        <br>
        <br>
        <div class="nav-area" >
            <div class="menu mainmenu"><a href="">회원정보 관리</a></div> <br>
            <div class="menu"><a href="<%= contextPath %>//myPageUpdate.me">회원정보변경</a></div>
            <div class="menu"><a href="">적립금</a></div>
            <div class="menu"><a href="">리뷰관리</a></div>
            <div class="menu"><a href="">회원탈퇴</a></div>
            <br>
            <br>
            <div class="menu mainmenu"><a href="">주문내역</a></div> <br>
            <div class="menu"><a href="">상품주문내역</a></div>
            <div class="menu"><a href="">찜리스트</a></div>
            <br>
            <br>
            <div class="menu mainmenu"><a href="">레시피관리</a></div> <br>
            <div class="menu"><a href="">내가 쓴 레시피</a></div>
            <div class="menu"><a href="">내가 좋아요한 레시피</a></div>
            <br>
            <br>
            <div class="menu mainmenu"><a href="<%=contextPath%>/list.sv">고객센터</a></div> <br>
            <div class="menu"><a href="<%=contextPath%>/mypage.qa?cpage=1">나의 1:1문의</a></div>
        </div>
    </div >

    
</body>
</html>