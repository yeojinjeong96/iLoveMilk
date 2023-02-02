<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
       .reviewheader{font-size: 25px; font-weight: bolder; padding-bottom: 50px;}
       .reviewinformation{font-size: 10px;}
       .reviewTop{padding-bottom: 50px; margin-left: 400px; }
       #rInfoBody{font-size: 15px;}
       .rbtn1 {
            background: rgb(16, 108, 255);
            border: none;
            border-radius: 20px;
            width: 200px;
            height: 50px;
            font-weight: bold;
            color: white;
            margin-right: 30px;
            margin-bottom: 50px;
            float: left;
       }
       .rbtn2 {
            background: rgb(16, 108, 255);
            border: none;
            border-radius: 20px;
            width: 200px;
            height: 50px;
            font-weight: bold;
            color: white;
            float: left;
       }

       #rbnn{
       		color : white;
       		text-decoration-line: none;
       }
   </style>
</head>
<body>	
   
   <%@ include file="../common/header.jsp" %>
   
    <%
    	String memberId = loginMember.getMemberId();
		int memberNo = loginMember.getMemberNo();
		String memberPwd = loginMember.getMemberPwd();
		String profile = loginMember.getProfile();
		String memberName = loginMember.getMemberName();
    	String phone = loginMember.getPhone() == null ? "" : loginMember.getPhone(); 
    	String email = loginMember.getEmail();
    	String addressNumber = loginMember.getAddressNumber() == null ? "" : loginMember.getAddressNumber();
    	String address = loginMember.getAddress() == null ? "" : loginMember.getAddress();
    	String addressDetail = loginMember.getAddressDetail() == null ? "" : loginMember.getAddressDetail();
    	%>
   
   
   <div class="outer">

       <div class="mainmenubar" >
           <%@ include file="../common/myPageMenubar.jsp" %> 	
       </div>
               
       <div class="mainmember">
            <%@ include file="../member/memberInformation.jsp" %> 
       </div>
       
        <div class="reviewheader">
            리뷰관리
            <a class="reviewinformation" href="" data-toggle="modal" data-target="#reviewinformation">리뷰운영안내</a>
        </div>
       <div class="reviewTop" align="center">
            <div class="rbtn1"><br><a id="rbnn" href="<%= contextPath %>/review.me">리뷰작성</a></div>
            <div class="rbtn2"><br><a id="rbnn" href="<%= contextPath%>/reviewList.me">작성한리뷰</a></div>
       </div>
       
		<div class="maincontent">
			 <form action="">
                <table border="1">
                    <tr >
                        <td style="width: 150px; height: 150px;" align="center"> <img src="" alt=""> 사진자리 </td>
                        <td style="width: 300px;">
                            <div>상품이름</div>
                            <div>별점</div>
                        </td>
                        
                        <td style="width: 100px;" align="center">
                            <button type="button" class = "btn btn-secondary btn-sm" data-toggle="modal" data-target="#reviewModify">수정</button>
                            <button type="submit" class = "btn btn-secondary btn-sm"> 삭제</button>
                        </td>
                        
                        <!-- 
                        <% //if(list.isEmpty()){ %>
                        
                            <tr>
                                <td colspan="3"> 작성할 수 있는 리뷰가 없습니다.</td>
                            </tr>
                        <% //}else{ %>
                        
                            <% //for(Review : list){ %>
                            <tr>
                                <td style="width: 100px;"> <img src="" alt=""> 사진자리 </td>
                                <td style="width: 300px;">상품이름</td>
                                <td style="width: 100px;">
                                    <button type="button" class = "btn btn-secondary btn-sm" data-toggle="modal" data-target="#reviewInsert">리뷰작성</button>
                                </td>
                            </tr>
                            <%// } %>
                        <%// } %>
                        
                        -->
                        
                    </tr>
                </table>
        		
        		 <!-- 리뷰 수정용 모달 div -->
                 <div class="modal" id="reviewModify">
                    <div class="modal-dialog">
                      <div class="modal-content">
                  
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h4 class="modal-title">리뷰 수정하기</h4>
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                  
                        <!-- Modal body -->
                        <div class="modal-body">
                            <form action="<%=contextPath %>" method="post">
                                <input type="hidden" name ="memberId" value="<%= memberId %>">
                               
                                <table border="1">
                                    <tr>
                                         <td style="width: 100px;"> <img src="" alt=""> 사진자리 </td>
                                         <td style="width: 400px;">상품이름</td>
                                    </tr>
                                    <tr>
                                        <th>상세리뷰</th>
                                        <td>
                                             <textarea name="content" rows="10" style="resize:none" required></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>사진첨부</th>
                                        <td><input type="file" id="reviewPhoto" required></td>
                                    </tr>
                                </table>
                                <br>
                                
                                <button type="submit" class = "btn btn-secondary btn-sm">리뷰 등록</button>
                            
                            </form>
                        </div>
                  
                      </div>
                    </div>
                  </div>



            </form>       
        
        
                <!-- 리뷰 안내용 모달 div -->
                <div class="modal" id="reviewinformation">
                    <div class="modal-dialog">
                      <div class="modal-content">
                  
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h4 class="modal-title">리뷰 운영 안내</h4>
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                  
                        <!-- Modal body -->
                        <div class="modal-body" id="rInfoBody">

                            <br>
                            안녕하세요. 아이러브밀크 입니다. 
                            <br>
                            리뷰를 작성해 주시는 많은 고객님께 감사의 마음을 전합니다.
                            <br>
                            칭찬 및 만족감을 표현해 주시는 리뷰, 구체적인 상품 후기 등은 저희에게 뿌듯함을 주며, 더욱 좋은 상품을 제공하는 힘이 됩니다.  
                            <br>
                            물론, 상품에 대해 불편한 점, 부족한 점을 지적해 주신 리뷰 또한 소중히 생각하며, 의견 하나하나 귀담아들으며 개선해야 하는 사항은 없는지 늘 살피고 있습니다.
                            <br>
                            <br>
                            다만, 구매 제품의 후기와 상관없는 리뷰 및 개인적인 입장 및 비방 리뷰는 쇼핑몰 이미지 훼손과 다른 고객님께 혼동을 일으킬 수 있습니다.
                            <br>
                            아래의 경우 무통보 삭제 될 수 있는 점 참고해 주시기 바랍니다.
                            <br>
                            <br>
                            - 광고/홍보 상업적 리뷰
                            <br>
                            - 상품과 관련 없는 비방 리뷰
                            <br>
                            - 사실과 다른 비방, 비하 리뷰
                            <br>
                            - 당사 처리 불가 정책 및 서비스 비하 리뷰
                            <br>
                            - 상품 반품 후 작성한 리뷰
                            <br>
                            - 상품 리뷰가 아닌 교환/반품 요청 문의 등
                            <br>
                            <br>

                            언제나 즐겁게 쇼핑하실 수 있게 노력하겠습니다 :)
                            <br>
                            감사합니다.
                        </div>
                  
                      </div>
                    </div>
                  </div>

                   
		</div>
	</div>
         
           
      
   
   <%@ include file="../common/footer.jsp" %> 	 


</body>
</html>