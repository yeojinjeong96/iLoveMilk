<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String loginFail = (String)session.getAttribute("loginFail"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberLoginView</title>
    <style>
        .under a{color: black; font-weight: bold; }
        
        .under {margin:auto; align :center;}
        .outer{
        weight: 700px;
        margin:auto;
        margin-top:50px;
        }
    </style>
    
</head>
<body>

	<%@ include file="../common/header.jsp" %> 	 	
	
	
	<div class="outer" align="center">
   
		<div class="login-area">
		
	    	<div class="login-header">
		    	<h1 align="center">로그인</h1>
		        <p align="center" style="font-size: 10px; color: darkgray;">회원로그인을 하시면 각종 혜택 및 정보를 제공 받으실 수 있습니다.</p> <br><br>
	    	</div>
			
			
			<div class="login-body">
		        <form action="<%= contextPath %>/login.me" method="post">
		        
		            <input type="text" name="memberId" placeholder="아이디" required> <br><br>
		
		            <input type="password" name="memberPwd" placeholder="비밀번호" required><br><br>
		            
		            <!-- <p><input type="checkbox"> 아이디저장</p> -->
		
		            <button type="submit">로그인</button>  
		            
		            <br><br>
				       
		        </form>
		        
		        <div class="under" >
				        <a onclick="enrollPage();">회원가입</a> &nbsp;&nbsp;| &nbsp;&nbsp;
				        <a onclick="idFindPage();">ID찾기</a> &nbsp;&nbsp;| &nbsp;&nbsp;
				        <a>PW찾기</a>
				</div>  
				<script>
	            	function enrollPage(){
	            		location.href = "<%=contextPath%>/enrollForm.me";
	            	};
	            	
	            	function idFindPage(){
	            		location.href = "<%= contextPath%>/idFindPage.me";
	            	};
            	</script>
	        </div>
        </div>
        
        <% if(loginFail != null){ %>
		<!-- 로그인 실패 모달 시작 -->
		<!-- The Modal -->
		<div class="modal fade" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    
		      	<!-- Modal Header -->
				<div class="modal-header">
				  <h4 class="modal-title">로그인 실패</h4>
				  <button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
				  로그인에 실패하였습니다. 아이디와 비밀번호를 확인해주세요.
				</div>
				
				<!-- Modal footer -->
		      	<div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
		      	</div>
		      
		    </div>
		  </div>
		</div>
		<!-- 로그인 실패 모달 종료 -->
		
		<script>
			$(document).ready(function() {
				$("#myModal").modal("show");
			});
		</script>
		
		<% session.removeAttribute("loginFail"); %>
	<% } %>
        
        
    </div>

	<%@ include file="../common/footer.jsp" %> 	 
    
   
</body>
</html>