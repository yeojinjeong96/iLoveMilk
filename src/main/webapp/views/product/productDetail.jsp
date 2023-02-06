<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.milk.product.model.vo.Product, com.milk.product.model.vo.Review, java.util.ArrayList" %>
<%@ page buffer="100kb" %>    
<%  
   Product p = (Product)request.getAttribute("p");
   ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");	
  
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 
    /* 전체 감싸는 div */
    .pro-outer{
        margin:auto;
        width:700px;
        height:2500px;
    }

    /* 제품 구매 */
    #pro-wrap1{
        width:100%;
        height:20%;
    }

    #pro-wrap1-1{
        width:100%;
        height:10%;
        
    }
    #pro-wrap1-1>a{
       text-decoration:none;
       line-height:40px;
    }

    #pro-wrap1-2{
        width:100%;
        height:10%; 
    }
    #pro-wrap1-2>p{
        line-height:40px;
        padding-left:20px;
        font-weight:550;
    }

    #pro-wrap1-3{
        width:100%;
        height:70%;
        
    }
    #pro-wrap1-3>div{
        float:left;
        width:50%;
        height:100%;

    }
    /* 상품이미지 */
    #pro-1-3-1>img{
        width:90%; 
        height: 90%;
        display:inline-block;
        margin:14px;
    }
    #pro-wrap1-3-2{
        width:50%;
        height:100%;
    }
    #pro-1-3-2-1{
        height:40%;
        padding-top:20px;
    }
    #pro-1-3-2-1 *{
        font-size:20px;
        padding-left:10px;
    }
    #pro-1-3-2-2{
        height:5%;
        border-top:1px solid gray;
    }

    #pro-1-3-2-3{
        height:40%;
        font-size: 13px;
    }
    #proSelect{
        width:100%;
        height:100%;
    }


    #pro-1-3-2-4{
        height:15%;
        position: relative;
    }

    .bi-heart, .bi-heart-fill{
        position: absolute;
        top: 20%;
        left: 3%;
    }
    #btn-buy{
        position: absolute;
        top: 25%;
        left:15%; 
    }
    #pro-wrap1-4{
        width:100%;
        height:10%;       
    }





    /* 상품설명 */
    #pro-wrap2{
        width:100%;
        height:50%;
        padding:20px;
    }
    #pro-info1{
        height:5%;
        width:100%;
    }
    #pro-info1>ul>*{
        float:left;
    }


    #pro-info2{
        height:80%;
        padding-top:10px;
        padding-bottom:10px;    
    }
    #pro-info2>img{
        width:100%;
        height:100%;

    }

    #pro-info3{
        height:15%
    }
    #pro-info3>p{
        height:100%; width:100%;
        margin-left: 10px; 
	    text-indent: -10px;
    }



    /* 리뷰 */
    #pro-wrap3{
        width:100%;
        height:30%;
    }

    #pro-wrap3-1{
            width:100%;
            height:20%;
            
        }
        


        /* 두번째 div */
        #pro-wrap3-2{
            width:100%;
            height:50%;
        }

        #pro-wrap3-2>*{float:left;}

        #pro-wrap3-3{
            width:100%;
            height:30%;
            
        }



</style>   
</head>
<body>
	


	<%@ include file="/views/common/header.jsp" %>
	

	
    <div class="pro-outer">

        <div id="pro-wrap1">

        <div id="pro-wrap1-1" align="left">
            <a href="<%=contextPath %>">HOME &gt; </a>
            <a href="<%=contextPath%>/proList.pro?category=<%=p.getfCategory().toString() %>&cpage=1"> 전체상품 </a> <!-- 경로이름 -->
        </div>

        <div id="pro-wrap1-2">
          <a href="<%=contextPath%>/proList.pro?category=<%=p.getsCategory().toString() %>&cpage=1" style ="color:gray;font-size:20px;"><%=p.getsCategory() %></a>  <!-- 2차 카테고리명 -->
        </div>

        <div id="pro-wrap1-3">
            <div id="pro-1-3-1">
                <img src="<%= p.getProductImg() %>" alt="" style=" ">
            </div>
            <div id="pro-wrap1-3-2">

                <div id="pro-1-3-2-1">
                   <p><%= p.getProductName() %></p>  <!-- 제품명 -->
                   
                  <b><%= p.getPrice() %>원</b> 
                </div>

                <!-- 선 집어넣을 div -->
                <div id="pro-1-3-2-2">
                </div>

			    <div id="pro-1-3-2-3">
                    <table class="pro-qna">
                        <tr>
                            <td width="100px;">상품코드</td>
                            <td id="pNo"><%= p.getProductNo() %></td>
                        </tr>
                        <tr>
                            <td>브랜드</td>
                            <td><%= p.getBrand() %></td>
                        </tr>
                        <tr>
                            <td>용량</td>
                            <td><%= p.getCapacity() %>(ml/g)</td>
                        </tr>
                        <tr>
                            <td>수량</td>
                            <td>
                                <input type="number" name="pro-amount" id="pro-amount"  min='1' style="width:50px;">

                            </td>
                        </tr>
                    </table>
                </div>
                
                <div id="pro-1-3-2-4"  align=center>
                    <i class="bi-heart like-btn" style="font-size:2rem; color: red; cursor: pointer;" onclick="memberLike(<%=p.getProductNo()%>);" ></i>
                    <button type="button" id="btn-buy"  style=" width:270px; height:40px;" class="btn btn-outline-primary">장바구니</button>
                </div>
                
            </div>
        </div>

        <div id="pro-wrap1-4"></div>
        </div>

        <div id="pro-wrap2">
            <div id="pro-info1">
                <ul class="nav nav-tabs nav-justified" role="tablist">
                    <!-- 클릭하면 class속성에 active붙게함 -->
                    <li class="nav-item"><a href="" id="tab1" class="nav-link tab-pane"  data-toggle='tab' >제품상세정보</a> </li>
                    <li class="nav-item"><a href="" id="tab2" class="nav-link tab-pane" data-toggle='tab'>리뷰</a> </li>
                </ul>
                
            </div>
            

    
            <div id="pro-info2">
                <img src="<%= p.getProductImg() %>" alt="">
                <!-- 상품이미지자리 -->
            </div>
                
            <div id="pro-info3">
                <p><%= p.getProductInfo() %></p>
            </div>
        </div>

        <div id="pro-wrap3">

            <!-- 리뷰 상단 -->
            <div id="pro-wrap3-1">
            
                <div style="font-size:20px; line-height: 70px;"><p><b>상품리뷰</b></p></div>
                
            </div>
            <div style="border-bottom:1px solid gray;"></div> 

            <div id="pro-wrap3-2" style="position:relative;">


				<%if(!(list.isEmpty())){ %>
	                 <!--리뷰내용 -->
	                 <%for(Review r : list){ %>
		                <div>
		                    
		                </div>
		
		                <div style="width:590px; height:100px;">
		                    <p style="width:100%">상품번호 : <%=r.getReviewNo()%> <br>상품명 : <%= r.getProductName() %>
		                    	<%if(loginMember != null && !(loginMember.getMemberNo() ==r.getMemberNo())){ %>
		                            <!--조건문 써서 작성자 아니면 신고  -->
		                            <a href="" style="float:right;" data-toggle="modal" data-target="#mem-report" >신고</a>
		                        <%} else if(loginMember != null && (loginMember.getMemberNo()== r.getMemberNo())){ %>    
		                            <!-- 조건문 써서 작성자일때에는 수정 | 삭제 -->
		                            <a href="<%=contextPath %>/review.me" style="float:right;">수정</a>   <a href="<%=contextPath %>/review.me" style="float:right;">삭제</a>
		                        <%} %>    
		                    </p> 
		                   
		                    <div style="height:5%; border-bottom:1px solid gray;"></div>
		             
		                    <p>
							<%for(int i = 1; i <= r.getStar(); i++){ %>
                                <img src="resources/images/star.png">
                             <%} %>
		                    <br> <%=r.getContent() %></p>
		                </div>
	                <%} %>
				<%}else{ %>
					<div id="rev-none" align='center' style=""><img src="resources/images/smile.png" alt="" width="40px" style="position:absolute;left:46%; top:30%;">
                    <p style="position:absolute;left:36%; top:52%;">작성된 리뷰가 없습니다.</p>
                    </div>
				<%} %>
            </div>

		
                
         
        </div>
        
        </div>
		

		<script>
		
		
		$(document).ready(function(){
		// 스크롤이동 메서드
			$('#tab1').click(function(){
		
				var offset = $('#pro-info2').offset(); //선택한 태그의 위치를 반환
		
		               //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
		
		        $('html').animate({scrollTop : offset.top}, 400);
		
			});
			
			
			$('#tab2').click(function(){
				
				var offset = $('#pro-wrap3-2').offset(); 
		        $('html').animate({scrollTop : offset.top}, 400);
		
			});
			
			
		
		});
		
			$('#btn-buy').click(function(){
				
				<% if(loginMember != null){%>
					
					$.ajax({
	            		url:"<%= contextPath %>/cartIn.pr",
	            		data:{
	            			proNo:$("#pNo").html(),
	            			amount:$("#pro-amount").val()
	            		},
						type:"post",
	            		success:function(result){
	            			if(result > 0){
		            			if(confirm("장바구니에 추가되었습니다. 해당페이지로 이동하시겠습니까?")){
		    						location.href="<%=contextPath%>/cart.pr";
		    					}
	            			}else{
	            				alert("장바구니에 동일한 상품이 존재합니다.");
	            			}
	            		},
	            		error:function(){
	            			console.log("장바구니 추가용 ajax통신 실패");
	            		}
	            	});
					
				<%}else{%>
					alert("로그인이 필요한 기능입니다. 로그인 후 사용해주세요");
					location = "<%=contextPath%>/loginpage.me";
				<%}%>
				
			});
		
		</script>


 
        <script>

	     
        
 		// 로그인이 되어있을 경우     			
	   	   
		   
           		var i = 0;
           	  $('i').on('click',function(){
				 <% if( loginMember != null ){ %>	
	           	
	        	   // 찜하기 하트
	               if(i==0){
	                   $(this).attr('class','bi-heart-fill');
	                   i++;
	                   
	                  
	               //찜해제    
		           }else if(i==1){
	                   $(this).attr('class','bi-heart');
	                   $(this).removeAttr('data-target','#like-product');
	                    i--;   
	                    
		           }
	           					       // 로그인 안했을 경우
				<%} else{ %>
					alert("로그인이 필요한 기능입니다. 로그인 후 사용해주세요");
					location = "<%=contextPath%>/loginpage.me";
				<%}%>
           	  })			   
	    	

			
			
			// 찜하기 AJAX
			function memberLike(pno){
				
           		<% if(loginMember != null){%>
					let memberNo = <%=loginMember.getMemberNo()%>;
				
	               $.ajax({
	                   url: "<%=contextPath%>/likeProduct.pro",
	                  data: {pno: pno, 
	                     memberNo:memberNo
	                   },
	                   success:function(result){
	                      	
	                	   if(result > 0){
								
								var con = confirm(" 찜목록추가되었습니다. 해당페이지로 이동하시겠습니까?");
								if(con){
									location.href="<%=contextPath%>/plike.me";
								}
	                         }
	                       
	                    },
	                    error: function(){
	                      alert("찜하기 실패");
	                   }
	
	               });
     			
			<%}%>
			
			}

			

        </script> 
        
                <!-- 신고사유선택 모달 div -->
                <div class="modal" id="mem-report">
                    <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">신고사유선택</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                
                    <!-- Modal body -->
                    <div class="modal-body">
                    
                    <form action="" method="post">
                            <input type="hidden" name="" value="">
                            <table  style="width:100%; height:150px;">
                                    <tr>
                                        <td><input type="radio" name="report-content" value="광고성게시물"> </td>
                                        <td>광고성 게시물</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="report-content" value="도배 및 중복 게시물"> </td>
                                        <td>도배 및 중복 게시물</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="report-content" value="욕설/비방"> </td>
                                        <td>욕설/비방</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="report-content" value="외설적인 게시물"> </td>
                                        <td>외설적인 게시물</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="report-content" value="기타"> </td>
                                        <td>기타</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <textarea name="" id="" cols="20" rows="2" style=" resize:none" placeholder="신고내용을 입력해주세요(15자 이내)"></textarea>
                                        </td>
                                    </tr>
                            </table>
        
                            <br>
                            <div align="center">
                            <button onclick="alert("성공적으로 신고접수 되었습니다.");" type="submit" class="btn btn-outline-secondary"  style=" width:200px;">신고하기</button> 
                            <br> 
                            <button type="reset" class="btn btn-outline-secondary"  style=" width:200px;" data-dismiss="modal" >닫기</button>
                            </div>    
                    </form>
                    
                    
                    </div>
                
                    </div>
                </div>
                </div>

    </div>
    
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>