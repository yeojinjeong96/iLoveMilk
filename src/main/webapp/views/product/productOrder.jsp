<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer-1{width: 700px;}
    .info{width: 700px;}
    .sum-area{background-color: lightgray; width:700px; padding-top:20px; padding-bottom:20px;}
    .info span{color: red;}
    .opt th, .pay{text-align: right;}
    .agree{width:490px;}
    .star{color: red;}
</style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>

	<div class="wrap" align="center">
        <div class="outer">
            <div class="outer-1">
                <br>
                <h2><b>주문서 작성</b></h2>
                주문하실 상품명과 수량을 꼭 확인해주세요.
                <br><br><br>
                
                <form action="" method="post">
                    <h4><b>주문 상세 내역</b></h4>
                    <br>
                    <table class="info table">
                        <thead class="thead-light" style="text-align: center;">
                            <tr>
                                <th width="15%"></th>
                                <th width="50%">상품명</th>
                                <th width="20%">수량</th>
                                <th width="15%">상품금액</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 반복 -->
                            <tr>
                                <td align="center">상품사진?</td>
                                <td>브랜드+상품명+용량?</td>
                                <td align="center">
                                    <button style="width:26px" class="btn btn-secondary btn-sm">+</button>
                                    <input type="text" style="width:26px">
                                    <button style="width:26px" class="btn btn-secondary btn-sm">-</button>
                                </td>
                                <td class="pay">금액?원</td>
                            </tr>

                        </tbody>
                    </table>
                    <br><br>
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
                    <br><br><br>
                    <h4><b>주문자 정보</b></h4>
                    <br>
                    <span class="star">*</span> 은 필수 입력사항입니다.
                    <table class="info opt table table-hover">
                        <tr>
                            <th width="30%"><span>*</span> 이름&nbsp;</th>
                            <td width="70%"><input type="text" required></td>
                        </tr>
                        <tr>
                            <th><span>*</span> 전화번호&nbsp;</th>
                            <td><input type="text" required></td>
                        </tr>
                        <tr>
                            <th><span>*</span> 이메일&nbsp;</th>
                            <td>
                                <input type="email" required>
                                <select name="" id="">
                                    <option value="">naver.com</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <br><br><br>
                    <h4><b>배송 정보</b></h4>
                    <br>
                    <input type="checkbox">&nbsp;주문자 정보와 동일
                    <table class="info opt table table-hover">
                        <tr>
                            <th width="30%"><span>*</span> 받으실 분&nbsp;</th>
                            <td width="70%"><input type="text" required></td>
                        </tr>
                        <tr>
                            <th><span>*</span> 받으실 곳&nbsp;</th>
                            <td>
                                <input type="text" required><br>
                                <input type="text" required><br>
                                <input type="text">
                            </td>
                        </tr>
                        <tr>
                            <th><span>*</span> 전화번호&nbsp;</th>
                            <td><input type="text" placeholder=" - 제외하고 입력" required></td>
                        </tr>
                    </table>
                    <br><br><br>
                    <h4><b>결제 정보</b></h4>
                    <br>
                    <table class="info opt table table-hover">
                        <tr>
                            <th width="30%">상품 합계 금액&nbsp;</th>
                            <td width="20%" class="pay" width="15%">?원</td>
                            <td width="50%"></td>
                        </tr>
                        <tr>
                            <th>배송비&nbsp;</th>
                            <td class="pay">2,500원</td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>사용할 적립금&nbsp;</th>
                            <td class="pay"><input type="number" style="width:50px">&nbsp;p</td>
                            <td>&nbsp;<input type="checkbox">&nbsp;전액 사용하기 (보유 적립금: <b class="">?</b> p)</td>
                        </tr>
                        <tr>
                            <th>최종 결제 금액&nbsp;</th>
                            <td class="pay">?원</td>
                            <td></td>
                        </tr>
                    </table>
                    <br><br><br>
                    <h4><b>결제 수단</b></h4>
                    <br>
                    <div>
                        <input type="radio" checked></td>
                        신용카드
                    </div>
                    <br><br><br>
                    <div class="sum-area">
                        <table class="info">
                            <tr>
                                <th width="40%" class="pay">최종 결제 금액&nbsp;</th>
                                <th width="20%" class="pay" style="font-size:large;">?</th>
                                <td width="40%" style="font-size:large;"><b>원</b></td>
                            </tr>
                        </table>
                    </div>
                    <br><br>
                    <div>
                        <div class="agree">
                            <input type="radio">&nbsp;주문내역확인 동의(필수) <br><br>
                            <ul align="left">
                                <li>주문시 입력하신 배송정보는 배송을 위한 목적으로 사용됩니다.</li>
                                <li>주문할 상품의 상품명, 가격, 배송정보 등을 최종 확인하였으며, <br>구매에 동의하십니까? <br>(전자상거래법 제 8조 2항)</li>
                            </ul>
                        </div>
                    </div>
                    <br><br>
                    
                    <div>
                        <button type="button" class="btn btn-secondary" onclick="">이전으로</button>
                        <button type="submit" class="btn btn-primary">결제하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>