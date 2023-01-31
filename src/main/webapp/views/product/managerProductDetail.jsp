<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.milk.product.model.vo.Product" %>
<% Product p = (Product)request.getAttribute("p"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap2{width: 1000px;}
    .outer-1{float:left; width: 800px; box-sizing: border-box;}
    .outer-2{width: 700px;}
    .productDetailList th{text-align: center;}
    #imgArea{display: flex; align-items: center;}
</style>
</head>
<body>
    <%@ include file="../common/managerHeader.jsp" %>
    <%@ include file="../common/managerMenubar.jsp" %>

    <div class="wrap1" align="center">
        <div class="wrap2">
            <div class="outer-1" align="center">
                <div class="outer-2">
                    <br>
                    <h3><b>상품 상세조회</b></h3>
                    <br><br>

                    <table class="productDetailList table-striped">
                        <tr height="50px">
                            <td rowspan="10" width="40%"><div id="imgArea"><img src="<%= contextPath %>/<%= p.getProductImg() %>" width="280px"></div></td>
                            <th width="25%">상품코드&nbsp;</th>
                            <td width="35%"><%= p.getProductNo() %></td>
                        </tr>
                        <tr height="50px">
                            <th>1차 카테고리</th>
                            <td><%= p.getfCategory() %></td>
                        </tr>
                        <tr height="50px">
                            <th>2차 카테고리</th>
                            <td><%= p.getsCategory() %></td>
                        </tr>
                        <tr height="50px">
                            <th>상품명</th>
                            <td><%= p.getProductName() %></td>
                        </tr>
                        <tr height="50px">
                            <th>용량</th>
                            <td><%= p.getCapacity() %> (mL/g)</td>
                        </tr>
                        <tr height="50px">
                            <th>브랜드</th>
                            <td><%= p.getBrand() %></td>
                        </tr>
                        <tr height="50px">
                            <th>판매 가격</th>
                            <td><%= p.getPrice() %></td>
                        </tr>
                        <tr height="50px">
                            <th>재고</th>
                            <td><%= p.getStock() %> 개</td>
                        </tr>
                        <tr height="200px">
                            <th height="100px">상품 상세정보</th>
                            <td><div style="margin-right:5px"><%= p.getProductInfo() %></div></td>
                        </tr>
                        <tr height="50px">
                            <th>상품 등록일</th>
                            <td><%= p.getEnrollDate() %></td>
                        </tr>
                    </table>
                    <br><br>

                    <div>
                        <button type="button" class="btn btn-primary updateBtn">수정</button>
                        <a href="<%= contextPath %>/listUpDeRe.pr?cp=1" type="submit" class="btn btn-secondary">이전으로</a>
                    </div>
                </div>
                <br><br><br><br><br>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            // 수정 클릭시 상품수정페이지로 이동
            $(".updateBtn").click(function(){
                location.href = '<%= contextPath %>/updateForm.pr?no=' + <%= p.getProductNo() %>
            })
        });
    </script>

</body>
</html>