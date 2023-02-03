<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "java.util.ArrayList, com.milk.member.model.vo.Order, com.milk.common.model.vo.PageInfo"%>    
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi"); 
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    
    .purchase-wrap{
        width:800px;
        margin:auto;
        padding-left:50px;
        float:left;
        box-sizing: border-box;
    }
    #purchase-1{
        width:100%;
        height:40%;
        padding-left:10px;
    }
    #purchase-1>*{float:left;}
    #purchase-2{
        width:100%;
        height:30%;
    }
    #purchase-3{
        width:100%;
        height:30%;
    }
   </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   

</head>
<body>
    <%@ include file="../common/managerHeader.jsp" %>
	<%@ include file="../common/managerMenubar.jsp"%>

    <div class="wrap1" align="center">
        <div class="purchase-wrap">
            <div id="purchase-1" >
              <div style="width:200px; height:100%">
                <p  style="font-size:20px; line-height: 90px;"><b>구매내역 조회</b></p>  
               </div>
            <br>
            <div align="right" style="width:700px; font-size: 13px;">
                조회기간 
                <button class="btn btn-outline-secondary btn-sm">오늘</button>
                <button class="btn btn-outline-secondary btn-sm">1주일</button>
                <button class="btn btn-outline-secondary btn-sm">1개월</button>
                <button class="btn btn-outline-secondary btn-sm">3개월</button>
                <input type="date" name = "searchDate1" > - <input type="date" name = "searchDate1" >
            </div>
            
            <div align="right" style="width:700px">
                <br>
                <select name="search-option" id="search-option" style="width:100px; font-size: 13px;">
                    <option value="구매자아이디">구매자아이디</option>
                    <option value="상품명">상품명</option>
                    <option value="주문번호">주문번호</option>
                </select>
                    <input type="text" name = "searchReport" ><button type="submit"  style="border:none">검색</button>
                </div>
            </div>
            <div id="purchase-2">
                <table class="purchase-list table" style="width:100%; font-size:13px; text-align:center;">
                	<thead>
	                    <tr>
	                        <td>번호</td>
	                        <td>주문번호</td>
	                        <td>결제일자</td>
	                        <td>구매자 아이디</td>
	                        <td>결제금액</td>
	                        <td>상세</td>
	                    </tr>
                    </thead>
                    <!-- 더블클릭 시 결제내역 상세 보이도록 한다 -->
                    <tbody>
                    	<%if(list.isEmpty()){ %>
                    		<tr>
                    			<td colspan="6"> 조회된 데이터가 없습니다. </td>
                    		</tr>
                    	<%}else{ %>
                    		<%for(int i = 0; i < list.size(); i++){ %>
			                    <tr>
			                        <td></td>
			                        <td><%=list.get(i).getOrderNo() %></td>
			                        <td><%=list.get(i).getPaymentDate()%></td>
			                        <td><%=list.get(i).getMemberId() %></td>
			                        <td><%=list.get(i).getPrice() %></td>
			                        <td><button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#purchase-info">상세보기</button></td>
			                    </tr>
		                    <%} %>
	                    <%} %>                    
                    </tbody>
                </table>
            </div>
            <div id="purchase-3">  
                <div class="paging-area">
                    <!-- 내가 보고있는 페이지가 1번 페이지가 아닐때에만 나타내기 -->
                    
                                <% if(pi.getCurrentPage() != 1){ %>
                                    <button onclick="location.href='<%=contextPath%>/purchaseList.ma?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                                <% } %>
                    
                                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                                    <button onclick="location.href='<%=contextPath%>/purchaseList.ma?cpage=<%=p%>';"><%= p %></button>
                                <% } %>
                    <!--  내가 보고있는 페이지가 마지막 페이지가 아닐 때에만 나타내기 -->
                    
                                <% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
                                    <button onclick="location.href='<%=contextPath%>/purchaseList.ma?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                                <% } %>
                </div>
                
            </div>


            <!-- 구매 상세관리 모달 div -->
            <div class="modal" id="purchase-info">
                <div class="modal-dialog">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">결제내역 상세</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
            
                <!-- Modal body -->
                <div class="modal-body">
                
                <form action="" method="post">
                        <input type="hidden" name="" value="">
                        <table style="width:100%;">
                                <tr>
                                    <td rowspan="7" width="200px;"> <img src="" alt="" width="180px;" height="200px;"> </td>
                                    <td>주문번호</td>
                                    <td>20230101-1234567</td>
                                </tr>
                                <tr>
                                    <td>주문일시</td>
                                    <td>23-01-01 00:00:00</td>
                                </tr>
                                <tr>
                                    <td>구매자아이디</td>
                                    <td>아이디자리</td>
                                </tr>
                                <tr>
                                    <td>제품명</td>
                                    <td>제품명자리</td>
                                </tr>
                                <tr>
                                    <td>제품번호</td>
                                    <td>번호자리</td>
                                </tr>
                                <tr>
                                    <td>주문수량</td>
                                    <td>주문수량자리</td>
                                </tr>
                                <tr>
                                    <td>결제금액</td>
                                    <td><b>결제금액자리</b></td>
                                </tr>
                                
                        </table>

                        <br>
                        <div align="center">
                        <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" >닫기</button>
                        </div>
                </form>
                
                
                </div>
            
                </div>
            </div>
            </div>




        </div>
    </div>    
</body>
</html>