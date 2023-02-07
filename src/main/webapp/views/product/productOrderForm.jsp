<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.member.model.vo.Member, com.milk.product.model.vo.Product" %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	Member m = (Member)request.getAttribute("m");
	
	// 총 상품 금액
	int price = 0;
	for(Product p : list){
		price += p.getPrice();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer-1{width: 700px;}
    .info{width: 700px;}
    .sum-area{background-color: lightgray; width:700px; padding-top:20px; padding-bottom:20px;}
    .info span{color: red;}
    .opt th, .pay{text-align: right;}
    .agree{width:490px;}
    .star{color: red;}
</style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>

	<div class="wrap" align="center">
        <div class="outer">
            <div class="outer-1">
                <br>
                <h2><b>주문서 작성</b></h2>
                주문하실 상품명과 수량을 꼭 확인해주세요.
                <br><br><br>
                
                <form action="<%= contextPath %>/completePay.pr" method="post">
                    <h4><b>주문 상세 내역</b></h4>
                    <br>
                    <table class="info table">
                        <thead class="thead-light" style="text-align: center;">
                            <tr>
                                <th width="70%" colspan="2">상품명</th>
                                <th width="15%">수량</th>
                                <th width="15%">상품금액</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Product p : list){ %>
	                            <tr>
	                            	<input type="hidden" name="proNo" value="<%= p.getProductNo() %>">
		                            <input type="hidden" name="count" value="<%= p.getCapacity() %>">
	                                <td style="vertical-align:middle" width="12%" align="center"><img src="<%= p.getProductImg() %>" width="100px;"></td>
		                            <td style="vertical-align:middle" width="45%"><%= p.getProductName() %></td>
	                                <td style="vertical-align:middle" align="center"><%= p.getCapacity() %>개</td>
	                                <td style="vertical-align:middle" class="pay"><label class="proPrice"><%= p.getPrice() %></label>원&nbsp;</td>
	                            </tr>
							<% } %>
                        </tbody>
                    </table>
                    <br><br>
                    <div class="sum-area">
                        <table>
                            <tr>
                                <td width="23%">총 <b><%= list.size() %></b> 개의 상품 금액</td>
                                <th width="17%" style="font-size:large;" class="pay"><%= price %>원</th>
                                <th width="5%">&nbsp;&nbsp;+</th>
                                <td width="8%">배송비</td>
                                <th width="17%" style="font-size:large;" class="pay">2500원</th>
                                <th width="5%">&nbsp;&nbsp;=</th>
                                <td width="8%">합계</td>
                                <th width="17%" style="font-size:large;" class="pay"><%= price + 2500 %>원</th>
                            </tr>
                        </table>
                    </div>
                    <br><br><br>
                    <h4><b>주문자 정보</b></h4>
                    <br>
                    <span class="star">*</span> 은 필수 입력사항입니다.<br><br>
                    <input type="checkbox" id="myInfo" onclick="myInfoComing();"><label for="myInfo">&nbsp;내 정보 가져오기</label>
                    <table class="info opt table table-hover">
                        <tr>
                            <th width="30%"><span>*</span> 이름&nbsp;</th>
                            <td width="70%"><input type="text" required id="memName" name="orderName"></td>
                        </tr>
                        <tr>
                            <th><span>*</span> 전화번호&nbsp;</th>
                            <td><input type="text" placeholder=" - 포함 입력" required id="memPhone" name="orderPhone"></td>
                        </tr>
                        <tr>
                            <th><span>*</span> 이메일&nbsp;</th>
                            <td>
                                <input type="email" required id="memEmail" name="orderEmail">
                            </td>
                        </tr>
                    </table>
                    <br><br><br>
                    <h4><b>배송 정보</b></h4>
                    <br>
                    <input type="checkbox" id="ordererInfo" onclick="ordererInfoSame();"><label for="ordererInfo">&nbsp;주문자 정보와 동일</label>
                    <table class="info opt table table-hover">
                        <tr>
                            <th width="30%"><span>*</span> 받으실 분&nbsp;</th>
                            <td width="70%"><input type="text" required id="receiveName" name="addressName"></td>
                        </tr>
                        <tr>
                            <th><span>*</span> 받으실 곳&nbsp;</th>
                            <td>
                                <input type="text"  id="sample6_postcode" style="width:150px" name="addressNumber" placeholder="우편번호" required>
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
                                <input type="text"  id="sample6_address" placeholder="주소" style="width:250px" name="address" required><br>
	                    		<input type="text" id="sample6_detailAddress" name="addressDetail" placeholder="상세주소" style="width:150px">
                            	<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width:100px" name="addressPlus">
                            </td>
                        </tr>
                        <tr>
                            <th><span>*</span> 전화번호&nbsp;</th>
                            <td><input type="text" placeholder=" - 포함 입력" required id="receivePhone" name="addressTel"></td>
                        </tr>
                    </table>
                    <br><br><br>
                    <h4><b>결제 정보</b></h4>
                    <br>
                    <table class="info opt table table-hover">
                        <tr>
                            <th width="30%">상품 합계 금액&nbsp;</th>
                            <td width="20%" class="pay" width="15%"><%= price %>원</td>
                            <td width="50%"></td>
                        </tr>
                        <tr>
                            <th>배송비&nbsp;</th>
                            <td class="pay">2500원</td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>사용할 적립금&nbsp;</th>
                            <td class="pay"><input type="number" style="width:80px" id="usePoint" onchange="usePointChange();" name="usePoint">&nbsp;p</td>
                            <td>&nbsp;<input type="checkbox" id="useAll" onclick="useAllPoint();"><label for="useAll">&nbsp;전액 사용하기</label> (보유 적립금: <b><%= m.getMemberNo() %></b> p)</td>
                        </tr>
                        <tr>
                            <th>최종 결제 금액&nbsp;</th>
                            <td class="pay"><label id="finalPrice"></label>원</td>
                            <td></td>
                        </tr>
                    </table>
                    <br><br><br>
                    <h4><b>결제 수단</b></h4>
                    <br>
                    <div>
                        <input type="radio" checked></td>
                        신용카드
                    </div>
                    <br><br><br>
                    <div class="sum-area">
                        <table class="info">
                            <tr>
                            	<input type="hidden" name="price" id="priceInput">
                                <th width="40%" class="pay">최종 결제 금액&nbsp;</th>
                                <th width="20%" class="pay" style="font-size:large;" id="finPrice"></th>
                                <td width="40%" style="font-size:large;"><b>원</b></td>
                            </tr>
                        </table>
                    </div>
                    <br><br>
                    <div>
                        <div class="agree">
                            <input type="checkbox" id="payNeed" onclick="paymentNeed();"><label for="payNeed">&nbsp;주문내역확인 동의(필수)</label><br><br>
                            <ul align="left">
                                <li>주문시 입력하신 배송정보는 배송을 위한 목적으로 사용됩니다.</li>
                                <li>주문할 상품의 상품명, 가격, 배송정보 등을 최종 확인하였으며, <br>구매에 동의하십니까? <br>(전자상거래법 제 8조 2항)</li>
                            </ul>
                        </div>
                    </div>
                    <br><br>
                    
                    <div>
                        <button type="button" class="btn btn-secondary" onclick="location.href='<%= contextPath %>/cart.pr'">이전으로</button>
                        <button type="button" class="btn btn-primary" id="payment" onclick="requestPay();" disabled>결제하기</button>
                        <button type="submit" id="submitBtn" style="display:none"></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- 주소 api  -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script>
		// 결제 완료 후 submit
		function completePay(){
			$("#submitBtn").click();
		}
		
		// 필수입력항목 입력 후 주문내역확인 동의시에만 결제하기 버튼 활성화
		function paymentNeed(){
			if($("#payNeed").is(":checked") &&
			   $("#memName").val() != "" &&
			   $("#memPhone").val() != "" &&
			   $("#memEmail").val() != "" &&
			   $("#receiveName").val() != "" &&
			   $("#sample6-postcode").val() != "" &&
			   $("#sample6_address").val() != "" &&
			   $("#receivePhone").val() != ""){
				$("#payment").attr("disabled", false);
			}else{
				$("#payment").attr("disabled", true);
			}
		}
	
		// 최종 결제 금액 (적립금 사용 전)
		$(function(){
			$("#finalPrice").text(<%= price %> + 2500);
			$("#finPrice").text(<%= price %> + 2500);
			$("#priceInput").attr("value", <%= price %> + 2500);
		});
	
		// 사용할 적립금 최대 최소 지정
		function usePointChange(){
			if($("#usePoint").val() > <%= m.getMemberNo() %>){
				$("#usePoint").val(<%= m.getMemberNo() %>);
			}
			if($("#usePoint").val() > <%= price %> + 2500){
				$("#usePoint").val(<%= price %> + 2500);
			}
			if($("#usePoint").val() < 0){
				$("#usePoint").val(0);
			}
			// 최종 결제 금액 (적립금 사용 후)
			$("#finalPrice").text(<%= price %> + 2500 - $("#usePoint").val());
			$("#finPrice").text(<%= price %> + 2500 - $("#usePoint").val());
			$("#priceInput").attr("value", <%= price %> + 2500);
		}
	
		// 전액 사용하기
		function useAllPoint(){
			if($("#useAll").is(":checked")){
				if($("#priceInput").val() < <%= m.getMemberNo() %>){
					$("#usePoint").val(<%= price %> + 2500);
				}else{
					$("#usePoint").val(<%= m.getMemberNo() %>);
				}
			}else{
				$("#usePoint").val("");
			}
			// 최종 결제 금액 (적립금 사용 후)
			$("#finalPrice").text(<%= price %> + 2500 - $("#usePoint").val());
			$("#finPrice").text(<%= price %> + 2500 - $("#usePoint").val());
			$("#priceInput").attr("value", <%= price %> + 2500);
		}
	
		// 주문자 정보와 동일
		function ordererInfoSame(){
			if($("#ordererInfo").is(":checked")){
				$("#receiveName").val($("#memName").val());
				$("#receivePhone").val($("#memPhone").val());
			}else{
				$("#receiveName").val("");
				$("#receivePhone").val("");
			}
		}
	
		// 내 정보 가져오기
		function myInfoComing(){
			if($("#myInfo").is(":checked")){
				$("#memName").val("<%= m.getMemberName() %>");
				if(<%= m.getPhone() %> != null){
					$("#memPhone").val("<%= m.getPhone() %>");
				}
				$("#memEmail").val("<%= m.getEmail() %>");
	           		}else{
	           			$("#memName").val("");
	           			$("#memPhone").val("");
	           			$("#memEmail").val("");
	           		}
	           	}
	           	
       	<!-- 주소 api  -->
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

		<!-- iamport.payment.js -->
		// 페이지에 가맹점 식별코드를 이용하여 IMP 객체를 초기화
	    var IMP = window.IMP; // 생략 가능
	    IMP.init("imp11183531"); // 예: imp00000000
	    function requestPay() {
	    	// IMP.request_pay(param, callback) 결제창 호출
	        IMP.request_pay({ // param
	        	pg: "html5_inicis",
                pay_method: "card",
                merchant_uid: <%= Math.random()*10000+1 %>,
                name: "<%= list.get(0).getProductName() %> 외 " + "<%= list.size() - 1 %>",
                amount: $("#finPrice").text(),
                buyer_email: $("#memEmail").val(),
	            buyer_name: $("#memName").val(),
	            buyer_tel: $("#memPhone").val()
            }, function (rsp) { // callback
                if (rsp.success) {
                	completePay();
	            } else {
	            	alert("결제 실패");
	            }
	        });
	    }
	</script>
                   	
    <%@ include file="../common/footer.jsp" %>
</body>
</html>