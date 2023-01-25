<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <h3><b>상품 입출고현황</b></h3>
                    <br><br>
    
                    <table class="outer-2">
                        <tr>
                            <td width="40%;">
                                <button class="btn btn-info btn-sm" style="width:55px">오늘</button>
                                <button class="btn btn-info btn-sm" style="width:55px">1주일</button>
                                <button class="btn btn-info btn-sm" style="width:55px">1개월</button>
                                <button class="btn btn-info btn-sm" style="width:55px">3개월</button>
                            </td>
                            <td width="60%;">
                                <input type="date">
                                ~
                                <input type="date">
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table class="outer-2">
                        <tr>
                            <td>
                                <select name="" id="">
                                    <option value="">상품명?</option>
                                    <option value="">상품코드?</option>
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
                                <th width="9%">번호</th>
                                <th width="15%">날짜</th>
                                <th width="9%">코드</th>
                                <th width="56%">상품명</th>
                                <th width="11%">입출고</th>
                            </tr>
                        </thead>
                        <tbody>

                            <!-- 반복 -->
                            <tr class="list">
                                <td align="center">1?</td>
                                <td align="center">1111.11.11</td>
                                <td align="center">22?</td>
                                <td>브랜드+상품명+용량?</td>
                                <td>+5?</td>
                            </tr>
                    
                        </tbody>
                    </table>
                    <br><br>

                    <!-- 부트스트랩 적용하기 -->
                    <div align="center">
                        <!-- 페이지1인경우 안보임 -->
                        <button>&lt;</button>

                        <!-- 반복 -->
                        <button>1</button>

                        <!-- 맥스페이지인경우 안보임 -->
                        <button>&gt;</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>