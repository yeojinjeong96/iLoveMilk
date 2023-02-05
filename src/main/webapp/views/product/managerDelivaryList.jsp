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
                    <select name="delivery-option" id="delivery-option" onchange="selectStatement(1);" style="font-size: 13px;">
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
                        	<tr colspan="7"> 조회된 데이터가 없습니다. </tr>
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
                                        <input type="text" name="waybill" id="waybill2" placeholder="8자리의 운송장번호를 입력해주세요" required> 
                                        <button type="button" class="btn btn-outline-secondary btn-sm" onclick="ranNum();">생성하기</button>
                                       </td>
                                    </tr>
                                    
                            </table>
        
                            <br>
                            <div align="center">
                            <button type="submit" class="btn btn-outline-secondary btn-sm" onclick="return wayConfig();">발급하기</button>
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
        						
								$("#wayOrderNo").val(result.orderNo);
								$("#wayOrderDate").text(result.paymentDate);
								$("#wayMemberName").text(result.memberName);
								$("#wayOrderName").text(result.orderName);
								$("#wayAddress").text(result.address);
        						
        					}, error:function(){
        						alert("통신실패");
        					}
        				})
        				
        			}
        			
        			function ranNum(){
        				  let num = '';
        					  for (let i = 0; i < 8; i++) {
        					    num += Math.floor(Math.random() * 10);
        					  }
        				 $("#waybill2").val(num);
        			}
        			 
        			function wayConfig(){
        				
        	            let regExp = /^[0-9]{8}$/;
        	            if(!regExp.test($("#waybill2").val())){
        	                alert("유효한 운송장번호를 입력하세요");
        	                $("#waybill2").val() = "";
        	                $("#waybill2").focus(); //커서가 깜빡거릴수있게 해줌
        	                return false;
        	            }
        	            
        	          
        	                   				
        				const wayInput = $("#orderWay input[name=waybill]").val(); 
        				
        				$.ajax({
        					url:"<%=contextPath%>/wayCheck.ma",
        					data:{waybill:wayInput},
        					success:function(result){
        						
        						
        						if(result == "N"){
        							alert("이미 존재하는 운송장번호입니다.");
        							$("#waybill2").val() = "";
        							 $("#waybill2").focus();
        						}
        						
        					}, error:function(){
        						alert("운송장 중복검사 통신실패");
        					}
        				})
        			
        			}
        			
        			function selectStatement(cpage, option){
        				
        				$.ajax({
        					url : "<%=contextPath%>/orderStatement.ma",
        					data : {cpage:cpage, option:$("#delivery-option option:selected").val()},
        					success :function(o){

									if(o){
										
										let val = "";
										
										if(o.olist.length == 0){
											val += "<tr colspan="7"> 조회된 데이터가 없습니다. </tr>";
				                        	
				                            }else{ 
				                            	
				                           		for(let i =0; i< o.olist.length; i++){ 
				    		                       
				                           		val +=	"<tr>"
				    		                         + "<td></td>"
				    		                         + "<td>" + o.olist.orderNo + "</td>"
				    		                         + "<td>" + o.olist.paymentDate() %></td>"
				    		                         + "<td>" + o.olist.memberId%></td>"
				    		                         + "<td>
				    		                            	if(o.olist.status == 1){ 
				    		                            	+	상품준비중
				    		                            	}else if(o.olist.status == 2){ 
				    		                            	+	배송중
				    		                            	}else if(o.olist.status == 3){ 
				    		                            	+	배송완료
				    		                            	} 
				    		                            	+ "</td>"
				    		                            	+ " <td>" + o.olist.address + "</td>"
				    		                            	+ " <td>"
				    		                                <!-- 조건문 사용해서 운송장 완료하면 버튼비활성화시키기 -->
				    		                                	if (o.olist.waybill == "미발급") {
				    		                                + " <button type='button' onclick='issWaybill('o.olist.orderNo');' id='getWbtn' class='btn btn-outline-secondary btn-sm' data-toggle='modal' data-target='#delivery-info' style='font-size:10px;'>"+ 대기 + "</button>"
				    		                                	}else{ 
				    		                                +	"<button type='button' id='getWbtn' class='btn btn-outline-secondary btn-sm' data-toggle='modal' data-target='#delivery-info' disabled='disabled' style='font-size:10px;'>" + 완료 + "</button>"
				    		                                	}
				    		                                + "</td>"
				    		                                + "</tr>";
				    		                        
				    	                        	} 
				    	                  		}
										
										$(".delbody").html(val);
										
										
					                    let value2 = "";
					                    
					                    
					                    
					                     if(o.spi.currentPage != 1){ 
					                        	   value2 += "<button onclick='location.href='" + "<%=contextPath%>/orderStatement.ma?cpage=o.spi.currentPage-1 " + "';'>&lt;</button>";
					                     		} 
					          
					                     for(let p=o.spi.startPage; p<=o.spi.endPage; p++){ 
					                    	 value2+=" <button onclick='location.href='" + "<%=contextPath%>/orderStatement.ma?cpage=p" + "';'> " +  p + "</button>";
					                       } 
					         
					                       if(o.spi.currentPage != o.spi.maxPage){
					                    	   value2+=" <button onclick='location.href='" + "<%=contextPath%>/orderStatement.ma?cpage=o.spi.currentPage+1" + "';'>&gt;</button>";
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
    