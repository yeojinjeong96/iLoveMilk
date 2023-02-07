<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.product.model.vo.Stock, com.milk.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Stock> list = (ArrayList<Stock>)request.getAttribute("list");
	String op = (String)request.getAttribute("op");
	String key = (String)request.getAttribute("key");
	String start = (String)request.getAttribute("start");
	String end = (String)request.getAttribute("end");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer-1{float:left; width: 800px; box-sizing: border-box;}
    .outer-2{width: 700px;}
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
                            <form action="<%= contextPath %>/stock.pr?cp=1" method="post">
	                            <td width="60%;">
	                            	기간 선택 :&nbsp;
	                                <input type="date" id="start" required name="start" onchange="endMin();">
	                                ~
	                                <input type="date" id="end" required name="end" max="today" onchange="startMax();">
	                                <button type="submit" class="btn btn-primary btn-sm">조회</button>
	                            </td>
	                        </form>
                        </tr>
                    </table>
	                <br>
                    <table class="outer-2">
                        <tr>
                            <td>
                            	<form action="<%= contextPath %>/stock.pr?cp=1" method="post">
	                                <select name="op" id="op" onchange="changeOp();">
	                                    <option>- 검색 조건 -</option>
	                                    <option>상품명</option>
	                                    <option>상품코드</option>
	                                    <option>브랜드</option>
	                                </select>
	                                <input type="text" name="key" id="key">
	                                <button type="submit" onclick="return opNeed();" class="btn btn-primary btn-sm">검색</button>
                                </form>
                            </td>
                        </tr>
                    </table>
	                <br>
                    <div align="right">
                    	<div id="periodArea" align="left" style="margin-bottom:10px">
	                   		<% if(start != null){ %>
	                   			선택된 기간 :&nbsp;
	                   			<b>
	                   				<% if(start.equals("SYSDATE-1")){ %>
	                   					오늘
	                   				<% }else if(start.equals("SYSDATE-8")){ %>
	                   					1주일
	                   				<% }else if(start.equals("TO_CHAR(ADD_MONTHS(SYSDATE, -1),'YYYY-MM-DD')")){ %>
	                   					1개월
	                   				<% }else if(start.equals("TO_CHAR(ADD_MONTHS(SYSDATE, -3),'YYYY-MM-DD')")){ %>
	                   					3개월
	                   				<% }else{ %>
	                   					"<%= start %> ~ <%= end %>"
	                   				<% } %>
	                   			</b>
	                   		<% } %>
	                    </div>
	                    <div id="keywordArea" align="left" style="margin-bottom:10px">
	                   		<% if(op != null){ %>
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
		                                <td><%= s.getProductName() %></td>
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
        		<br><br><br><br><br>
            </div>
        </div>
    </div>
    
    <script>
		// 옵션 변경시 text 초기화
		function changeOp(){
			$("#key").val("");
		}
	
		function opNeed(){
			if($("#op").val() == "- 검색 조건 -"){
				// 검색조건 미선택시 alert
				alert("검색 조건을 선택하세요.");
				return false;
			}
		}
		
		// 기간 선택 입력 start max 제한
		function startMax(){
			$("#start").attr("max", $("#end").val());
		}
	
		// 기간 선택 입력 end min 제한
		function endMin(){
			$("#end").attr("min", $("#start").val());
		}
	
		$(function(){
			// 상품코드시 숫자 이외의 값 불가
			$("#key").keyup(function(e){
				if($("#op").val() == "상품코드"){
					if(isNaN(e.key) || e.key == " "){
						let str = $("#key").val();
						$("#key").val(str.substring(0, str.length - 1));
					}
				}
			});
			
			// 기간 선택 입력 end max 제한
			var now_utc = Date.now() // 지금 날짜를 밀리초로
			// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
			var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
			// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
			var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			document.getElementById("end").setAttribute("max", today);
		});
	
		// 기간 선택 버튼
		function seop(){
			switch($(window.event.target).text()){
			case "오늘": location.href="<%= contextPath %>/stock.pr?start=SYSDATE-1&end=SYSDATE&cp=1"; break;
			case "1주일": location.href="<%= contextPath %>/stock.pr?start=SYSDATE-8&end=SYSDATE&cp=1"; break;
			case "1개월": location.href="<%= contextPath %>/stock.pr?start=TO_CHAR(ADD_MONTHS(SYSDATE, -1),'YYYY-MM-DD')&end=SYSDATE&cp=1"; break;
			case "3개월": location.href="<%= contextPath %>/stock.pr?start=TO_CHAR(ADD_MONTHS(SYSDATE, -3),'YYYY-MM-DD')&end=SYSDATE&cp=1"; break;
			}
		}
	</script>
    
</body>
</html>