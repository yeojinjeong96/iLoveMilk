<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.product.model.vo.Product, com.milk.product.model.vo.Payment" %>
<%
	ArrayList<Product> stockList = (ArrayList<Product>)request.getAttribute("stockList");
	ArrayList<Payment> recentPayList = (ArrayList<Payment>)request.getAttribute("recentPayList");

%>
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
                            	<% if(stockList != null){ %>
									<% for(Product p : stockList){ %>
		                                <tr>
		                                    <td><%= p.getPrice() %></td>
		                                    <td><%= p.getProductNo() %></td>
		                                    <td><%= p.getProductName() %></td>
		                                    <td><%= p.getStock() %></td>
		                                </tr>
									<% } %>
								<% }else{ %>
									<tr>
										<td colspan="4">재입고 필요한 상품이 없습니다.</td>
									</tr>
								<% } %>
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
								<% if(recentPayList != null){ %>
									<% for(Payment p : recentPayList){ %>
		                                <tr>
		                                    <td><%= p.getNum() %></td>
		                                    <td><%= p.getOrderNo() %></td>
		                                    <td><%= p.getPaymentDate() %></td>
		                                    <td><%= p.getMemberId() %></td>
		                                    <td><%= p.getStatus() %></td>
		                                </tr>
									<% } %>
								<% }else{ %>
									<tr>
										<td colspan="5">최근 주문목록이 없습니다.</td>
									</tr>
								<% } %>
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