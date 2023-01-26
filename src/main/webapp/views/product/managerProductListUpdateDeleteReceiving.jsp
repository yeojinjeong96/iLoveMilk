<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.product.model.vo.Product" %>
<% ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer-1{float:left; width: 800px; box-sizing: border-box;}
    .outer-2{width: 700px;}
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
                    <h3><b>상품 조회/수정/삭제/입고</b></h3>
                    <br><br>

                    <table class="outer-2">
                        <tr>
                            <td>
                                <select name="" id="">
                                    <option value="">상품명?</option>
                                    <option value="">상품코드?</option>
                                    <option value="">브랜드?</option>
                                </select>
                                <input type="text">
                                <button class="btn btn-primary btn-sm">검색</button>
                            
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table class="table">
                        <thead class="thead-light">
                            <tr style="text-align: center;">
                                <th width="4%"></th>
                                <th width="9%">번호</th>
                                <th width="9%">코드</th>
                                <th width="27%">상품명</th>
                                <th width="9%">재고</th>
                                <th width="20%">브랜드</th>
                                <th width="11%">수정</th>
                                <th width="11%">입고</th>
                            </tr>
                        </thead>
                        <tbody>

                            <!-- 반복 -->
                            <tr>
                                <td><input type="checkbox"></td>
                                <td align="center">1?</td>
                                <td align="center">22?</td>
                                <td>상품명+용량?</td>
                                <td align="right">11</td>
                                <td align="center">한국야쿠르트</td>
                                <td align="center"><button class="btn btn-primary btn-sm">수정</button></td>
                                <td align="center"><button class="btn btn-primary btn-sm">입고</button></td>
                            </tr>

                        </tbody>
                    </table>

                    <!-- 입고버튼을 눌렀을 경우에만 등장 (모달 & 부트스트랩 접기)
                    <br>
                    <table border="1">
                        <tr>
                            <td>선택한 상품코드</td>
                            <td>코드?</td>
                        </tr>
                        <tr>
                            <td>선택한 상품명</td>
                            <td>브랜드+상품명+용량?</td>
                        </tr>
                        <tr>
                            <td>재고</td>
                            <td>재고?</td>
                        </tr>
                        <tr>
                            <td>입고 수량</td>
                            <td><input type="number">&nbsp;개</td>
                        </tr>
                    </table>
                    <br>
                    <div>
                        <button type="submit" class="btn btn-primary btn-sm">입력</button>
                    </div>
                    -->
                    <br><br>

                    <div>
                        <button type="submit" class="btn btn-primary">상품 삭제</button>
                    </div>
                </div>
                <br><br><br><br><br>
            </div>
        </div>
    </div>
</body>
</html>