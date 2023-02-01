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
       
       <div class="order-list">
            <h2>주문목록 / 배송조회 내역 총 X 건</h2>
            <table id="list" border="1px solid gray;">
                <tr>
                    <th width="15%">날짜<br>주문번호</th>
                    <th width="61%">상품정보</th>
                    <th width="12%">주문상태</th>
                    <th width="12%">확인</th>
                </tr>
                <tr>
                    <td align="center">2022 - 00 - 00 <br> 00000000</td>
                    <td>
                        <table id="information">
                            <tr>
                                <th rowspan="4">이미지</th>
                                <td>착한목장 무항생제 우유 44팩</td>
                            </tr>
                            <tr>
                                <td>10000원 / 개</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp; </td>
                            </tr>
                        </table>
                       
                    </td>
                    <td align="center">결제완료<br>상품준비중</td>
                    <td align="center">대기</td>
                </tr>
            </table>
            
        </div>
       
               
		</div>
	</div>
         
           
      
   
   <%@ include file="../common/footer.jsp" %> 	 




  
</body>
</html>