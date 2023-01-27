<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.product.model.vo.Product, com.milk.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer-1{float: left; width: 800px; box-sizing: border-box;}
    .outer-2{width: 700px;}
    .pHover:hover{cursor: pointer;}
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
                                <select name="searchOp">
                                	<option value="0">- 검색 조건 -</option>
                                    <option value="1">상품명</option>
                                    <option value="2">상품코드</option>
                                    <option value="3">브랜드</option>
                                </select>
                                <input type="text">
                                <button class="btn btn-primary btn-sm" id="">검색</button>
                            
                            </td>
                        </tr>
                    </table>
                    <div align="right">
                        <button type="submit" class="btn btn-primary btn-sm" style="margin: 15px;">선택 상품 삭제</button>
                    </div>
                    <table class="table">
                        <thead class="thead-light">
                            <tr style="text-align: center;">
                                <th width="4%"></th>
                                <th width="9%">코드</th>
                                <th width="36%">상품명</th>
                                <th width="9%">재고</th>
                                <th width="20%">브랜드</th>
                                <th width="11%">수정</th>
                                <th width="11%">입고</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% for(Product p : list){ %>
                            <tr class="prod">
                                <td><input type="checkbox"></td>
                                <td align="center"><%= p.getProductNo() %></td>
                                <td class="pHover"><%= p.getProductName() %> <%= p.getCapacity() %>(mL/g)</td>
                                <td align="right"><%= p.getStock() %></td>
                                <td align="center">
                                	<% if(p.getBrand() != null){ %>
                                		<%= p.getBrand() %>
                                	<% }else{ %>
                                		·
                                	<% } %>
                                </td>
                                <td align="center"><button class="btn btn-primary btn-sm">수정</button></td>
                                <td align="center"><button class="btn btn-primary btn-sm">입고</button></td>
                            </tr>
							<% } %>
							
                        </tbody>
                    </table>
                    
                    <script>
			        	$(function(){
			        		$(".prod").each(function(){
			        			$(this).children().eq(2).click(function(){
				        			location.href = '<%= contextPath %>/detail.pro?no=' + $(this).prev().text();
				        		});
			        		})
			        	});
			        </script>
                    
					<br>
					<div class="paging-area">
			            <% if(pi.getCurrentPage() != 1){ %>
			            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/listUpDeRe.pr?cup=<%= pi.getCurrentPage() - 1 %>';">&lt;</button>
			            <% } %>
			
						<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
			            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/listUpDeRe.pr?cup=<%= p %>';"><%= p %></button>
						<% } %>
						
						<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
			            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/listUpDeRe.prcup=<%= pi.getCurrentPage() + 1%>';">&gt;</button>
			            <% } %>
			        </div>
			        
			        
			        
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
                </div>
                <br><br><br><br><br>
            </div>
        </div>
    </div>
</body>
</html>