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
        
       .recipeViewheader{font-size: 25px; font-weight: bolder; padding-bottom: 50px;}
       .reviewinformation{font-size: 10px;}
       .reviewTop{padding-bottom: 50px;}
       #rInfoBody{font-size: 15px;}
       .rebtn{
            background: rgb(16, 108, 255);
            border: none;
            border-radius: 3px;
            width: 40px;
            height: 30px;
            font-weight: bold;
            font-size:13px;
            color: white;
       }
   </style>
</head>
<body>	
   
   <%@ include file="../common/header.jsp" %>
   
    <%
    	String memberId = loginMember.getMemberId();
		int memberNo = loginMember.getMemberNo();
    %>
   
   
   <div class="outer">

       <div class="mainmenubar" >
           <%@ include file="../common/myPageMenubar.jsp" %> 	
       </div>
               
       <div class="mainmember">
            <%@ include file="../member/memberInformation.jsp" %> 
       </div>
       
        <div class="recipeViewheader">
            내가 쓴 레시피
            
        </div>
       
       
       <div class="maincontent">
        	<form action="" class="like">
	            <table border="1" align="center">
	
	                <div id="thead">
	                    <tr style="font-size:15px" align="center">
	                        <th style="width: 50px" >글번호</th>
	                        <th style="width: 400px" >제목</th>
	                        <th style="width: 150px" >작성일</th>
	                        <th style="width: 100px">수정삭제 </th>
	                    </tr>
	                </div>
	
	                <div id="tbody">
	                	<tr style="font-size:15px" align="center">
	                        <th >글번호</th>
	                        <th >제목</th>
	                        <th >작성일</th>
	                        <th >
	                        	<button class="rebtn">수정</button>
	                        	<button class="rebtn">삭제</button>
	                        </th>
	                    </tr>
	                
	               
	                </div>
	            </table>
            
        	</form>
        

                   
	   </div>
	</div>
         
           
      
   
   <%@ include file="../common/footer.jsp" %> 	 




  
</body>
</html>