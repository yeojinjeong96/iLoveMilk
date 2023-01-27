<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.milk.product.model.vo.Product" %>
<% Product p = (Product)request.getAttribute("p"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer-1{float:left; width: 800px; box-sizing: border-box;}
    .outer-2{width: 700px;}
    .table span{color: red;}
    .table th{text-align: right;}
    .star{color: red;}
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
                    <h3><b>상품 수정</b></h3>
                    <br><br>
                    <span class="star">*</span> 은 필수 입력사항입니다.

                    <form action="<%= contextPath %>/update.pr" method="post" enctype="multipart/form-data">
                        <table class="table table-hover">
                            <tr>
                                <th width="30%"><span>*</span> 카테고리&nbsp;</th>
                                <td width="70%">
									<select onchange="sCateShow();" name="fCate" id="fCate">
                                    	<option>- 1차 카테고리 -</option>
                                        <option>우유</option>
                                        <option>발효유</option>
                                        <option>치즈</option>
                                        <option>락토프리</option>
                                    </select>
                                    <select name="sCate" id="sCate">
                                        <option>- 2차 카테고리 -</option>
                                        <option class="ti1" style="display:none">백색시유</option>
                                        <option class="ti1" style="display:none">가공우유</option>
                                        <option class="ti1" style="display:none">멸균우유</option>
                                        <option class="ti2" style="display:none">발효유</option>
                                        <option class="ti3" style="display:none">치즈</option>
                                        <option class="ti4" style="display:none">락토프리</option>
                                    </select>
								</td>
                            </tr>
                            <tr>
                                <th><span>*</span> 상품명&nbsp;</th>
                                <td><input type="text" name="productName" required value="<%= p.getProductName() %>"></td>
                            </tr>
                            <tr>
                                <th><span>*</span> 용량&nbsp;</th>
                                <td><input type="number" name="capacity" required value="<%= p.getCapacity() %>">&nbsp;(mL/g)</td>
                            </tr>
                            <tr>
                                <th>상품코드&nbsp;</th>
                                <td><%= p.getProductNo() %></td>
                            </tr>
                            <tr>
                                <th>브랜드&nbsp;</th>
                                <td>
                                	<% if(p.getBrand() == null){ %>
	                                	<!-- 브랜드가 null이 아닐때 -->
	                                	<input type="text" name="brand">
                                	<% }else{ %>
                                		<!-- 브랜드가 null일때 -->
	                                	<input type="text" name="brand" value="<%= p.getBrand() %>">
                                	<% } %>
                                </td>
                            </tr>
                            <tr>
                                <th><span>*</span> 상품 이미지&nbsp;</th>
                                <td><input type="file" name="productImg" required value="<%= p.getProductImg() %>"></td>
                            </tr>
                            <tr>
                                <th><span>*</span> 판매가격&nbsp;</th>
                                <td><input type="number" name="price" required value="<%= p.getPrice() %>">&nbsp;원</td>
                            </tr>
                            <tr>
                                <th><span>*</span> 재고&nbsp;</th>
                                <td><%= p.getStock() %>&nbsp;개</td>
                            </tr>
                            <tr>
                                <th><span>*</span> 상품 상세정보&nbsp;</th>
                                <td><textarea name="productInfo" cols="30" rows="5" style="resize: none;" required><%= p.getProductInfo() %></textarea></td>
                            </tr>
                        </table>
                        <br><br>
                        
                        <div>
                            <a href="<%= contextPath %>/detail.pr?no=<%= p.getProductNo() %>" class="btn btn-secondary">취소</a>
                            <button type="submit" class="btn btn-primary">저장</button>
                        </div>
                    </form>
                </div>
                <br><br><br><br><br>
            </div>
        </div>
    </div>
    
    <script>
    </script>
    
</body>
</html>