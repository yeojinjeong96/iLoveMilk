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
                    <a href="<%= request.getContextPath() %>/memList.ma?cpage=1">회원조회 및 등급관리</a><br>
                    <a href="<%= request.getContextPath() %>/repList.ma?cpage=1">신고관리</a>
                </div><br>
                <div>
                    <div class="text-primary menu">상품관리</div>
                    <a href="<%= request.getContextPath() %>/insertForm.pr">상품등록</a><br>
                    <a href="<%= request.getContextPath() %>/listUpDeRe.pr?cp=1">조회/수정/삭제/입고</a><br>
                    <a href="<%= request.getContextPath() %>/stock.pr?cp=1">상품입출고현황</a>
                </div><br>
                <div>
                    <div class="text-primary menu">주문관리</div>
                    <a href="<%= request.getContextPath() %>//purchaseList.ma?cpage=1">구매내역조회</a><br>
                    <a href="<%= request.getContextPath() %>/orderList.ma?cpage=1">배송관리</a>
                </div><br>
                
                <div>
                    <div class="text-primary menu">레시피관리</div>
                    <a href="<%= request.getContextPath() %>/enrollFormM.re?cpage=1">레시피등록/수정/삭제</a><br>
                    <a href="<%= request.getContextPath() %>/recipeDeleteListM.re?cpage=1">게시글관리</a><br>
                    <a href="<%= request.getContextPath() %>/replyM.re?cpage=1">댓글관리</a>
                </div><br>
                <div>
                    <div class="text-primary menu">고객센터</div>
                    <a href="<%=request.getContextPath()%>/listM.qa?cpage=1">1:1문의관리</a><br>
                    <a href="<%=request.getContextPath()%>/listM.no?cpage=1">공지사항관리</a><br>
                    <a href="<%=request.getContextPath()%>/listM.faq?cpage=1">FAQ관리</a>
                </div><br><br>
            </div>
        </div>
    </div>
</body>
</html>