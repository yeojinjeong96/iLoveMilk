 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.member.model.vo.Member, com.milk.common.model.vo.PageInfo" %>    
<% 
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>

    .mem-wrap{
        width:800px;
        padding-left:50px;
        margin:auto;
        float:left;
        box-sizing: border-box;
    }
    #mem-1{
        width:100%;
        height:30%;
        padding-left:10px;
    }
    #mem-1>*{float:left;}
    #mem-2{
        width:100%;
        height:40%;
    }
    #mem-3{
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
        <div class="mem-wrap">
            <div id="mem-1" >
                <div style="width:100px; height:100%">
                    <p  style="font-size:20px; line-height: 90px;"><b>회원조회</b></p> 
                </div> 
                <br><br>
                <div align="right" style="width:640px;">
                        <input type="text" name = "searchMem" required><button type="submit" style="border:none">검색</button>
                </div>
            </div>
            <div id="mem-2">
                <table class="member-info" style="width:100%; font-size:10px; text-align:center;" border=1>
                <thead>
                    <tr>
                        <td>번호</td>
                        <td>아이디</td>
                        <td>이름</td>
                        <td>등급</td>
                        <td>이메일</td>
                        <td>휴대폰</td>
                        <td>주소</td>
                        <td>구매금액</td>
                        <td>적립금</td>
                        <td>가입일</td>
                    </tr>
                    </thead>
                    <tbody>
                    <%if(list.isEmpty()){ %>
                        <tr>
                            <td colspan="10">조회되는 회원정보가 없습니다.</td>
                        </tr>
                    <%}else{ %>
                        <%for(Member m : list){ %>
                            <tr>
                                <td><%=m.getMemberNo() %></td>
                                <td><%=m.getMemberId() %></td>
                                <td><%=m.getMemberName() %></td>
                                <td><%=m.getMemberGrade() %></td>
                                <td><%=m.getEmail() %></td>
                                <td><%=m.getPhone() %></td>
                                <td><%=m.getAddress() %></td>
                                <td><%=m.getTotalpay() %></td>
                                <td><%=m.getTotal() %>
                                    <button type="button" id="btn1" onclick="memDetail('<%=m.getMemberId() %>', '<%=m.getMemberGrade() %>', <%=m.getTotal() %>, <%=m.getMemberNo() %>);" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#point-info" style="font-size:9px;">상세</button>
                                    <button type="button" id="btn2" onclick="memModify('<%=m.getMemberId() %>');" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#point-change" style="font-size:9px;">변경</button>
                                </td>
                                <td>
                                    <%=m.getEnrollDate() %>
                                </td> 
                                
                            </tr>
                        <%} %>
                    <%} %>
                </tbody>
                </table>
            </div>
            <br>
            
         <script>
         /*
		     	$(function(){
		    		$(".member-info>tbody #btn1").click(function(){
		    			
		    			var memId = $(this).siblings().eq(1).text();
		    			var memGrade = $(this).siblings().eq(3).text();
		    			var point = $(this).siblings().eq(8).text();
		    			
	       				$("#detailModalId").text(memId);
	       				$("#detailModalGrade").text(memGrade);
	       				$("#detailModalPoint").text(point);
		    			
		    		})
		    	})*/
         		
		    	
		           
            	function memDetail(a, b, c, d){
            
       				$("#detailModalId").text(a);
       				$("#detailModalGrade").text(b);
       				$("#detailModalPoint").text(c);
       				
       				memberPoint(d);
       				
       			}
            	
            	function memModify(a){
            		$("#modifyModalId").text(a);
            	}
            	
 		    	function memberPoint(d){
       				$.ajax({
       					url:"<%=contextPath%>/memPoint.ma?",
       				   data: {memNo:d, ppage:1}
       				   ,success:function(result1, result2){
       					   
                           let value = "";
                           
						   if(result1.length == 0){
							   value += "<td colspan='3'>" + "내역이 없습니다." + " </td>";
						   }else{
	                           for(let i = 0; i<result1.length; i++){
	
	                               value += "<td>" + result1[i].modifyDate + "</td>"
	                                       +"<td>" + result1[i].montent + "</td>"
	                                       +"<td>" + result1[i].total + "</td>";
	
	                           }
						   }
                          $("#pointHistory").html(value);
                          
                          
		                    let value2 = "";
		                     if(result2.currentPage != 1){ 
		                        	   value2 += "<button onclick=" + "'location.href='"+"'<%=contextPath%>/memPoint.ma?ppage=result2.currentPage-1'" + ";>&lt;</button>";
		                     		} 
		          
		                     for(int p=result2.startPage; p<=result2.endPage; p++){ 
		                    	 value2+=" <button onclick="+"'location.href='" + "'<%=contextPath%>/memPoint.ma?ppage=p'" + ";>" + p +" </button>";
		                       } 
		          <!--  내가 보고있는 페이지가 마지막 페이지가 아닐 때에만 나타내기 -->
		          
		                       if(result2.currentPage != result2.maxPage){
		                    	   value2+=" <button onclick=" + "'location.href='" + "'<%=contextPath%>/memPoint.ma?ppage=result2.currentPage+1'" + ";>&gt;</button>";
		                      } 
                          
       					   
       				   },error:function(){
       					   alert("데이터 통신 실패");
       				   }
       				});
            		
            	}
        	 
           	
            	
   		 </script>
            
            <div id="mem-3">
                <div class="paging-area">
                    <!-- 내가 보고있는 페이지가 1번 페이지가 아닐때에만 나타내기 -->
                    
                                <% if(pi.getCurrentPage() != 1){ %>
                                    <button onclick="location.href='<%=contextPath%>/memList.ma?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                                <% } %>
                    
                                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                                    <button onclick="location.href='<%=contextPath%>/memList.ma?cpage=<%=p%>';"><%= p %></button>
                                <% } %>
                    <!--  내가 보고있는 페이지가 마지막 페이지가 아닐 때에만 나타내기 -->
                    
                                <% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
                                    <button onclick="location.href='<%=contextPath%>/memList.ma?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                                <% } %>
                </div>
                
            </div>
            
   


            <!-- 적립금상세조회 모달 div -->
            <div class="modal" id="point-info">
                <div class="modal-dialog">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">적립금 상세조회</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
            
                <!-- Modal body -->
                <div class="modal-body">
                
                <form action="" method="post">
                        <input type="hidden" name="" value="">
                        <table  class="table table-borderless" style="width:100%;">
                                <tr>
                                    <td>아이디</td>
                                    <td id="detailModalId"></td>
                                </tr>
                                <tr>
                                    <td>등급</td>
                                    <td id="detailModalGrade"></td>
                                </tr>
                                <tr>
                                    <td>가용적립금</td>
                                    <td id="detailModalPoint" style="font-weight:800px;"></td>
                                </tr>
                                
                        </table>

                        <br><br>

                        <table class="table mem-point" style="width:100%;">
                          <thead>
                            <tr>
                                <th>날짜</th>
                                <th>내용</th>
                                <th>금액</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr id="pointHistory">

                            </tr>
                            <tr>
                            	<td colspan="3">
				                    <div class="paging-area">
				                    <!-- 내가 보고있는 페이지가 1번 페이지가 아닐때에만 나타내기 -->
				                    
				                                <% if(pi.getCurrentPage() != 1){ %>
				                                    <button onclick="location.href='<%=contextPath%>/memList.ma?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
				                                <% } %>
				                    
				                                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
				                                    <button onclick="location.href='<%=contextPath%>/memList.ma?cpage=<%=p%>';"><%= p %></button>
				                                <% } %>
				                    <!--  내가 보고있는 페이지가 마지막 페이지가 아닐 때에만 나타내기 -->
				                    
				                                <% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
				                                    <button onclick="location.href='<%=contextPath%>/memList.ma?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
				                                <% } %>
				                	</div>
                            	</td>
                            </tr>
                          </tbody>
                        </table>
                        <br><br>
                </form>
                
                
                </div>
            
                </div>
            </div>
            </div>



            <!-- 적립금변경 모달 div -->
            <div class="modal" id="point-change">
                <div class="modal-dialog">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">적립금 변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
            
                <!-- Modal body -->
                <div class="modal-body">
                
                <form action="" method="post">
                        <input type="hidden" name="" value="">
                        <table style="width:100%;" class="table table-borderless">
                                <tr>
                                    <td >아이디</td>
                                    <td id="modifyModalId"></td>
                                </tr>
                                <tr>
                                    <td>구분</td>
                                    <td> <input type="radio" name="status" value="Y"> 적립금 지급 <input type="radio" name="status" value="N"> 적립금 차감 </td>
                                </tr>
                                <tr>
                                    <td>적립금</td>
                                    <td><input type="number"></td>
                                </tr>
                                <tr>
                                    <td>사유</td>
                                    <td><input type="text"></td>
                                </tr>
                                
                        </table>

                        <br>
                        <div align="center">
                        <button type="submit" class="btn btn-outline-secondary btn-sm">확인</button> <button type="reset" class="btn btn-outline-secondary btn-sm">취소</button>
                        </div>
                </form>
                
                
                </div>
            
                </div>
            </div>
            </div>        

            

        </div>
    </div>

</body>
</html>