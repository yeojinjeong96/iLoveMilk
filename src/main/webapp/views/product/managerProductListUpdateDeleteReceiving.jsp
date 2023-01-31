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
                           	    <select name="searchOp" id="searchOp">
                                	<option>- 검색 조건 -</option>
                                    <option>상품명</option>
                                    <option>상품코드</option>
                                    <option>브랜드</option>
                                </select>
                                <input type="text" name="searchKey" required>
                                <button type="button" onclick="opNeed();" class="btn btn-primary btn-sm">검색</button>
	                        </td>
                        </tr>
                    </table>
                    <div align="right">
                        <button type="button" onclick="deleteBtn();" class="btn btn-primary btn-sm" style="margin: 15px;">선택 상품 삭제</button>
                    </div>
                    <table class="table">
                        <thead class="thead-light">
                            <tr style="text-align: center;">
                                <th width="4%"></th>
                                <th width="9%">코드</th>
                                <th width="47%">상품명</th>
                                <th width="9%">재고</th>
                                <th width="20%">브랜드</th>
                                <th width="11%">입고</th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- 검색시 검색단어 보이기, 상품리스트 null시 상품리스트가 존재하지않습니다. 검색리스트가 null시 검색조건에 해당하는 결과가 없슨디ㅏ.-->
							    <% for(Product p : list){ %>
	                            <tr class="prod">
	                                <td><input type="checkbox" class="checkedPro"></td>
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
	                                <td align="center"><button type="button" class="btn btn-primary btn-sm" onclick="receivingPro();" data-toggle="modal" data-target="#receiving">입고</button></td>
	                            </tr>
								<% } %>
                        </tbody>
                    </table>
                    
                    <br>
					<div class="paging-area">
			            <% if(pi.getCurrentPage() != 1){ %>
			            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/listUpDeRe.pr?cp=<%= pi.getCurrentPage() - 1 %>';">&lt;</button>
			            <% } %>
			
						<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
			            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/listUpDeRe.pr?cp=<%= p %>';"><%= p %></button>
						<% } %>
						
						<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
			            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/listUpDeRe.pr?cp=<%= pi.getCurrentPage() + 1%>';">&gt;</button>
			            <% } %>
			        </div>
			        
			        <!-- 입고 모달 시작 -->
					<div class="modal fade" id="receiving">
						<div class="modal-dialog">
						<div class="modal-content">
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">입고</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							<form action="<%= contextPath %>/receiving.pr">
								<!-- Modal body -->
								<div class="modal-body">
									<table class="table">
				                        <tr>
				                            <th>선택한 상품코드</td>
				                            <td id="proNo" name="proNo"></td>
				                        </tr>
				                        <tr>
				                            <th>선택한 상품명</td>
				                            <td id="proName"></td>
				                        </tr>
				                        <tr>
				                            <th>재고</td>
				                            <td id="stock"></td>
				                        </tr>
				                        <tr>
				                            <th>입고 수량</td>
				                            <td><input type="number" name="receNo">&nbsp;개</td>
				                        </tr>
				                    </table>
				                </div>
				                <!--  
				                <script>
					            	function receivingPro(){
					            		console.log($(this).val());
					            		$("#proNo").text($(this).parent().prev().prev().prev().prev().text());
					        			if($(this).parent().prev().text() == "·"){
					        				$("#proName").text($(this).parent().prev().text() + " " + $(this).parent().prev().prev().prev().text());
					        	    	}else{
					        	    		$("#proName").text($(this).parent().prev().prev().prev().text());
					        	    	}
					        			$("#stock").text($(this).parent().prev().prev().text());
					        		}
					        	</script>
				                -->
								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">입력</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
								</div>
							</form>
						</div>
						</div>
					</div>
					<!-- 입고 모달 종료 -->
			        
                </div>
                <br><br><br><br><br>
            </div>
        </div>
    </div>
    
	<script>
		// 검색조건 미선택시 alert
		function opNeed(){
			$.ajax({
				url:"<%= contextPath %>/searchList.pr",
				data:{
					op:$("#searchOp").val(),
					searchKey:$("#searchKey").val()
				},
				success:function(){},
				error: function(){}
			});
		}
			
		$(function(){
			// 상품명 클릭시 상품상세조회페이지로 이동
			$(".prod").each(function(){
				$(this).children().eq(2).click(function(){
	 				location.href = '<%= contextPath %>/detail.pr?no=' + $(this).prev().text();
	 			});
			});
		});
		
		// 선택상품삭제 클릭시 alert와 ajax
		function deleteBtn(){
			if($(".checkedPro:checked").parent().next().text() == ""){
				alert("선택된 상품이 없습니다.");
			}else if(confirm("선택된 상품을 정말로 삭제하시겠습니까?")){
				
				$.ajax({
					url:"<%= contextPath %>/delete.pr",
					data:{proNo:$(".checkedPro:checked").parent().next().text()},
					success:function(){
						
					},
					error:function(){
						console.log("상품 삭제용 ajax통신 실패");
					}
				});
			}
		}
	</script>
                    
</body>
</html>