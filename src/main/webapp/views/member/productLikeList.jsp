<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.milk.product.model.vo.Product, com.milk.product.model.vo.ProductLike, java.util.ArrayList" %>  
    

<%
    ArrayList<ProductLike> list2 = (ArrayList<ProductLike>)request.getAttribute("list2");	
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
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
           

                <div id="thead">
                   
                </div>

                <div id="tbody" align="center" style="height:500px; overflow-y: auto; ">
                
                
                <% if(list2.isEmpty()){ %>
                	<div class="thumbnail" align="left">
					조회된 목록이 없습니다.
					</div>
                <% }else { %>
                	<% for(ProductLike pl : list2){ %>
                		
	                            <div style="width: 200px; height:200px; margin:10px; float: left; " >
	                                <div style=" margin:30px; float: left; ">
	                                	<img src="<%=pl.getProductImg() %>" width="200px" height="200px">
	                                	<a style="margin-top:5px;"><%=pl.getProductName() %></a>
	                                </div>
	                                
	                            </div>
	                        
                <%} %>
                
            <%} %>
                    
                </div>
           
            
        </form>
        <br>

       
        
        
        
               
                   
		</div>
	</div>
         
           
      
   
   <%@ include file="../common/footer.jsp" %> 	 




  
</body>
</html>