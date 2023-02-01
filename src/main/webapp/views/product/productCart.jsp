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
                            <% if(list.isEmpty()){ %>
	                            <tr>
	                                <td colspan="6" align="center">장바구니에 담긴 상품이 없습니다.</td>
	                            </tr>
                            <% }else{ %>
                                <% for(Product p : list){ %>
		                            <tr>
		                                <td style="vertical-align:middle"><input type="checkbox" checked></td>
		                                <td style="vertical-align:middle" width="12%" align="center"><img src="<%= p.getProductImg() %>" width="100px;"></td>
		                                <td style="vertical-align:middle" width="45%"><%= p.getProductName() %></td>
		                                <td style="vertical-align:middle" align="center">
		                                    <button type="button" onclick="return minusAmount();" style="width:26px" class="btn btn-secondary btn-sm">-</button>
		                                    <input type="text" style="width:26px" value="<%= p.getCapacity() %>" readonly>
		                                    <input type="hidden" name="proNo" value="<%= p.getProductNo() %>">
		                                    <button type="button" onclick="plusAmount();" style="width:26px" class="btn btn-secondary btn-sm">+</button>
		                                </td>
		                                <td style="vertical-align:middle" class="pay"><%= p.getPrice() %>&nbsp;원</td>
		                                <td style="vertical-align:middle" align="center"><img src="resources/images/delete.png" style="width:20px"></td>
		                            </tr>
		                            <script>
		                            	function plusAmount(){
		                            		$.ajax({
		                            			url:"<%= contextPath %>/plusAmount.pr",
		                            			data:{
		                            				memNo:<%= loginMember.getMemberNo() %>,
		                            				proNo:$(window.event.target).prev().val(),
		                            				amount:$(window.event.target).prev().prev().val()
		                            			},
		                            			type:"post",
		                            			success:function(result){
		                            				if(result > 0){
		                            					location.reload();
		                            				}else{
		                            					alert("상품 수량 변경 실패");
		                            				}
		                            			},
		                            			error:function(){
		                            				console.log("장바구니 상품 수량 변경 ajax통신 실패");
		                            			}
		                            		});
		                            	}
		                            	
		                            	function minusAmount(){
		                            		if($(window.event.target).next().val() == 1){
		                            			alert("상품이 이미 최소수량입니다.");
		                            			return false;
		                            		}else{
			                            		$.ajax({
			                            			url:"<%= contextPath %>/minusAmount.pr",
			                            			data:{
			                            				memNo:<%= loginMember.getMemberNo() %>,
			                            				proNo:$(window.event.target).next().next().val(),
			                            				amount:$(window.event.target).next().val()
			                            			},
			                            			type:"post",
			                            			success:function(result){
			                            				if(result > 0){
			                            					location.reload();
			                            				}else{
			                            					alert("상품 수량 변경 실패");
			                            				}
			                            			},
			                            			error:function(){
			                            				console.log("장바구니 상품 수량 변경 ajax통신 실패");
			                            			}
			                            		});
		                            		}
		                            	}
		                            </script>
                                <% } %>
	                            <tr>
	                                <td><input type="checkbox" checked></td>
	                                <td colspan="5">
	                                    <button type="submit" class="btn btn-secondary btn-sm">선택 삭제</button>
	                                    <button type="submit" class="btn btn-secondary btn-sm">품절 삭제</button>
	                                </td>
	                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <br><br>
                    <% if(!list.isEmpty()){ %>
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
                    <% } %>
                    <br><br>

                    <div>
                        <a href="" class="btn btn-secondary">메인으로</a>
						<% if(!list.isEmpty()){ %>
	                        <button type="button" class="btn btn-primary" onclick="">선택 상품 주문</button>
	                        <button type="submit" class="btn btn-primary">전체 상품 주문</button>
                        <% } %>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
	<%@ include file="../common/footer.jsp" %>
</body>
</html>