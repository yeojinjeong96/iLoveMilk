<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{width: 1000px;}
    .menuTap{
        float: left;
        box-sizing: border-box;
        width: 200px;
        height: 100%; 
        background-color: lightgray;
        line-height: 200%;
        padding: 5px;
    }
    .menu{font-size: large; font-weight: bold;}
    .menuTap a{text-decoration: none; color: white}
    .menuTap a:hover{color: rgb(0, 0, 150);}
</style>
</head>
<body>
    <div class="wrap" align="center">
        <div class="outer">
            <div class="menuTap">
                <br>
                <div>
                    <div class="text-primary menu">회원관리</div>
                    <a href="">회원조회</a><br>
                    <a href="">신고관리</a>
                </div><br>
                <div>
                    <div class="text-primary menu">상품관리</div>
                    <a href="<%= request.getContextPath() %>/insertForm.pr">상품등록</a><br>
                    <a href="<%= request.getContextPath() %>/listUpDeRe.pr">조회/수정/삭제/입고</a><br>
                    <a href="<%= request.getContextPath() %>/stock.pr">상품입출고현황</a>
                </div><br>
                <div>
                    <div class="text-primary menu">주문관리</div>
                    <a href="">구매내역조회</a><br>
                    <a href="">배송관리</a>
                </div><br>
                <div>
                    <a href="" class="text-primary menu">리뷰관리</a>
                </div><br>
                <div>
                    <div class="text-primary menu">레시피관리</div>
                    <a href="">레시피등록/수정/삭제</a><br>
                    <a href="">게시글관리</a><br>
                    <a href="">댓글관리</a>
                </div><br>
                <div>
                    <div class="text-primary menu">고객센터</div>
                    <a href="<%=request.getContextPath()%>">1:1문의관리</a><br>
                    <a href="<%=request.getContextPath()%>/listM.no?cpage=1">공지사항관리</a><br>
                    <a href="<%=request.getContextPath()%>">FAQ관리</a>
                </div><br><br>
            </div>
        </div>
    </div>
</body>
</html>