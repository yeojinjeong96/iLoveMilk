<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer-1{width: 700px;}
    .cart{width: 700px;}
    .sum-area{background-color: lightgray; width:700px; padding-top:20px; padding-bottom:20px;}
    .pay{text-align: right;}
</style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
	
    <div class="wrap" align="center">
        <div class="outer">
            <div class="outer-1">
                <br>
                <h2><b>장바구니</b></h2>
                주문하실 상품명과 수량을 꼭 확인해주세요.
                <br><br><br>
                
                <form action="" method="post">
                    <table class="cart table">
                        <thead class="thead-light" style="text-align: center;">
                            <tr>
                                <th width="4%"><input type="checkbox" checked></th>
                                <th colspan="2" width="57%">상품명</th>
                                <th width="20%">수량</th>
                                <th width="15%">상품금액</th>
                                <th width="4%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 장바구니 안에 상품이 없을 경우 -->
                            <tr>
                                <td colspan="6" align="center">장바구니에 담긴 상품이 없습니다.</td>
                            </tr>

                            <!-- 장바구니 안에 상품이 있을 경우 -->
                                <!-- 반복 -->
                            <tr>
                                <td><input type="checkbox" checked></td>
                                <td width="12%" align="center">사진?</td>
                                <td width="45%">브랜드+상품명+용량?</td>
                                <td align="center">
                                    <button style="width:26px" class="btn btn-secondary btn-sm">+</button>
                                    <input type="text" style="width:26px">
                                    <button style="width:26px" class="btn btn-secondary btn-sm">-</button>
                                </td>
                                <td class="pay">금액?원</td>
                                <td align="center">del?</td>
                            </tr>
                                <!-- 미반복 -->
                            <tr>
                                <td><input type="checkbox" checked></td>
                                <td colspan="5">
                                    <button type="submit" class="btn btn-secondary btn-sm">선택 삭제</button>
                                    <button type="submit" class="btn btn-primary btn-sm">품절 삭제</button>
                                </td>
                            </tr>
                            <!--  -->
                        </tbody>
                    </table>
                    <br><br>

                    <!-- 장바구니 안에 상품이 있을 경우 -->
                    <div class="sum-area">
                        <table>
                            <tr>
                                <td width="23%">총 <b class="">?</b> 개의 상품 금액</td>
                                <th width="17%" style="font-size:large;" class="pay">?원</th>
                                <th width="5%">&nbsp;&nbsp;+</th>
                                <td width="8%">배송비</td>
                                <th width="17%" style="font-size:large;" class="pay">2,500원</th>
                                <th width="5%">&nbsp;&nbsp;=</th>
                                <td width="8%">합계</td>
                                <th width="17%" style="font-size:large;" class="pay">?원</th>
                            </tr>
                        </table>
                    </div>
                    <br><br>

                    <div>
                        <!-- 장바구니 안에 상품이 없을 경우 -->
                        <a href="" class="btn btn-secondary">메인으로</a>

                        <!-- 장바구니 안에 상품이 있을 경우 -->
                        <button type="button" class="btn btn-secondary" onclick="">선택 상품 주문</button>
                        <button type="submit" class="btn btn-primary">전체 상품 주문</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
	<%@ include file="../common/footer.jsp" %>
</body>
</html>