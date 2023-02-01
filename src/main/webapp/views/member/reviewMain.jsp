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
       .reviewTop{padding-bottom: 50px;}
       #rInfoBody{font-size: 15px;}
       .rbtn{
            background: rgb(16, 108, 255);
            border: none;
            border-radius: 20px;
            width: 200px;
            height: 50px;
            font-weight: bold;
            color: white;
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
                <input type="button" class = "rbtn" style="margin-right: 30px;" value="리뷰작성" onclick="reviewMobePage('/views/member/reviewInsertList')"></input>
                <button type="button" class = "rbtn" data-toggle="modal" data-target="#reviewList">작성한 리뷰</button>
       </div>
       
       <div class="maincontent">
        
        <script>
 
          
         
        </script>
        
        
        
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