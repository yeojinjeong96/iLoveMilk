<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
        #enroll-form table{margin:auto;}
	    #enroll-form input{margin:5px;}
       .outer{
        weight: 700px;
        margin:auto;
        margin-top:50px;
        }
        .table{
         weight: 500px;
        }
    </style>
</head>
<body>
	<%@ include file="../common/header.jsp" %> 	


    <div class="outer" align="center">

		<br>
		<h2 align="center">회원가입</h2>
        <p align="center" style="font-size: 10px; color: darkgray;">회원이 되셔서 다양한 서비스를 받으세요</p>
		<p align="center" style="font-size: 10px; color: red; width: 530px;">*은 필수 입력 사항입니다</p>
		
		
		<form name="enroll-form" action="<%= contextPath %>/insert.me" method="post" enctype="multipart/form-data" id="enroll-form">

			<table class="table" >
				<tr>
					<td>* 아이디</td>
					<td><input type="text" name="userId" placeholder="이름을 입력해주세요" required><br></td>
					<td><button type="button" >중복확인</button></td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" name="userPwd" maxlength="15" required></td>
					<td></td>
				</tr>
				<tr>
					<td>* 비밀번호 확인</td>
					<td><input type="password" maxlength="15" required></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="userName" maxlength="5" required></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;전화번호</td>
					<td><input type="text" name="phone" placeholder="-포함해서입력"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이메일</td>
					<td><input type="email" name="email" required></td>
					<td><button type="button" onclick="emailCodeSend()" id="emailsend" >인증번호발송</button></td>
				</tr>
                <tr>
					<td></td>
					<td><input type="email" name="emailcode" id="inputemailCode" disabled="disabled" required></td>
					<td><button>인증확인</button></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;주소</td>
					<td><input type="text" name="address"></td>
					<td><button>우편번호</button></td>
				</tr>
                <tr>
                    <td></td>
                    <td><input type="text"></td>
                </tr>
				
			</table>
			
			<script>
			
				
			
			</script>

			<br><br>
               
            <div align="center">

                <p align="center"><input type="checkbox"> 아이럽우유의 모든 약관을 확인하고 전체 동의합니다 <br> </p>
                <div style="width: 400px;"  align="left">
                    <table>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>(필수) 이용약관</td>
                            <td><button type="button">자세히 보기</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>(필수) 개인정보 수집 및 이용</td>
                            <td><button type="button">자세히 보기</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td colspan="2">(필수) 본인은 만 14세 이상입니다.</td>
                        </tr>
                    </table>
                </div>
            </div>
			<div align="center">
				<button type="submit">가입하기</button>	
			</div>
			<br><br>
		</form>

	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>