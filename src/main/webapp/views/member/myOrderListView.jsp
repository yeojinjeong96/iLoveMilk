<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.util.ArrayList, com.milk.member.model.vo.Order" %>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");

ArrayList<Order> list2 = (ArrayList<Order>)request.getAttribute("list2"); 

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .outer{
       width: 1000px; 
   
       height: 1000px;
       box-sizing: border-box; 
       margin:auto;
   }
   .mainmenubar{
       width: 23%;
        
        float: left;
        height: 100%;
        
   }
   
   .mainmember{
       float: left;
       width: 77%;
       
       height: 20%;
   }

   .maincontent{
       width: 77%;
       height: 300px;
       
       float: left;
   }



    <!-- content  -->
       .outer_up{
           width: 700px;
           height: 500px;
          
       }
        
       .myorderheader{font-size: 25px; font-weight: bolder; padding-bottom: 50px;}
       .ordersearch{
            border: 1px solid gray;
        }
        
        .order-list{
            
            width: 100%;
           
        }
        #list {
            width: 100%;
        }

        #information{ width: 100%;}
        #information th{ width: 30%;}
   </style>
</head>
<body>	
   
   <%@ include file="../common/header.jsp" %>
   
   
   <div class="outer">

       <div class="mainmenubar" >
           <%@ include file="../common/myPageMenubar.jsp" %> 	
       </div>
               
       <div class="mainmember">
            <%@ include file="../member/memberInformation.jsp" %> 
       </div>
       
        <div class="myorderheader">
            주문목록 / 배송조회
           
        </div>
       
       <div class="orderSearch">
            <table >
                <tr>
                    <td>조회기간</td>
                    <td>
                        <button>1주일</button>
                        <button>1개월</button>
                        <button>3개월</button>
                        <button>6개월</button>
                    </td>
                </tr>
                 <tr>
                    <td>조회기간</td>
                    <td>
                        <form action="">
                        <input type="date" id="day1" name="day1">
                        ~
                        <input type="date" id="day2" name="day2">
                        <input type="submit" value="기간조회">
                        </form>
                    </td>
                 </tr>
            </table>
        </div>
       
       <div class="maincontent">
       	
       		<form action="" class="myorder">
		       <div class="order-list" style="padding:30px 30px 30px 0px;">
		           <div style="height:500px; overflow-y: auto;">
			            
			            <table id="list" border="1px solid gray;">
			                <div id="ohead">
			                	<tr>
				                    <th width="15%">날짜<br>주문번호</th>
				                    <th width="50%">상품정보</th>
				                    <th width="10%">총 금액</th>
				                    <th width="12%">주문상태</th>
				                    <th width="12%">확인</th>
			                	</tr>
			                </div>
			                <div id="obody">
			                	<% if(list.isEmpty()){ %>
				                	<div class="thumbnail" align="left">
									조회된 목록이 없습니다.
									</div>
				                <% }else { %>
				                	<% for(Order o : list){ %>
				                		<tr>
						                    <td align="center"><%=o.getPaymentDate() %> <br> <%=o.getOrderNo() %></td>
						                    <td>
						                    	<table >
						                    		<tr>
						                    			<td>
						                    				<div name="productImg" style="width:100px; height:100px;  float: left; magin:auto;"> 
						                    					<img src="<%=o.getProductImg() %>" width="100%" height="100%"> 
						                    				</div>
							                    			<div style="float: left; padding-top:35px"> <a href="<%=contextPath %>/orderD.me?orderNo=<%=o.getOrderNo() %>"data-toggle="modal" data-target="#orderdetail"><%=o.getProductName() %> 외 <%= (o.getProductCount())-1%>건</a>  </div>
						                    			</td>
						                    		</tr>
						                    
						                    	</table>
						                    	
						                    </td>
						                    <td align="center"><%=o.getPrice() %>원</td>
						                    <td align="center">결제완료<br>상품준비중</td>
						                    <td align="center">운송장 번호</td>
						                </tr>
				                	
				                	<% } %>
				                
				                <% } %>
			                 
			                </div>
			                
			            </table>
		            </div>
		        </div>
		        
       		</form>
               
                <!-- 주문 상세페이지 모달 div -->
                 <div class="modal" id="orderdetail">
                    <div class="modal-dialog">
                      <div class="modal-content">
                  
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h4 class="modal-title">주문 상세</h4>
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                  
                        <!-- Modal body -->
                        <div class="modal-body">
                        	
                             <form action="" method="post">
                             	<input type="hidden" name = orderNo value="">
	                            <table id="list" border="1px solid gray;">
	                                <div id="ohead">
	                                    <tr>
	                                        <th width="15%">상품사진</th>
	                                        <th width="50%">상품이름</th>
	                                        <th width="10%">상품가격</th>
	                                        <th width="12%">구매갯수</th>
	                                    </tr>
	                                </div>
	                                <div id="obody">
	                                	
	                                </div>
	                            </table>
	                        </form>
                            <div id="ounder" style="float: right;"" >
                                   
                                총 000 원 
                    
                            </div>

                        </div>
                  
                      </div>
                    </div>
                  </div>
               
               
               
               
		</div>
	</div>
         
           
      
   
   <%@ include file="../common/footer.jsp" %> 	 




  
</body>
</html>