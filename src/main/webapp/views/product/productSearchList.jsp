<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import ="com.milk.common.model.vo.PageInfo, java.util.ArrayList, com.milk.product.model.vo.Product" %>    

<% 
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
    String keyword = (String)request.getAttribute("keyword");
    int listCount = (int)(request.getAttribute("listCount"));
    String keyOption = (String)request.getAttribute("keyOption");
%> 
           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>

        /* 전체 감싸는 div */
        .pro-area{
            box-sizing : boarder-box;
            margin:auto;
            width:700px;
            /*추후 조정예정*/
            height:2000px; 
        }

        .search-outer{
           background:rgb(238, 236, 236);
           margin-top:50px;
           width:600px;
           height:10%;
          
        }
        .search-outer>*{
            width:100%;
            height:50%;
        }

        #search2{
            padding-left:70px;
        }

        /* 두번째 div */
        #pro-seq{
            width:100%;
            height:5%;
            padding-top:30px;
        }
        #pro-seq>select{
           float:right;
        }

        #pro-seq>a{            
            width:100%;
            height:100%;
            text-decoration:none;
            font-size:13px;
            font-weight:550;
            color:rgb(106, 103, 103);
            padding : 5px;
           
        }

        /* 세번째 div */
        #pro-content{
            width:100%;
            height:80%;
            
        }

        .thumbnail{
        width:200px;
        display:inline-block;
        margin:14px;
        position: relative;
        height:280px;
        }

        

        .thumbnail .like-btn, .bi-heart, .bi-heart-fill{
            position: absolute;
            top: 63%;
            left: 85%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            cursor: pointer;
        }



        /* 네번째 div */
        #pro-paging>.paging-area{
            width:100%;
            height:5%;
            
        }



    </style>
 
</head>
<body>

    <%@ include file="../common/header.jsp" %>

    <div class="pro-area">

        <div class="search-outer" align="center">
            <br>
            <div>
                <p style="font-size:25px;">"<%=keyword %>"검색결과 <%=listCount%>개</p>
            </div>
            <div id="search2">
            	<form action="<%=contextPath %>/reSearch.pro?cpage=1" method="post" id="search-form">
	                <select name="keyOption" id="">
	                	<option value="productName">상품명</option>
	                    <option value="brand">브랜드명</option>
	                    
	                </select>
	                <input type="text" name = "keyword" style="width:200px;" maxlength="30" required>
	                <button type="submit" class="btn btn-primary btn-sm">검색</button>
	                <input type="checkbox" name="research" id="re-search1" value="0" checked><label for="re-search">결과 내 재검색</label>
	                <input type="hidden" name="research" id="re-search2" value="1"><label for="re-search"></label>
                </form>
            </div>
            
            <script>
            // if문 사용하여 결과내 재검색 넘겨줄값 설정하기
            	if($("#re-search1").checked){
            		$("#re-search2").disabled = "true";
            	}
            
            $("#search-form option").each(function(){
            	if($(this).val() == "<%=keyOption%>"){
            		$(this).attr("selected", true);
            	}
            })
            </script>
    
        </div>

        
        <div id="pro-content" >
            <!-- for문사용하여 제품 정보랑 이미지 뽑아서 화면에 출력 (갯수는 정렬 수대로 출력예정) -->
			<% if(list.isEmpty()){ %>
				<div class="thumbnail" align="center" >
					조회된 상품이 없습니다.
				</div>
			<%}else{ %>
				<%for(Product p : list) {%>
					
	            <div class="thumbnail" align="left">
	                <a href="<%=contextPath %>/proDetail.pro?pno=<%=p.getProductNo() %>" style="color:rgb(113, 113, 113); text-decoration:none;">
	                <img src="<%= contextPath%>/<%=p.getProductImg() %>" alt="" width="200" height="200">
	                
	                <div>
                            <b style=font-size:13px;><%=p.getBrand() %></b> <br>
                             <%=p.getProductName() %>
                        <br>
	                    <%=p.getPrice() %> 원
	                </div>
	                </a>
	                 <i class="bi-heart like-btn" style="font-size:2rem; color: red; cursor: pointer;" onclick="memberLike(<%=p.getProductNo()%>);"></i>
	            </div>
			<%} %>
		<%} %>
        </div>

    	
    	 
         <script>
			     
        
         		// 로그인이 되어있을 경우     			
			   	   
				   
		           		var i = 0;
		           	  $('i').on('click',function(){
						 <% if(loginMember != null ){ %>		
			           	
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

        <div id="pro-paging">
        	
            <div class="paging-area" align="center">
                <!-- 내가 보고있는 페이지가 1번 페이지가 아닐때에만 나타내기 -->
                <% if(pi.getCurrentPage() != 1){ %>
                <button onclick="location.href='<%=contextPath%>/search.pro?cpage=<%= pi.getCurrentPage()-1%>&keyword=<%=keyword%>';">&lt;</button>
                <%} %> 
                

                
                <%for(int p = pi.getStartPage() ; p <= pi.getEndPage() ; p++) { %>
                <button onclick="location.href='<%=contextPath%>/search.pro?cpage=<%=p%>&keyword=<%=keyword%>';"><%= p %></button>
                <% } %>
                

                <!--  내가 보고있는 페이지가 마지막 페이지가 아닐 때에만 나타내기 -->
                <%if(pi.getCurrentPage() != pi.getMaxPage()){ %> 
                <button onclick="location.href='<%=contextPath %>/search.pro?cpage=<%=pi.getCurrentPage()+1%>&keyword=<%=keyword%>';">&gt;</button>
                 <%} %> 
                
            </div>
        </div>    
    </div>

     

        <%@ include file="../common/footer.jsp" %>
</body>
</html>