<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.product.model.vo.Stock, com.milk.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Stock> list = (ArrayList<Stock>)request.getAttribute("list");
	String op = (String)request.getAttribute("op");
	String key = (String)request.getAttribute("key");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer-1{float:left; width: 800px; box-sizing: border-box;}
    .outer-2{width: 700px;}
    .pHover:hover{cursor: pointer;}
    #keyword{float:left; margin-top:15px;}
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
                                <button class="btn btn-info btn-sm" onclick="seop();" style="width:55px">오늘</button>
                                <button class="btn btn-info btn-sm" onclick="seop();" style="width:55px">1주일</button>
                                <button class="btn btn-info btn-sm" onclick="seop();" style="width:55px">1개월</button>
                                <button class="btn btn-info btn-sm" onclick="seop();" style="width:55px">3개월</button>
                            </td>
                            <td width="60%;">
                                <input type="date" name="">
                                ~
                                <input type="date" name="">
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table class="outer-2">
                        <tr>
                            <td>
                                <select name="op" id="op">
                                    <option>- 검색 조건 -</option>
                                    <option>상품명</option>
                                    <option>상품코드</option>
                                    <option>브랜드</option>
                                </select>
                                <input type="text" name="key" id="key">
                                <button type="button" onclick="return opNeed();" class="btn btn-primary btn-sm">검색</button>
                            </td>
                        </tr>
                    </table>
                    <div align="right">
	                    <div id="keyword" align="left">
	                   		<% if(op != null && key != null){ %>
	                   			<b>"<%= key %>"</b>에 대한 검색 결과
	                   		<% } %>
	                    </div>
                    </div>
                    <table class="table">
                        <thead class="thead-light">
                            <tr style="text-align: center;">
                                <th width="16%">날짜</th>
                                <th width="13%">상품코드</th>
                                <th width="40%">상품명</th>
                                <th width="20%">브랜드</th>
                                <th width="11%">입출고</th>
                            </tr>
                        </thead>
                        <tbody>
							<% if(!list.isEmpty()){ %>
								<% for(Stock s : list){ %>
                            		<tr class="list">
		                                <td align="center"><%= s.getStockDate().substring(0, 10) %></td>
		                                <td align="center"><%= s.getProductNo() %></td>
		                                <td class="pHover"><%= s.getProductName() %></td>
		                                <td align="center">
		                                	<% if(s.getBrand() != null){ %>
		                                		<%= s.getBrand() %>
		                                	<% }else{ %>
		                                		
		                                	<% } %>
		                                </td>
		                                <td>
		                                	<% if(s.getStatus().equals("입고")){ %>
		                                		+<%= s.getCount() %>
		                                	<% }else{ %>
		                                		-<%= s.getCount() %>
		                                	<% } %>
										</td>
		                            </tr>
                    			<% } %>
                    		<% }else{ %>
								<tr>
									<td colspan="5" align="center">입출고현황이 존재하지 않습니다.</td>
								</tr>
							<% } %>
                        </tbody>
                    </table>
                    <br><br>

                    <% if(op == null){ %>
	                    <div class="paging-area">
				            <% if(pi.getCurrentPage() != 1){ %>
				            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/stock.pr?cp=<%= pi.getCurrentPage() - 1 %>';">&lt;</button>
				            <% } %>
				
							<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
				            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/stock.pr?cp=<%= p %>';"><%= p %></button>
							<% } %>
							
							<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
				            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/stock.pr?cp=<%= pi.getCurrentPage() + 1%>';">&gt;</button>
				            <% } %>
				        </div>
			        <% }else{ %>
						<div class="paging-area">
				            <% if(pi.getCurrentPage() != 1){ %>
				            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/stock.pr?searchOp=<%= op %>&key=<%= key %>&cp=<%= pi.getCurrentPage() - 1 %>';">&lt;</button>
				            <% } %>
				
							<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
				            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/stock.pr?searchOp=<%= op %>&key=<%= key %>&cp=<%= p %>';"><%= p %></button>
							<% } %>
							
							<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
				            <button class="btn btn-primary btn-sm" onclick="location.href='<%= contextPath %>/stock.pr?searchOp=<%= op %>&key=<%= key %>&cp=<%= pi.getCurrentPage() + 1%>';">&gt;</button>
				            <% } %>
				        </div>
			        <% } %>
                </div>
            </div>
        </div>
    </div>
    
    <script>
		function opNeed(){
			if($("#searchOp").val() == "- 검색 조건 -"){
				// 검색조건 미선택시 alert
				alert("검색 조건을 선택하세요.");
				return false;
			}else{
				// 검색 리스트 가져오기
				location.href = "<%= contextPath %>/listUpDeRe.pr?searchOp=" + $('#searchOp').val() + "&searchKey=" + $('#searchKey').val() + "&cp=1";
			}
		}
	</script>
	
</body>
</html>