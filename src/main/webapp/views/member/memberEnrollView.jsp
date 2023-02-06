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
							<div class = "pop4" id= "pop4">올바르지 않은 이메일 양식입니다.</div>
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

					<input type="checkbox"  name="Check" id="check_all" class="checkall">
					<label for="check_all">아이럽우유의 모든 약관을 확인하고 전체 동의합니다</label>
					<br>	
					<div class="checkbox" align="left" id="check_one">	  
						<input type="checkbox" name="Check" id="check_1" class="normal" >
						<label for="check_1" class="checkboxLabel">(필수) 이용약관</label> 
						<button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#TermsofUse">자세히보기</button>
						<br>
						<input type="checkbox"  name="Check" id="check_2" class="normal" >
						<label for="check_2">(필수) 개인정보수집 및 이용</label> 
						<button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#Privacy">자세히보기</button>
						<br>					  
						<input type="checkbox"  name="Check" id="check_3" class="normal" >
						<label for="check_3">(필수) 본인은 만 14세 이상입니다</label>
	                	<br>
                	</div>	
            </div>
           
            
             <!-- 이용약관 모달 div -->
                <div class="modal" id="TermsofUse" >
                    <div class="modal-dialog">
                      <div class="modal-content">
                  
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h4 class="modal-title">이용약관</h4>
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                  
                        <!-- Modal body -->
                        <div class="modal-body" id="rInfoBody" style="height:300px; overflow-y: auto;" align="left">

                        구매이용약관
                        <br>
						<br>
						제1조(목적)
						<br>
						이 약관은 아이럽우유가 운영하는 “아이럽우유” 인터넷 오픈마켓 사이트 를 통해서 제공하는 전자상거래 관련 서비스 및 기타 서비스 (이하 “서비스”라 함)를 이용하는 자간의 권리, 의무를 확정하고 이를 이행함으로써 상호 발전을 도모하는 것을 그 목적으로 합니다.
						<br>
						
						제2조(약관의 명시, 효력과 개정)
						<br>
						1. 조합은 이 약관의 내용을 회사의 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편주소 등)등과 함께 회원이 확인할 수 있도록 “아이럽우유” 초기 서비스화면 또는 연결화면에 게시합니다.
						<br>
						2. 조합은 약관의규제에관한법률, 전자문서 및 전자거래기본법, 전자서명법, 정보통신망이용촉진및정보보호등에관한법률, 전자상거래등에서의소비자보호에관한법률, 전자금융거래법 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
						<br>
						3. 조합이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
						<br>
						4. 조합은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회, 배송책임, 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
						<br>
						5. 조합이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “나100샵”에 송신하여 “나100샵”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
						<br>
						6. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
						<br>
						<br>
						<br>
						제2조(구매 서비스 이용계약의 성립)
						<br>
						1. 구매 서비스 이용계약(이하 "이용계약"이라고 합니다)은 조합이 제공하는 구매 서비스를 이용하고자 하는 자의 이용신청에 대하여 조합이 이를 승낙함으로써 성립합니다. 조합은 이용승낙의 의사표시를 해당 서비스화면에 게시하거나 이메일 또는 기타 방법으로 통지합니다.
						<br>
						2. 구매 서비스를 이용하고자 하는 자는 이 약관에 동의하고, 조합이 정하는 회원가입 신청 양식에 따라 필요한 사항을 기입합니다.
						<br>
						3. 회원가입은 만 14세 이상의 개인 또는 사업자(개인사업자 및 법인사업자)가 할 수 있으며, 이용신청자는 실명으로 가입신청을 해야 하며, 실명이 아니거나 타인의 정보를 도용하는 경우 서비스이용이 제한되거나 관련 법령에 의거 처벌받을 수 있습니다.
						<br>
						4. 이용신청의 처리는 신청순서에 의하며, 회원가입의 성립시기는 회사의 승낙이 회원에게 도달한 시점으로 합니다.
						<br>
						5. 조합은 다음과 같은 사유가 발생한 경우 이용신청에 대한 승낙을 거부하거나 유보할 수 있습니다.
						<br>
						1) 회사의 실명확인절차에서 실명가입신청이 아님이 확인된 경우
						<br>
						2) 이미 가입된 회원과 이름 및 주민등록번호(또는 사업자등록번호)가 동일한 경우
						<br>
						3) 조합에 의하여 이용계약이 해지된 날로부터 2개월 이내에 재이용신청을 하는 경우
						<br>
						4) 회사로부터 회원자격 정지 조치 등을 받은 회원이 그 조치기간 중에 이용계약을 임의 해지하고 재이용신청을 하는 경우
						<br>
						5) 설비에 여유가 없거나 기술상 지장이 있는 경우
						<br>
						6) 기타 이 약관에 위배되거나 위법 또는 부당한 이용신청임이 확인된 경우 및 조합이 합리적인 판단에 의하여 필요하다고 인정하는 경우
						<br>
						<br>
						제3조(개인정보의 변경, 보호)
						<br>
						1. 회원은 이용신청 시 허위의 정보를 제공하여서는 아니 되며, 기재한 사항이 변경되었을 경우에는 즉시 변경사항을 최신의 정보로 수정하여야 합니다. 이름, ID, 주민등록번호 등은 수정할 수 없으나 법령에 의한 경우는 예외적으로 수정 가능합니다.
						<br>
						2. 회사의 회원에 대한 통지는 회원이 제공한 주소 또는 이메일 주소에 도달함으로써 통지된 것으로 보며, 수정하지 않은 정보로 인하여 발생하는 손해는 당해 회원이 전적으로 부담하며, 조합은 이에 대하여 아무런 책임을 지지 않습니다.
						<br>
						3. 조합은 이용계약을 위하여 회원이 제공한 정보를 회원이 동의한 회사 서비스 운영을 위한 목적 이외의 용도로 사용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용•제공단계에서 당해 회원에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
						<br>
						4. 합은 개인정보의 수집•이용•제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집•이용•제공에 관한 이용자의 동의 거절 시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집•이용•제공에 관한 구매서비스를 이용하고자 하는 자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.
						<br>
						5. 조합은 회원의 개인정보를 보호하기 위해 제3자에게 개인회원의 개인정보를 제공할 필요가 있는 경우에는 실제 청약 시에 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용목적 및 보유•이용기간 등을 명시하여 개인회원의 동의를 받고, 개인정보를 위탁하는 경우에는 관련 법령이 정하는 바에 따라 "개인정보처리방침"을 수립하고 개인정보 보호 책임자를 지정하여 이를 게시하고 운영합니다.
						<br>
						<br>
						제4조(아이디 및 비밀번호의 관리)
						<br>
						1. 아이디(ID) 및 비밀번호에 대한 관리책임은 회원에게 있으며, 회원은 어떠한 경우에도 본인의 아이디(ID) 또는 비밀번호를 타인에게 양도하거나 대여할 수 없습니다.
						<br>
						2. 회사의 귀책사유 없이 아이디(ID) 또는 비밀번호의 유출, 양도, 대여로 인하여 발생하는 손실이나 손해에 대하여는 회원 및 이용자 본인이 그에 대한 책임을 부담합니다.
						<br>
						3. 회원은 아이디(ID) 또는 비밀번호를 도난 당하거나 제3자가 무단으로 이를 사용하고 있음을 인지한 경우, 이를 즉시 조합에 통보하여야 하고 조합은 이에 대한 신속한 처리를 위하여 최선의 노력을 다하여야 합니다.
						<br>
						<br>
						제5조(이용계약의 종료)
						<br>
						1. 회원의 해지
						<br>
						1) 회원은 언제든지 해당 서비스화면을 통하여 조합에게 해지의사를 통지함으로써 이용계약을 해지할 수 있습니다. 다만, 회원은 해지의사를 통지하기 최소한 7일 전에 모든 거래를 완결시키는데 필요한 조치를 취하여야만 합니다.
						<br>
						2) 전호의 기간 내에 회원이 발한 의사표시로 인해 발생한 불이익에 대한 책임은 회원 본인이 부담하여야 하며, 이용계약이 종료되면 조합은 회원에게 부가적으로 제공한 각종 혜택을 회수할 수 있습니다.
						<br>
						3) 회원의 의사로 이용계약을 해지한 후, 추후 재이용을 희망할 경우에는 재이용 의사가 조합에 통지되고, 이에 대한 회사의 승낙이 있는 경우에만 서비스 재이용이 가능합니다.
						<br>
						2. 회사의 해지
						<br>
						1) 조합은 다음과 같은 사유가 발생하거나 확인된 경우 이용계약을 해지할 수 있습니다.
						<br>
						①다른 회원 또는 타인의 권리나 명예, 신용 기타 정당한 이익을 침해하거나 대한민국 법령 또는 공서양속에 위배되는 행위를 한 경우
						<br>
						②조합이 제공하는 서비스의 원활한 진행을 방해하는 행위를 하거나 시도한 경우
						<br>
						③제7조 제5항의 승낙거부사유가 있음이 확인된 경우
						<br>
						④기타 조합이 합리적인 판단에 기하여 서비스의 제공을 거부할 필요가 있다고 인정할 경우
						<br>
						2) 조합이 해지를 하는 경우 조합은 회원에게 이메일, 전화, 기타의 방법을 통하여 해지사유를 밝혀 해지의사를 통지합니다. 이용계약은 회사의 해지의사를 회원에게 도달한 시점에 종료됩니다. 단, 이메일을 통한 해지의사 통지의 경우 발송시점을 도달시점으로 간주합니다.
						<br>
						3) 본 항에 의하여 조합이 이용계약을 해지하더라도, 해지 이전에 이미 체결된 매매계약의 완결과 관련해서는 이 약관이 계속 적용됩니다.
						<br>
						4) 본 항에서 정한 바에 따라 이용계약이 종료될 시에는 조합은 회원에게 부가적으로 제공한 각종 혜택을 회수할 수 있습니다.
						<br>
						5) 본 항에서 정한 바에 따라 이용계약이 종료된 경우에는, 회원의 재이용신청에 대하여 조합은 이에 대한 승낙을 거절할 수 있습니다.
						<br>
						<br>
						제6조(서비스기간과 중단)
						<br>
						1. 본 약관에 따른 서비스 기간은 서비스를 신청하여 이용승낙 받은 날로부터 이용계약의 해지 시까지 입니다.
						<br>
						2. 조합은 컴퓨터 등 정보통신설비의 보수, 점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 서비스 일시 중단 사실과 그 사유를 나100샵 초기화면에 통지합니다.
						<br>
						3. 조합은 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스의 제공을 제한하거나 일시 중단할 수 있습니다.
						<br>
						<br>
						제7조(저작권 정책)
						<br>
						1. 조합은 제공하는 서비스와 관련하여 저작권자의 저작권 보호를 위한 정책을 수립해 운영하며 회원은 조합의 저작권 정책을 지켜야 합니다.
						<br>
						2. 회원이 조합이 제공하는 서비스를 이용하면서 작성한 각종 게시물의 저작권은 회원 본인에게 있으며, 해당 게시물의 저작권 침해를 비롯한 민•형사상 모든 책임은 회원 본인이 집니다.
						<br>
						3. 조합은 회원이 등록한 게시물을 검색사이트나 다른 사이트에 노출할 수 있으며, 판촉, 홍보 및 기타의 자료로 무상으로 사용할 수 있습니다. 또한, 조합이 제공하는 서비스 내에서 회원 게시물을 복제, 전시, 전송, 배포할 수 있으며 2차적 저작물과 편집저작물로 작성 할 수 있습니다. 다만, 해당 게시물을 등록한 회원이 게시물의 삭제 또는 사용중지를 요청하면 조합은 관련 법률에 따라 보존해야 하는 사항을 제외하고 즉시 삭제 또는 사용을 중지합니다.
						<br>
						4. 본 조 제3항에 언급된 조합의 사용권은 조합 서비스를 운영하는 동안에만 확정적으로 유효합니다.
						<br>
						5. 조합이 본 조 제3항 이외의 방법으로 회원의 게시물을 상업적으로 이용하고자 할 때에는, 전화, 팩스, 이메일(E-mail)등의 방법으로 미리 회원의 동의를 얻어야 합니다. 조합이 본 항에 따라 회원의 게시물을 상업적으로 이용할 때 조합은 별도의 보상제도를 운영할 수 있습니다.
						<br>
						6. 조합이 작성한 저작물에 대한 저작권과 지적 재산권은 조합에 귀속합니다.
						<br>
						7. 이용자가 조합 쇼핑몰을 이용하여 얻은 정보를 조합의 승낙 없이 복제, 송신, 출판, 배포, 방송, 기타 방법으로 이용하거나 제3자에게 이용하게 할 때 그에 대한 책임은 이용자 본인에게 있습니다.
						<br>
						8. 회원은 조합 쇼핑몰 내에서 자신의 저작권이 침해되면 조합이 운영하는 신고센터 제도를 이용하여 자신의 정당한 권리를 보호받을 수 있습니다.
						<br>
						9. 게시물의 내용이 다음 각 호의 내용을 담고 있을 때 조합은 게시물을 삭제하거나 게시자에게 특정 서비스의 이용제한 또는 정지, 이용계약의 해지 등의 조치를 할 수 있습니다. 이때 게시물이 삭제되면 해당 게시물과 관련된 게시물(답변글, 댓글 등)도 모두 삭제됩니다.
						<br>
						1) 대한민국의 법령을 위반하는 내용을 포함하는 경우
						<br>
						2) 관계법령에 의거 판매가 금지된 불법제품 또는 음란물을 게시, 광고하는 경우
						<br>
						3) 허위 또는 과대광고의 내용을 포함하는 경우
						<br>
						4) 타인의 권리나 명예, 신용 기타 정당한 이익을 침해하는 경우
						<br>
						5) 직거래 유도 또는 타 사이트의 링크를 게시하는 경우
						<br>
						6) 정보통신기기의 오작동을 일으킬 수 있는 악성코드나 데이터를 포함하는 경우
						<br>
						7) 사회 공공질서나 미풍양속에 위배되는 경우
						<br>
						8) 조합이 제공하는 나100샵과 모바일나100샵 서비스의 원활한 진행을 방해하는 것으로 판단되는 경우
						<br>
						9) 범죄행위와 관련된 내용을 포함하는 경우
						<br>
						10) 정치, 경제적 분쟁을 야기하는 내용을 포함하는 경우
						<br>
						10. 조합이 제9항에 따라 게시물을 삭제했을 때, 해당 게시자는 회사에 이의를 제기하여 구제받을 수 있습니다.
						<br>
						<br>
						제8조(배송)
						<br>
						1. 배송 소요기간은 입금 또는 대금결제 확인일의 익일을 기산일로 하여 배송이 완료되기까지의 기간을 말합니다.
						<br>
						2. 조합은 판매자에게 회사로부터 구매자의 입금 또는 대금결제에 대한 확인통지를 받은 후 3영업일 이내에 배송에 필요한 조치를 취하도록 안내합니다.
						<br>
						3. 공휴일, 천재지변 등 불가항력적인 사유가 발생한 경우 그 해당기간은 배송 소요기간에서 제외됩니다.
						<br>
						4. 조합은 배송과 관련하여 판매자와 구매자, 배송업체, 금융기관 등과의 사이에 발생한 분쟁은 당사자들 간의 해결을 원칙으로 하며, 조합은 어떠한 책임도 부담하지 않습니다.
						<br>
						5. 판매자의 발송확인 처리 이후에 구매자가 수취확인을 하지 않아 배송중 상태가 지연될 경우, 조합은 발송확인일로부터 2주 이내에 수취확인요청 안내를 할 수 있습니다. 조합의 안내 이후에도 구매자의 수취확인이 이루어지지 않을 경우 3일이 경과한 시점에 자동으로 배송완료로 전환될 수 있으며 이 경우 실제 구매자가 상품을 수령하지 못한 경우에 구매자는 미수취신고를 할 수 있습니다.
						<br>
						<br>
						<br>
						제9조(이용자 관리)
						<br>
						1. 조합은 이 약관의 본지와 관련 법령 및 상거래의 일반원칙을 위반한 회원에 대하여 다음과 같은 조치를 할 수 있습니다.
						<br>
						1) 조합이 부가적으로 제공한 혜택의 일부 또는 전부의 회수
						<br>
						2) 특정서비스 이용제한
						<br>
						3) 이용계약의 해지
						<br>
						4) 손해배상의 청구
						<br>
						2. 조합이 전항 각 호에 정한 조치를 할 경우 조합은 사전에 회원에게 유선 또는 이메일로 통보하며, 회원의 연락이 두절되거나 긴급을 요하는 것과 같이 부득이한 경우 선조치 후 사후 통보할 수 있습니다.
						<br>
						3. 회원은 본조에 의한 조합의 조치에 대하여 항변의 사유가 있는 경우 이에 대하여 항변을 할 수 있습니다.
						<br>
						<br>
						제10조(약관 외 준칙 및 관련 법령과의 관계)
						1. 이 약관에 명시되지 않은 사항은 전자상거래등에서의소비자보호에관한법률 등 관련 법령의 규정과 일반 상관례에 의합니다.
						<br>
						2. 조합이 제공하는 구매 서비스를 통하여 거래한 경우, 전자상거래등에서의소비자보호에관한법률 등 관련 법령이 해당 거래 당사자에게 우선적으로 적용되고, 거래 당사자는 이 약관의 규정을 들어 거래 상대방에 대하여 면책을 주장할 수 없습니다.
						<br>
						3. 조합은 필요한 경우 특정 서비스에 관하여 적용될 사항(이하 “개별약관”이라고 합니다)을 정하여 이를 회사 홈페이지 등을 통해 미리 공지할 수 있습니다.
						<br>
						4. 조합은 전항의 개별약관에 변경이 있을 경우, 시행 14일 이전에 해당 변경사항을 공지합니다.
						<br>
						5. 회원은 이 약관 및 개별약관의 내용에 변경이 있는지 여부를 주시하여야 하며, 변경사항의 공지가 있을 시에는 이를 확인하여야 합니다.
						<br>
						<br>
						제11조(기타조항)
						<br>
						1. 조합은 필요한 경우 특정 서비스(혹은 그 일부)를 회사 홈페이지를 통하여 미리 공지한 후, 일시적 또는 영구적으로 수정하거나 중단할 수 있습니다.
						<br>
						2. 조합과 회원은 상대방의 명백한 동의 없이 이 약관상의 권리와 의무를 제3자에게 양도 할 수 없습니다.
						<br>
						3. 이 약관과 관련하여 당사자 간의 합의에 의하여 추가로 작성된 계약서, 협정서, 통보서 등과 조합의 정책변경, 법령의 제정•개정 또는 공공기관의 고시•지침 등에 의하여 조합이 쇼핑몰을 통해 회원에게 공지하는 내용도 본 약관의 일부를 구성합니다.
						<br>
						<br>
						<부칙>
						<br>
						본 쇼핑몰 명칭은 추후 변경될 수 있으나, 명칭의 변경과는 상관없이 본 약관의 효력은 유효합니다.
                        </div>
                  
                      </div>
                    </div>
                  </div>
            
            <!-- 개인정보 수집 모달 div -->
                <div class="modal" id="Privacy" >
                    <div class="modal-dialog">
                      <div class="modal-content">
                  
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h4 class="modal-title">이용약관</h4>
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                  
                        <!-- Modal body -->
                        <div class="modal-body" id="rInfoBody" style="height:300px; overflow-y: auto;" align="left">
						[필수] 개인정보동의 수집 및 이용동의 
						<br>
						<br>
						항목
						<br>
						[필수] 아이디,비밀번호,성명,이메일
						<br>
						[선택] 전화번호, 주소
						<br>
						<br>
						수집목적
						<br>
						구매 및 결제, 물품배송, 금융거래 본인인증, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입의사 확인, 불만처리 등 민원처리
						<br>
						<br>
						보유기간
						<br>
						[회원탈퇴시]
						<br>
						단, 계약 또는 청약철회, 대금 결제 및 재화 등의 공급에 관한 기록 5년
						<br>
						소비자 불만 또는 분쟁처리에 관한 기록 3년
						<br>
						<br>
                       
                        </div>
                  
                      </div>
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
				
				
			<script>
            $("#submit").hide();
            
            $(".checkall").change(function(){
         		if(this.checked){
         			$('#submit').show();
         		}else {
         			$('#submit').hide();
         		}
         	});
            
            $(".normal").change(function(){
         		if($("#check_1").is(":checked") && $("#check_2").is(":checked") && $("#check_3").is(":checked")){
         			$('#submit').show();
         		
         		}else {
         			
         			$('#submit').hide();
         		}
         	});
           
            </script>
            
            
			</div>
			<br><br>
		</form>

	</div>
	
	
	
	<!-- 아이디 중복 검사  -->
	<script>
    	function idCheck(){
    		
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