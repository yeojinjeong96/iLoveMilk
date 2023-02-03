<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String orderNo = (String)request.getAttribute("orderNo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .payment{width:700px;}
    .payment td{text-align: center;}
    .pay-area{background-color: lightgray; width:700px; padding-top:20px; padding-bottom:20px;}
    
</style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>

	<div class="wrap" align="center">
        <div class="outer">
            <div class="outer-1">
                <br>
                <h2><b>결제완료</b></h2>
                <br><br><br>

                <div class="pay-area">
                    <br>
                    <table class="payment">
                        <tr>
                            <td><h4><b>주문 / 결제가 정상적으로 완료되었습니다.</b></h4></td>
                        </tr>
                        <tr>
                            <td>주문번호 <%= orderNo %></td>
                        </tr>
                        <tr>
                            <td><b class="text-primary">아이럽우유</b> 를 이용해주셔서 감사합니다.<br><br></td>
                        </tr>
                    </table>
                </div>
                <br><br>
                
                <div>
                    <a type="button" class="btn btn-secondary" href="<%= contextPath %>">메인으로</a>
                    <a type="submit" class="btn btn-primary" href="<%= contextPath %>/myorder.me">주문 내역 확인</a>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>