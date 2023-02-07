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
         #title{font-size: 20px; font-weight: bold;}
        
        th {height: 40px; width: 100px;}
        .in {height: 40px; width: 250px;}
       
        #image{ width:90px; height:90px; margin-top: 10px; }
        #imagesubmit{text-align: center; width:90px; height:px; margin-bottom: 2px; margin-top: -20px; margin-left: 5px;}
        #image_outer{position: relative; left:0px; width:110px; height:110px; margin-bottom: 2px;}
        #warning{font-size: 8px; color: red;}
        input::placeholder{font-size: 7px; margin: auto;}
        #image_input{
            background: rgb(0, 174, 232); 
            border: none; 
            font-size: 10px;
            border-radius: 2px;
            color: white;
            height: 17px;
            position: relative; left:-5px;
        }
        #addressNumber{
            background: rgb(0, 174, 232); 
            border: none; 
            font-size: 10px;
            border-radius: 2px;
            color: white;
            height: 20px;
            position: relative; bottom:3px;
        }
        #modaltext{border: 1px solid black; padding: 5px;}
        input{width: 150px; height: 25px;}

        
    </style>
</head>
<body>	

	
	
	<%@ include file="../common/header.jsp" %>
	
	<div class="outer">

		<div class="mainmenubar" >
			<%@ include file="../common/myPageMenubar.jsp" %> 	
		</div>
				
		<div class="mainmember">
			<!-- <%@ include file="../member/memberInformation.jsp" %> -->
		</div>
		<script>
		$(".mainmember").hide();	
		</script>
		
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
    	String memberGrade = loginMember.getMemberGrade();
    	%>
		
		<div class="maincontent">
		
			<div class="outer_up">
			
				 <p id="title">회원정보 변경</p>
				<br>
				
				 <form action="<%= contextPath %>/update2.me" method="post" id="informationchangeform">
				 
			            <div class="m_information_outer">
			                <table align="center" class="information">
			                
			                    <tr>
			                        <th id="head">아이디</th>
			                        <td class = "in">
			                        	<%= memberId %>
			                        	<input type="hidden" name="memberId" value="<%= memberId %>" required >
			                        </td>
			                    </tr>
			
			                    <tr>
			                        <th>프로필</th>
			                        <td id="image_outer">
			                         <button type="button" class = "btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateProfileModal">프로필 변경</button>   
			                        </td>
			                    </tr>
			
			                    
			
			                    <tr>
			                        <th id="head">이름</th>
			                        <td class = "in"><input type="text" name="memberName"  value= "<%= memberName %>" placeholder="회원이름"></td>
			                    </tr>
			
			                    <tr>
			                        <th id="head">전화번호</th>
			                        <td class = "in"><input type="text" name="phone" value= "<%=phone%>" placeholder="회원전화번호"></td>
			                    </tr>
			                    
			                     <tr>
			                        <th id="head">이메일</th>
			                        <td class = "in"><input type="email" name ="email" value= "<%=email%>" placeholder="회원이메일"></td>
			                    </tr>
			
			                    <tr>
			                        <th rowspan="3">주소</th>
			                        <td class = "in">
			                            <input type="text" id="sample6_postcode" name="addressNumber" value= "<%=addressNumber%>" placeholder="우편번호">
			                            <button type="button" onclick="sample6_execDaumPostcode()" id="addressNumber">우편번호</button>
			                        </td>
			                       
			                    </tr>
			                    <tr>
			                        <td class = "in"><input type="text"  id="sample6_address" name="address" value= "<%=address%>" placeholder="주소"></td>
			                    </tr>
			                    </tr>
			
			                    <tr>  
			                        <td class = "in">
			                        <input type="text" id="sample6_detailAddress" name= "addressDetail" value= "<%=addressDetail%>" placeholder="상세주소">
			                        <input type="hidden" id="sample6_extraAddress" placeholder="참고항목" style="width:100px" >
			                        </td>
			                    </tr>
			
			                </table>
			                
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
			                
			                <br><br>
			            </div>
			            <div align="center">
							<button type="submit" class = "btn btn-secondary btn-sm">정보변경</button>
							<button type="button" class = "btn btn-warning btn-sm" data-toggle="modal" data-target="#updatePwdModal">비밀번호변경</button>
						</div>
						<br><br>
			        </form>
					
					<!-- 비밀번호 변경용 모달 div -->
						<div class="modal" id="updatePwdModal">
					        <div class="modal-dialog">
					          <div class="modal-content">
					      
					            <!-- Modal Header -->
					            <div class="modal-header">
					              <h4 class="modal-title">비밀번호 변경</h4>
					              <button type="button" class="close" data-dismiss="modal">&times;</button>
					            </div>
					      
					            <!-- Modal body -->
					            <div class="modal-body">
					                <form action="<%=contextPath %>/updatePwd.me" method="post">
					                    <input type="hidden" name ="memberId" value="<%= memberId %>">
					                   
					                    <table>
					                        <tr>
					                            <td>현재 비밀번호</td>
					                            <td><input type="password" id="passwordchange" name="memberPwd" required></td>
					                        </tr>
					                        <tr>
					                            <td>변경할 비밀번호</td>
					                            <td><input type="password" id="passwordchange" name="updatePwd"  placeholder="영소문/숫자를 조합하세요(8~20자)" required></td>
					                        </tr>
					                        <tr>
					                            <td>변경할 비밀번호 확인</td>
					                            <td><input type="password" id="passwordchange" placeholder="새 비밀번호 확인" required></td>
					                        </tr>
					                    </table>
					                    <br>
					                    
					                    <button type="submit" class = "btn btn-secondary btn-sm">비밀번호 변경</button>
					                
					                </form>
					            </div>
					      
					          </div>
					        </div>
					      </div>
					      
					      
					      <!-- 프로필 변경용 모달 div -->
						<div class="modal" id="updateProfileModal">
					        <div class="modal-dialog">
					          <div class="modal-content">
					      
					            <!-- Modal Header -->
					            <div class="modal-header">
					              <h4 class="modal-title">프로필 변경</h4>
					              <button type="button" class="close" data-dismiss="modal">&times;</button>
					            </div>
					      
					            <!-- Modal body -->
					            <div class="modal-body">
					            	 
					                <form action="<%=contextPath %>/profile.me" id="" method="post" enctype="multipart/form-data">
					                    
					                    <input type="hidden" name ="memberId" value="<%= memberId %>">
					                    <input type="hidden" name ="memberPwd" value="<%= memberPwd %>">
					                    <input type="hidden" name ="memberName" value="<%= memberName %>">
					                    <input type="hidden" name ="phone" value="<%= phone %>">
					                    <input type="hidden" name ="email" value="<%= email %>">
					                    <input type="hidden" name ="addressNumber" value="<%= addressNumber%>">
					                    <input type="hidden" name ="address" value="<%= address %>">
					                    <input type="hidden" name ="addressDetail" value="<%= addressDetail %>">
					                    
					                    
					                    <div id="image">
			                                <img src="<%= profile %>" width="100px" height="100px" >
			                                </div>
			                                <br>
			                                
			                                <div class="form-group bg-light"> 
			                                	<input type="file" name="profile" id="img__preview"/>
			                                </div>
			
					                    <br>
					                    
					                    <button type="submit" class = "btn btn-secondary btn-sm">프로필 변경</button>
					                
					                
					                	<script>
					                                $("#img__preview").on("change", function(e){
					                            		var f=e.target.files[0];
	
					                            		if(!f.type.match("image*")){
					                            			alert("이미지만 첨부할 수 있습니다..");
					                            			$("#img__preview").val('');
					                            			return;
					                            		}
	
					                            		
	
					                            		if(f.size>1024*1024*10){
					                            			alert("10mb까지의 사진만 업데이트 할 수 있습니다.");
					                            			$("#img__preview").val('');
					                            			return;
					                            		}
	
					                            		var reader=new FileReader();
	
					                            		reader.onload=function(e){
					                            			$("#img__wrap").attr("src",e.target.result);
					                            		}
					                            		reader.readAsDataURL(f); //비동기적 진행(파일 읽기)
	
					                            	});
				                                </script>
				                    		<input type="hidden" name ="memberNo" value="<%= memberNo %>">
					                </form>
					            </div>
					      
					          </div>
					        </div>
					      </div>
					
					
			    	</div>
				
			</div>
			
		</div>
	
	
	<%@ include file="../common/footer.jsp" %> 	 




   
</body>
</html>