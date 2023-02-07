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
       
       <div class="maincontent">
       	
       		<form action="" class="myorder">
		       <div class="order-list" style="padding:30px 30px 30px 0px;">
		           <div style="height:500px; overflow-y: auto;">
			            
			            <table id="list" border="1px solid gray;">
			                <div id="ohead">
			                	<tr align="center">
				                    <th width="15%" align="center">날짜<br>주문번호</th>
				                    <th width="50%" align="center">상품정보</th>
				                    <th width="10%" align="center">총 금액</th>
				                    <th width="12%" align="center">주문상태</th>
				                    <th width="12%" align="center">확인</th>
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
							                    			<div style="float: left; padding-top:35px"> 
							                    				<a >
							                    					 <% if( o.getProductCount() > 1 ){ %>
												                     	<%=o.getProductName() %> 외 <%= (o.getProductCount())-1%>건
												                     <% }else{ %>
												                     	<%=o.getProductName() %>
												                     <% } %>
							                    					
							                    					
							                    				</a>  
							                    			</div>
						                    			</td>
						                    		</tr>
						                    
						                    	</table>
						                    	
						                    </td>
						                    <td align="center"><%=o.getPrice() %>원</td>
						                    <td align="center">
						                     <% if( o.getStatus() == 3 ){ %>
						                     	배송완료
						                     <% }else if (o.getStatus() == 2){ %>
						                     	배송중
						                     <% }else if (o.getStatus() == 1) {%>
						                     	상품준비중
						                     <% } %>
						                    
						                    </td>
						                    <td align="center">
						                    <% if( o.getStatus() == 3 ){ %>
						                    	<%=o.getCourier() %> <br>
						                     	<%= o.getWaybill() %>
						                     <% }else if (o.getStatus() == 2){ %>
						                     	<%=o.getCourier() %> <br>
						                     	<%= o.getWaybill() %>
						                     <% }else if (o.getStatus() == 1) {%>
						                     	상품준비중
						                     <% } %>
						                    </td>
						                </tr>
				                	
				                	<% } %>
				                <% } %>
				                
			                 
			                </div>
			                
			            </table>
		            </div>
		        </div>
		        
       		</form>
               
       
               
               
               
		</div>
	</div>
         
           
      
   
   <%@ include file="../common/footer.jsp" %> 	 




  
</body>
</html>