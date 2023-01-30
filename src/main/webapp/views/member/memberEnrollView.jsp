<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
        #enroll-form table{margin:auto; padding-top :50px ;}
	    #enroll-form input{margin:2px;}
       .outer{
        margin:auto;
        margin-top:50px;
		width: 700px;
        }
         input::placeholder{font-size: 5px; margin: auto;}
        td{
        	height:50px; 
        	margin:auto;
        	font-size:12px;
        	vertical-align:middle;
        }
       
        input{
        	height:30px;
        	width: ;
        	font-size:15px;
        }
        
        .btn{
        	margin-top:-4px;
        	height :25px;
        	text-align: center; 
        	
        }
        
        label{
       		font-size:15px;
       		margin:auto;
			
       		
        }
        
		.checkbox{margin-left: 400px;}

		#insert{padding-top: 20px;}

		
    </style>
</head>
<body>
	<%@ include file="../common/header.jsp" %> 	


    <div class="outer" align="center">
		
		<div class="enroll-header">
			<h2 align="center">회원가입</h2>
	        <p align="center" style="font-size: 10px; color: darkgray;">회원이 되셔서 다양한 서비스를 받으세요</p>
			<p align="center" style="font-size: 10px; color: red; width: 530px;">*은 필수 입력 사항입니다</p>
		
		</div>
		
		
		
		<div class="enroll=body" style="width:600px">
			<form name="enroll-form" action="<%= contextPath %>/insert.me"  method="post" id="enroll-form">
	
				<table class="table" style="width:400px">
					<tr style="width:500px">
						<td style="width:150px">* 아이디</td>
						<td style="width:350px">
							<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력해주세요" required>
							<button id ="id" type="button" class="btn btn-outline-secondary btn-sm" onclick="idCheck();">중복확인</button>
							<div class = "pop2" id= "pop2">영소문/숫자를 조합하세요(4~12자)</div>
						</td>
					</tr>
					<tr>
						<td>* 비밀번호</td>
						<td>
							<input class ="pwd" type="password" id="pwd1" name="memberPwd" pattern=".{8,20}" title="8자 이상 20이하로 작성하세요" placeholder="영소문/숫자를 조합하세요(8~20자)" required>
							<div class = "pop1" id= "pop1">영소문/숫자를 조합하세요(8~20자)</div>
							
						</td>
						
					</tr>
					<tr>
						<td>* 비밀번호<br>&nbsp;&nbsp;확인</td>
						<td>
							<input class="pwd_chk" type="password" id="pwd2" name="memberPwd2" pattern=".{8,20}" title="8자 이상 20이하로 작성하세요" placeholder="영소문/숫자를 조합하세요(8~20자)" required >
							<div class = "pop_su" id= "pop_su_su">비밀번호가 일치합니다</div>
							<div class = "pop_fa" id= "pop_fa_fa">비밀번호가 일치하지 않습니다</div>
						</td>
					</tr>
					<tr>
						<td>* 이름</td>
						<td><input type="text" id="memberName" name="memberName" required placeholder="이름을 입력해주세요"></td>
						<div class = "pop3" id= "pop3">올바른 이름을 작성해주세요</div>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;전화번호</td>
						<td><input type="text" name="phone" placeholder="-포함해서입력"></td>
					</tr>
					<tr>
						<td>* 이메일</td>
						<td>
							<input type="email" name="email"  id ="inputEmailForm" required placeholder="aaa@ilovemilk.com">
							<button type="button" class="btn btn-outline-secondary btn-sm"  id="emailAuthBtn" >인증번호발송</button>
							<div class = "pop4" id= "pop4">올바르지 않은 이메일 양식입니다.</div>
						</td>
					</tr>
	                <tr>
						<td></td>
						<td>
							<input type="text" name="authCode" id="inputAuthCode" maxlength="10" disabled="disabled" required>
							<button  id="authCodeCheckBtn" type="button" disabled="disabled" class="btn btn-outline-secondary btn-sm" >인증확인</button>
							
						</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;주소</td>
						<td>
							<input type="text"  id="sample6_postcode" style="width:150px" name="addressNumber" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
							
						</td>
					</tr>
	                <tr>
	                    <td></td>
	                    <td><input type="text"  id="sample6_address" placeholder="주소" style="width:250px" name="address"></td>
	                   
	                </tr>
	                <tr>
	                    <td></td>
	                    <td >
	                    	<input type="text" id="sample6_detailAddress" name="addressDetail" placeholder="상세주소" style="width:150px">
	                    	<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width:100px">
	                    </td>
	                </tr>
					
				
					
				</table>
				
				<!-- 유효성 검사 -->
				<script>
				
					$("#pop1").hide();	
					$("#pop2").hide();	
					$("#pop3").hide();
					$("#pop4").hide();
				
					var id =/^[a-z0-9]{4,12}$/;
					
					var pw = /^[a-z0-9]{8,20}$/; 
					
					var name = /^[가-힣]{2,6}$/;
					
					var mail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					
					$('#pwd1').keyup(function(){
						if(pw.test($('#pwd1').val())){
							$("#pop1").hide();	
						}else {
							$("#pop1").show();	
							$("#pop1").css("color", "red");	
							$("#pop1").css("font-size", "10px");	
						}
					});
					
					$('#memberId').keyup(function(){
						if(id.test($('#memberId').val())){
							$("#pop2").hide();	
						}else {
							$("#pop2").show();	
							$("#pop2").css("color", "red");	
							$("#pop2").css("font-size", "10px");
						}
					});
					
					$('#memberName').keyup(function(){
						
						
						if(name.test($('#memberName').val())){
							$("#pop3").hide();	
						}else {
							$("#pop3").show();	
							$("#pop3").css("color", "red");	
							$("#pop3").css("font-size", "10px");
						}
					});
					
					$('#inputEmailForm').keyup(function(){
						if(mail.test($('#inputEmailForm').val())){
							$("#pop4").hide();	
						}else {
							$("#pop4").show();
							$("#pop4").css("color", "red");	
							$("#pop4").css("font-size", "10px");
						}
					});
					
				
				</script>
				
				
				<!-- 비밀번호 확인 -->
				<script>
					
					$(function(){
						
						$("#pop_su_su").hide();
						$("#pop_fa_fa").hide();
						
						 $(".pwd_chk").keyup(function(){
							var pwd1 = $("#pwd1").val();
							var pwd2 = $("#pwd2").val();
							 if(pwd1 == pwd2){
								 $("#pop_su_su").show();
								 $("#pop_fa_fa").hide();
								 $("#submit").removeAttr("disabled");
							 }else {
								 $("#pop_su_su").hide();
								 $("#pop_fa_fa").show();
								 $("#submit").attr("disabled", "disabled");
							 }
						 })
					})
					
				</script>
				
				
				
				<!-- 주소 api  -->
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
					    function sample6_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
					                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                var addr = ''; // 주소 변수
					                var extraAddr = ''; // 참고항목 변수
					
					                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					                    addr = data.roadAddress;
					                } else { // 사용자가 지번 주소를 선택했을 경우(J)
					                    addr = data.jibunAddress;
					                }
					
					                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					                if(data.userSelectedType === 'R'){
					                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
					                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					                        extraAddr += data.bname;
					                    }
					                    // 건물명이 있고, 공동주택일 경우 추가한다.
					                    if(data.buildingName !== '' && data.apartment === 'Y'){
					                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                    }
					                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					                    if(extraAddr !== ''){
					                        extraAddr = ' (' + extraAddr + ')';
					                    }
					                    // 조합된 참고항목을 해당 필드에 넣는다.
					                    document.getElementById("sample6_extraAddress").value = extraAddr;
					                
					                } else {
					                    document.getElementById("sample6_extraAddress").value = '';
					                }
					
					                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                document.getElementById('sample6_postcode').value = data.zonecode;
					                document.getElementById("sample6_address").value = addr;
					                // 커서를 상세주소 필드로 이동한다.
					                document.getElementById("sample6_detailAddress").focus();
					            }
					        }).open();
					    }
					    
					   
					</script>
					
					
			
			</div>
			
			<br><br>
               
            <div class="enroll-bottom" align="center" >

					<input type="checkbox" id="check_all" >
					<label for="check_all">아이럽우유의 모든 약관을 확인하고 전체 동의합니다</label>
					<br>	
					<div class="checkbox" align="left">	  
						<input type="checkbox" id="check_1" class="normal" >
						<label for="check_1" class="checkboxLabel">(필수) 이용약관</label> <button type="button" class="btn btn-outline-secondary btn-sm">자세히보기</button>
						<br>
						<input type="checkbox" id="check_2" class="normal" >
						<label for="check_2">(필수) 개인정보수집 및 이용</label> <button type="button" class="btn btn-outline-secondary btn-sm">자세히보기</button>
						<br>					  
						<input type="checkbox" id="check_3" class="normal" >
						<label for="check_3">(필수) 본인은 만 14세 이상입니다</label>
	                	<br>
                	</div>	
            </div>
            
            <!-- 체크박스 -->
            <script>
        	// 체크박스 전체 선택
            $(".enroll-bottom").on("click", "#check_all", function () {
                $(this).parents(".enroll-bottom").find('input').prop("checked", $(this).is(":checked"));
            });
        	
         	// 체크박스 개별 선택
            $(".enroll-bottom").on("click", ".normal", function() {
                var is_checked = true;

                $(".enroll-bottom .normal").each(function(){
                    is_checked = is_checked && $(this).is(":checked");
                });

                $("#check_all").prop("checked", is_checked);
            });
            
    		</script>
            
			<div align="center" id="insert">
				<button type="submit" id="submit" class="btn btn-outline-secondary btn-sm">가입하기</button>	
			</div>
			<br><br>
		</form>

	</div>
	
	 <script>
    	function idCheck(){
    		// 중복확인 버튼 클릭시 사용자가 입력한 아이디값을 넘겨서
    		// 조회요청 (존재하는지 안하는지) => 응답데이터 돌려받기
    		// 1) 사용불가능(NNNNN) => alert로 메세지출력, 다시 입력하도록 유도
    		// 2) 사용가능 (NNNNY) => 진짜 사용할껀지 의사를 물어볼꺼임 (confirm창)
    		//						> 사용하겠다 => 더이상 아이디 수정 못하게끔, 회원가입버튼 활성화
    		//						> 사용안하겠다 => 다시 입력하도록 유도
    		
    		// 아이디 입력하는 input요소 객체
    		const $idInput = $("#enroll-form input[name=memberId]");
    		
    		$.ajax({
    			url:"<%=contextPath%>/idCheck.me",
    			data:{checkId:$idInput.val()},
    			success:function(result){
    				if(result == "NNNNN"){ // 사용불가능
    					alert("중복된 아이디 입니다");
    					$idInput.focus();
    				}else{ // 사용가능
    					if(confirm("사용가능한 아이디입니다. 정말로 사용하시겠습니까?")){
    						$idInput.attr("readonly", true);
    						$("#enroll-form :submit").removeAttr("disabled");
    					}else{
    						$idInput.focus();
    					}
    				}
    			},
    			error:function(){
    				console.log("아이디 중복체크용 ajax 통신실패");
    			}
    		});
    		
    	}
    </script>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>