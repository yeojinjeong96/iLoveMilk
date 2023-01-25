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
                    <h3><b>재입고 필요한 상품</b></h3>
                    <br><br>

                    <div id="content1">
                        <table class="table restock" style="text-align:center;">
                            <thead class="thead-light">
                                <tr>
                                    <th>번호</th>
                                    <th>상품코드</th>
                                    <th>상품명</th>
                                    <th>재고량</th>
                                </tr>
                            </thead>
                            <tbody>

                                <!-- 반복 -->
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>이름자리</td>
                                    <td>재고량자리</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                
                    <br><br><br>
                    <h3><b>미답변 문의</b></h3>  
                    <br><br>

                    <div id="content2">
                        <table class="table restock" style="text-align:center;">
                            <thead class="thead-light">
                                <tr>
                                    <th>번호</th>
                                    <th>작성자아이디</th>
                                    <th>작성일자</th>
                                    <th>글제목</th>
                                </tr>
                            </thead>
                            <tbody>

                                <!-- 반복 -->
                                <tr>
                                    <td>1</td>
                                    <td>아이디</td>
                                    <td>작성일자</td>
                                    <td>글제목자리</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                    <br><br><br>
                    <h3><b>최근 주문목록</b></h3>  
                    <br><br>

                    <div class="content3">
                        <table class="table restock" style="text-align:center;">
                            <thead class="thead-light">
                                <tr>
                                    <th>번호</th>
                                    <th>주문번호</th>
                                    <th>주문일자</th>
                                    <th>아이디</th>
                                    <th>배송상태</th>
                                </tr>
                            </thead>
                            <tbody>

                                <!-- 반복 -->
                                <tr>
                                    <td>1</td>
                                    <td>주문번호자리</td>
                                    <td>주문일자자리</td>
                                    <td>아이디자리</td>
                                    <td>배송상태자리</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <br><br><br><br><br>
            </div>
        </div>
    </div>
</body>
</html>