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
        #header{
            
            font-size: 25px;
            font-weight: bolder;
            
        }
        #comment{
            font-size: 15px;
            margin: none;
        }
        .serch{ width: 80%; }
        #pass * {  margin: auto;}
        #pass{
            border: 1px solid gray;
            width: 80%;
            padding: 30px 20px 30px 20px;
            font-size: 10px;    
			margin-left: 150px;
			border-radius: 5px;
        }
        #back{
            background: rgb(121, 205, 234);
            border: none;
            border-radius: 2px;
            width: 100px;
            height: 30px;
            color: white;
            font-weight: bolder;
        }
        #input{
            background: rgb(0, 174, 232);
            border: none;
            border-radius: 2px;
            width: 100px;
            height: 30px;
            color: white;
            font-weight: bolder;
        }
        input{
            border-radius: 2px;
            border : 1px solid darkgray;
            height: 30px;
        }

		#passbtn{
			margin-top: 50px;
			margin-left: 150px;
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
		
		<script>
		$(".mainmember").hide();	
		</script>
		
		<div class="maincontent">
		
			<div class="outer_up">
			
				<p id="header">회원정보변경</p>
				<p id="comment">회원님의 정보를 안전하게 보관하기위해 비밀번호를 다시 한번 확인해주세요 </p>
				
				<br><br><br><br>
				
				<div align="center" class="serch" >
					<form action="<%= contextPath %>/update1.me"  method="post">
						<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>">
						<div id="pass">

							<table>
								<tr>
									<th height="30" style="font-size: 14px; padding: 15px;">아이디</th>
									<td style="font-size: 14px; font-weight: bolder;"><%= loginMember.getMemberId() %></td>
								</tr>
																		
								<tr>
									<th height="30" style="font-size: 14px; padding: 15px; ">비밀번호</th>
									<td>
									<input type="password" name="memberPwd" placeholder="비밀번호를 입력해주세요">
									</td>
								</tr>
							</table>

						</div>
						
									
						<div id="passbtn">

							<button type="button" id="back">취소</button> <!-- 뒤로가기-->
							<button type="submit" id="input">인증하기</button>

						</div>
							
					</form>
				</div>
			</div>
			
		</div>

	</div>
	
	
	<%@ include file="../common/footer.jsp" %> 	 





   
</body>
</html>