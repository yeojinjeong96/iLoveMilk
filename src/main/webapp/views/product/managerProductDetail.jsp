<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <tr>
                            <td rowspan="7" width="40%"><img src="../../resources/images/logo.jpg"></td>
                            <th width="25%">상품코드&nbsp;</th>
                            <td width="35%">코드?</td>
                        </tr>
                        <tr>
                            <th>상품명&nbsp;</th>
                            <td>상품명?</td>
                        </tr>
                        <tr>
                            <th>용량&nbsp;</th>
                            <td>?(mL/g)</td>
                        </tr>
                        <tr>
                            <th>브랜드&nbsp;</th>
                            <td>브랜드?</td>
                        </tr>
                        <tr>
                            <th>판매 가격&nbsp;</th>
                            <td>가격?</td>
                        </tr>
                        <tr>
                            <th>재고&nbsp;</th>
                            <td>재고?</td>
                        </tr>
                        <tr>
                            <th height="100px">상품 상세정보&nbsp;</th>
                            <td>상세정보?</td>
                        </tr>
                    </table>
                    <br><br>

                    <div>
                        <button type="submit" class="btn btn-secondary">이전으로</button>
                    </div>
                </div>
                <br><br><br><br><br>
            </div>
        </div>
    </div>
</body>
</html>