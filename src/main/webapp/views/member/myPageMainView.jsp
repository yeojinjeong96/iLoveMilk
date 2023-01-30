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

		<div class="maincontent">
						서비스
		</div>
				
	</div>
	
	
	<%@ include file="../common/footer.jsp" %> 	 
    
	
	
	

</body>
</html>