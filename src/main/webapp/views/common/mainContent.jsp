<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.product.model.vo.Product" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>



    #main-content{
        width:700px;
        height:1200px;
        margin:auto;
    }

    #demo{
        width:100%;
        height:30%;
    }
    .carousel-inner>div>img{
        width:700px;
        height: 350px;
    }

    /* 신상품 */
    #con1{
        width:100%;
        height:30%;
    }
    #con1-1{
        width:100%;
        height:20%;
    }
    #con1-2{
        width:100%;
        height:80%;

    }
    #con1-2>*{
        float:left;
    }

    .thumbnail{
    border:1px solid white;
    width:200px;
    display:inline-block;
    margin:14px;
    }


    /* 최신레시피 */
    #con2{
        width:100%;
        height:30%;
    }
    #con2-1{
        width:100%;
        height:20%;
    }
    #con2-2{
        width:100%;
        height:80%;
    }
    #con2-2>*{
        float:left;
    }

    .thumbnail{
    border:1px solid white;
    width:200px;
    display:inline-block;
    margin:14px;
    }

    .thumbnail img:hover{
    opacity:0.7;
    cursor:pointer;
    }

    </style>
      <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

<%@ include file= "header.jsp" %>
 
    <div id="main-content">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
            </ul>
          
            <!-- The slideshow -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="resources/product_upfiles/나 100_ 그린라벨.png" alt="">
              </div>
              <div class="carousel-item">
                <img src="resources/product_upfiles/다크초코렛우유.jpg" alt="">
              </div>
              <div class="carousel-item">
                <img src="resources/product_upfiles/빙그레 미니 딸기.jpg" alt="">
              </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
          
          </div>
          
        <div style="border-bottom:1px solid gray;"></div> 
        <div id="con1">

            <div id="con1-1">
                <br>
                <p align="center" style="font-size:18px;"><b>NEW PRODUCT</b></p>
            </div>
            
            <div id="con1-2">
				
            </div>
            
            <script>
            
            	$(function(){
            		
            		selectRecentProduct();
					
            	}) 
            	
            	function selectRecentProduct(){
           	        $.ajax({ 
	           			url : "<%=contextPath%>/recentList.pro", 
	           			success :function(recentList){
	           			
	           			
	           				let value = "";
	           				if(recentList.length == 0){
	           					
	           					value +=
	           				        "<div class='thumbnail' align='left'>"
	           		       		   + "조회된 상품이 없습니다.</div>"
	           				}else{
	           					
	           				    for(let i = 0; i< recentList.length; i++){ 
	           				    
	           			        value += "<div class='thumbnail' align='left'>"
	           			              + "<a href='"+ '<%=contextPath %>/proDetail.pro?pno='+ recentList[i].productNo +"' style='color:rgb(113, 113, 113); text-decoration:none;'>"
	           			              + "<img src='" + recentList[i].productImg + "' alt='' width='200' height='200'>"
	           			            + "<p>"
	           			            + recentList[i].productName + "<br>"
	           			            + recentList[i].price
	           			            + "</p>"
	           			            + "</a>"
	           			       	    + "</div>"
	           			        
	           			        }
	           				    $("#con1-2").html(value);
	           				}
							
	           				
	           			},error:function(){
	           				console.log("에러발생");
	           			}
            		})	
            	}
            	

            </script>
            
        </div>

        <div id="con2">

            <div id="con2-1">
                <br>
                <p align="center"  style="font-size:18px;"><b>NEW RECEIPE</b></p>
            </div>

            <div id="con2-2">
            

			</div>
			
			
			<script>
            
            	$(function(){
            		
            		selectRecentRecipe();
					
            	}) 
            	
            	function selectRecentRecipe(){
           	        $.ajax({ 
	           			url : "<%=contextPath%>/recentList.re", 
	           			success :function(recentList){
	           			
	           			
	           				let value = "";
	           				if(recentList.length == 0){
	           					
	           					value +=
	           				        "<div class='thumbnail' align='left'>"
	           		       		   + "조회된 게시글이 없습니다.</div>"
	           				}else{
	           					
	           				    for(let i = 0; i< recentList.length; i++){ 
	           				    
	           			        value += "<div class='thumbnail' align='left'>"
	           			              + "<a href='"+ '<%=contextPath %>/detail.re?no='+ recentList[i].recipeNo +"' style='color:rgb(113, 113, 113); text-decoration:none;'>"
	           			              + "<img src='" + recentList[i].mainImg + "' alt='' width='200' height='200'>"
	           			              + "<p>"
	           			              + recentList[i].recipeTitle + "<br>"
	           			              + recentList[i].recipeWriter
	           			              + "</p>"
	           			              + "</a>"
	           			       	      + "</div>"
	           			        
	           			        }
	           				    $("#con2-2").html(value);
	           				}
							
	           				
	           			},error:function(){
	           				console.log("에러발생");
	           			}
            		})	
            	}
            	

            </script>
	
        </div>
    </div>
    
    <%@ include file="footer.jsp" %> 
</body>
</html>