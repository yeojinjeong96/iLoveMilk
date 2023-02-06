<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.member.model.vo.Order, com.milk.common.model.vo.PageInfo" %>    
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>    
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>


        .delivery-wrap{
            width:800px;
            padding-left:50px;
            margin:auto;
            float:left;
            box-sizing: border-box;
        }
        #delivery-1{
            width:100%;
            height:40%;
            padding-left:10px;
        }
        #delivery-1>*{float:left;}
        #delivery-2{
            width:100%;
            height:30%;
        }
        #delivery-3{
            width:100%;
            height:30%;
        }
    
    
        </style>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
            <!-- Popper JS -->
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        
    </head>
    <body>
        <%@ include file="../common/managerHeader.jsp" %>
        <%@ include file="../common/managerMenubar.jsp"%>
        <div class="wrap1" align="center">
            <div class="delivery-wrap">
                <div id="delivery-1" >
                <p  style="font-size:20px; line-height: 90px;"><b>배송관리</b></p>  
                <br> 
                <div align="left" style="width:680px;font-size: 13px;">
                <b> 조회기간 </b>
                    <button class="btn btn-outline-secondary btn-sm">오늘</button>
                    <button class="btn btn-outline-secondary btn-sm">1주일</button>
                    <button class="btn btn-outline-secondary btn-sm">1개월</button>
                    <button class="btn btn-outline-secondary btn-sm">3개월</button>
                    <input type="date" name = "searchDate1" > - <input type="date" name = "searchDate1" >
                </div>
                
                <div align="left" style="width:680px;font-size: 13px;">
                    <br>
                    <b>상태</b>
                    <select name="delivery-option" id="delivery-option" onchange="selectStatement(1, this.value);" style="font-size: 13px;">
                        <option value="1">배송전</option>
                        <option value="2">배송중</option>
                        <option value="3">배송완료</option>
                    </select>
                        
                    </div>
                </div>
               
                <div id="delivery-2"> <br>
                    <table class=" table purchase-list" style="width:100%; font-size:13px; text-align:center;">
                    	<thead>
	                        <tr>
	                            <td>번호</td>
	                            <td>주문번호</td>
	                            <td>주문일자</td>
	                            <td>회원아이디</td>
	                            <td>배송상태</td>
	                            <td>주소</td>
	                            <td>운송장</td>
	                        </tr>
                        </thead>
                         <tbody class="delbody">
                        <%if(list.isEmpty()) {%>
                        	<tr><td colspan="7"> 조회된 데이터가 없습니다. </td></tr>
                        <%}else{ %>
                       		<%for(Order o : list){ %>
		                        <tr>
		                            <td></td>
		                            <td><%=o.getOrderNo() %></td>
		                            <td><%=o.getPaymentDate() %></td>
		                            <td><%=o.getMemberId() %></td>
		                            <td>
		                            	<%if(o.getStatus() == 1){ %>
		                            		상품준비중
		                            	<%}else if(o.getStatus() == 2){ %>
		                            		배송중
		                            	<%}else if(o.getStatus() == 3){ %>
		                            		배송완료
		                            	<%} %>
		                            </td>
		                            <td><%=o.getAddress() %></td>
		                            <td>
		                                <!-- 조건문 사용해서 운송장 완료하면 버튼비활성화시키기 -->
		                                <%if(o.getWaybill().equals("미발급")) {%>
		                                	<button type="button" onclick="issWaybill('<%=o.getOrderNo() %>')" id="getWbtn" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#delivery-info" style="font-size:10px;">대기</button>
		                                <%}else{ %>
		                                	<button type="button" id="getWbtn" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#delivery-info" disabled="disabled" style="font-size:10px;">완료</button>
		                                <%} %>
		                            </td>
		                        </tr>
	                        	<%} %>
	                  		<%} %>
                        </tbody>
                    </table>
                </div>
                
               
                
                <div id="delivery-3">  
                    <div class="paging-area">
                        
                                    <% if(pi.getCurrentPage() != 1){ %>
                                        <button onclick="location.href='<%=contextPath%>/orderList.ma?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                                    <% } %>
                        
                                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                                        <button onclick="location.href='<%=contextPath%>/orderList.ma?cpage=<%=p%>';"><%= p %></button>
                                    <% } %>
              
                                    <% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
                                        <button onclick="location.href='<%=contextPath%>/orderList.ma?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                                    <%} %>    
                    </div>
                    
                </div>
        
        
                <!-- 운송장관리 모달 div -->
                <div class="modal" id="delivery-info">
                    <div class="modal-dialog">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">운송장 발급하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                
                    <!-- Modal body -->
                    <div class="modal-body">
                    
                    <form action="<%=contextPath %>/orderWaybill.ma" method="post" id="orderWay">
                            <input type="hidden" name="" value="">
                            <table class="table" style="width:100%;">
                                    <tr>
                                        <td>주문번호</td>
                                        <td ><input type="text" id = "wayOrderNo" name="OrderNo" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>주문일자</td>
                                        <td id="wayOrderDate"></td>
                                    </tr>
                                    <tr>
                                        <td>구매자명</td>
                                        <td id="wayMemberName"></td>
                                    </tr>
                                    <tr>
                                        <td>받는사람</td>
                                        <td id="wayOrderName"></td>
                                    </tr>
                                    <tr>
                                        <td>주소</td>
                                        <td id="wayAddress"></td>
                                    </tr>
                                    <tr>
                                        <td>택배사</td>
                                        <td>
                                        	<select name="courier" id="courier" required>
											    <option value="">--선택해주세요--</option>
											    <option value="한진택배">한진택배</option>
											    <option value="cj대한통운">cj대한통운</option>
											    <option value="로젠택배">로젠택배</option>
											</select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>운송장번호</td>
                                        <td>
                                        <input type="text" name="waybill" id="waybill2" placeholder="8자리의 운송장번호를 입력해주세요" onkeyup="wayConfig();" required> 
                                        <button type="button" class="btn btn-outline-secondary btn-sm" onclick="ranNum();">생성하기</button>
                                        <br> <p id="check1"></p>
                                       </td>
                                    </tr>
                                    
                            </table>
        
                            <br>
                            <div align="center">
                            <button type="submit" id="createWay1" class="btn btn-outline-secondary btn-sm" disabled>발급하기</button>
                            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" >취소</button>
                            </div>
                    </form>
                    
                    
                    </div>
                
                    </div>
                </div>
                </div>
        		
        		<script>
        		
        			function issWaybill(ono){
        				
        				$.ajax({
        					url : "<%=contextPath%>/orderDetail.ma",
        					data: {ono:ono},
        					success:function(result){
        						
        						
        						console.log(result);
        						
								$("#wayOrderNo").val(result.orderNo);
								$("#wayOrderDate").text(result.paymentDate);
								$("#wayMemberName").text(result.memberName);
								$("#wayOrderName").text(result.orderName);
								$("#wayAddress").text(result.address);
        						
        					}, error:function(){
        						alert("통신실패");
        					}
        				});
        				
        			}
        			
        			function ranNum(){
        				  let num = '';
        					  for (let i = 0; i < 8; i++) {
        					    num += Math.floor(Math.random() * 10);
        					  }
        				 $("#waybill2").val(num);
        				 
        				 wayConfig();
        			}
        			 
        			function wayConfig(){
        				
        				const wayInput = $("#orderWay input[name=waybill]").val(); 
        				

        				
        				$.ajax({
        					url:"<%=contextPath%>/wayCheck.ma",
        					data:{waybill:wayInput},
        					success:function(result){
        						
        						;
        						
                	            let regExp = /^[0-9]{8}$/;
                	            if(!regExp.test($("#waybill2").val())){
                	                $("#check1").text("유효한 운송장번호를 입력하세요");
                	            }else if(result == "N"){
                	            	$("#check1").text("이미 존재하는 운송장번호입니다.");
                	            }else if(regExp.test($("#waybill2").val()) && !(result == "N")) {
                	            	
	                	            	if(confirm("해당 운송장번호를 사용하시겠습니까?")){
	                	            		$("#waybill2").attr("readonly", true);
	                	            		$("#createWay1").removeAttr("disabled");
	                	            		$("#check1").text("");
	                	            	}
                	            	
                	            }        						
        						
        					}, error:function(){
        						alert("운송장 중복검사 통신실패");
        					}
        				})
        			
        			}
        			
        			function selectStatement(cpage, option){
        				
        				$.ajax({
        					url : "<%=contextPath%>/orderStatement.ma",
        					data : {cpage:cpage, option:option},
        					success :function(o){

									if(o){
										
										let val = "";
										
										if(o.olist.length == 0){
											val += "<tr><td colspan='7'> 조회된 데이터가 없습니다. </td></tr>";
				                        	
				                            }else{ 
				                            	
				                           		for(let i =0; i< o.olist.length; i++){ 
				    		                       
				                           		val +=	"<tr>"
				    		                         + "<td></td>"
				    		                         + "<td>" + o.olist[i].orderNo + "</td>"
				    		                         + "<td>" + o.olist[i].paymentDate + "</td>"
				    		                         + "<td>" + o.olist[i].memberId+ "</td>"
				    		                         + "<td>" ; 
				    		                            	if(o.olist[i].status == 1){ 
				    		                            		val += "상품준비중";
				    		                            	}else if(o.olist[i].status == 2){ 
				    		                            		val += "배송중";
				    		                            	}else if(o.olist[i].status == 3){ 
				    		                            		val += "배송완료";
				    		                            	} 
				    		                            	val += "</td>"
				    		                            	+ " <td>" + o.olist[i].address + "</td>"
				    		                            	+ " <td>" ;
				    		                                <!-- 조건문 사용해서 운송장 완료하면 버튼비활성화시키기 -->
				    		                                	if (o.olist[i].waybill == "미발급") {
				    		                                		
				    		                                		val +=" <button type='button' onclick='issWaybill('"+ o.olist[i].orderNo + "');' id='getWbtn' class='btn btn-outline-secondary btn-sm' data-toggle='modal' data-target='#delivery-info' style='font-size:10px;'>"+ "대기" + "</button>";
				    		                                	}else{ 
				    		                                		val +="<button type='button' id='getWbtn' class='btn btn-outline-secondary btn-sm' data-toggle='modal' data-target='#delivery-info' disabled='disabled' style='font-size:10px;'>" + "완료" + "</button>";
				    		                                	}
				    		                                val += "</td>"
				    		                                + "</tr>";
				    		                        
				    	                        	} 
				    	                  		}
										
										$(".delbody").html(val);
										
										
					                    let value2 = "";
					                    
					                    
					                    
					                     if(o.opi.currentPage != 1){ 
					                        	   value2 += "<button onclick='selectStatement(" + (o.opi.currentPage-1) + ", "+ $("#delivery-option").val() + ");'>&lt;</button>";
					                     		} 
					          
					                     for(let p=o.opi.startPage; p<=o.opi.endPage; p++){ 
					                    	 value2+=" <button onclick='selectStatement(" + p + ", "+ $("#delivery-option").val() + ");'>" +  p + "</button>";
					                       } 
					         
					                       if(o.opi.currentPage != o.opi.maxPage){
					                    	   value2+=" <button onclick='selectStatement(" + (o.opi.currentPage+1) + ", "+ $("#delivery-option").val() + ");'>&gt;</button>";
					                      } 
					                   	$(".paging-area").html(value2);    
										
										
										
									}else{
										alert("실패");
									}
        						
        					}, error : function(){
        						alert("배송상태 조회 ajax 통신실패");
        					}
        				});
        				
        			}
        			
        			
        		</script>
        		
            </div>
        </div>    
    </body>
    </html>
    