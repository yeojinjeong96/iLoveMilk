<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.milk.product.model.vo.Product, com.milk.product.model.vo.ProductLike, java.util.ArrayList" %>

<%
    ArrayList<ProductLike> list = (ArrayList<ProductLike>)request.getAttribute("list");	
	
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
        
       .likeheader{font-size: 25px; font-weight: bolder; padding-bottom: 50px;}
       #productlike {
        align-items: centers;
       }
       
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
       
        <div class="likeheader">
            찜목록
        </div>
       
       <div class="maincontent">
        
        <form action="" class="like">
            <table border="1" align="center">

                <div id="thead">
                    <tr >
                        <th style="width: 50px" >선택</th>
                        <th style="width: 400px" >상품정보</th>
                        <th style="width: 150px" >상품금액/수량</th>
                        <th style="width: 100px">확인</th>
                    </tr>
                </div>

                <div id="tbody">
                
                
                <% if(list.isEmpty()){ %>
                	<div class="thumbnail" align="left">
					조회된 목록이 없습니다.
					</div>
                <% }else { %>
                	<% for(ProductLike pl : list){ %>
                		<tr id="productlike">
                        <td align="center"> <input type="checkbox"></td>
                        <td>
                            <div style="width: 100px; height:100px;" style="float: left;">
                                <img src="<%=pl.getProductImg() %>" width="100%" height="100%">
                            </div>
                            <br>
                            <div id="name" style="float: left;" ><%=pl.getProductName() %> </div>
                        </td>
                        
                        <td align="center">
                        	<%=pl.getPrice() %>원 <br>
                        	<select name="plconunt">
                        		<option value="1">1</option>
                        		<option value="2">2</option>
                        		<option value="3">3</option>
                        		<option value="4">4</option>
                        		<option value="5">5</option>
                        	</select>
                        </td>

                        
                        <td align="center">
                            <input type="button" id="cart" value="장바구니">
                            <br>
                            <br>
                            <input type="button" id="delete" value="삭제하기">
                        </td>
                        
                    </tr>
                </div>
                	
                <%} %>
                
            <%} %>
                    
                
            </table>
            
        </form>
        <br>

        <button type="submit">전체취소</button>
        
        
        
               
                   
		</div>
	</div>
         
           
      
   
   <%@ include file="../common/footer.jsp" %> 	 




  
</body>
</html>