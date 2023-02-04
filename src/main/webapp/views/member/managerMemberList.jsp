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
        div{border:1px solid red;}
    .mem-wrap{
        width:800px;
        padding-left:50px;
        margin:auto;
        float:left;
        box-sizing: border-box;
    }
    #mem-1{
        width:100%;
        height:20%;
        padding-left:10px;
    }
    #mem-1>*{float:left;}
    #mem-2{
        width:100%;
        height:30%;
    }
    #mem-3{
        width:100%;
        height:10%;
    }
    #mem-4{
        padding-left:20px;
        width:100%;
        height:10%;
    }
    #mem-5{
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
                	<form action="" method="post" id="search-form">
                        <input type="text" name = "keyword" id="keyInput" required><button type="button" onclick="searchKeyMem(1);" id="search-btn" class="btn btn-primary btn-sm">검색</button>
                    </form>
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
                    <tbody class="memContent">
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
                               
                                    <%if(m.getEmail() == null){ %>
                                		 <td>없음</td>
                                	<%}else{ %>
                                		<td><%=m.getEmail() %></td>
                                	<%} %>
                                
                                
                                	<%if(m.getPhone() == null){ %>
                                		 <td>없음</td>
                                	<%}else{ %>
                                		<td><%=m.getPhone() %></td>
                                	<%} %>
                            
                                    <%if(m.getAddress() == null){ %>
                                		 <td>없음</td>
                                	<%}else{ %>
                                		<td><%=m.getAddress() %></td>
                                	<%} %>
                                	
                                <td><%=m.getTotalpay() %></td>
                                <td><%=m.getTotal() %>
                                    <button type="button" id="btn1" onclick="memDetail('<%=m.getMemberId() %>', '<%=m.getMemberGrade() %>', <%=m.getTotal() %>, <%=m.getMemberNo() %>);" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#point-info" style="font-size:9px;">상세</button>
                                    <button type="button" id="btn2" onclick="memModify('<%=m.getMemberId() %>', <%=m.getMemberNo() %>);" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#point-change" style="font-size:9px;">변경</button>
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
	    	
         
     	function memDetail(a, b, c, d){
     
				$("#detailModalId").text(a);
				$("#detailModalGrade").text(b);
				$("#detailModalPoint").text(c);
				
 		$.ajax({
					url:"<%=contextPath%>/memPoint.ma?",
				   data: {memNo:d, ppage:1}
				   ,success:function(result){
					 
					   
					   // PageInfo => result.pi  =>   {}
					   // ArrayList => result.list  =>  [{}, {}, ..]
					   
					   // 스크립트문으로 작성하는것 잊지말기
					   
					
                    let value = "";
                    
					   if(result.list.length == 0){
						   value += "<td colspan='3'>" + "내역이 없습니다." + " </td>";
					   }else{
                        for(let i = 0; i<result.list.length; i++){

                            value += "<td>" + result.list[i].modifyDate + "</td>"
                                    +"<td>" + result.list[i].content + "</td>"
                                    +"<td>" + result.list[i].total + "</td>";

                        }
					   }
					   
                   $("#pointHistory").html(value);
                   
                   
	                    let value2 = "";
	                    
	                    
	                    
	                     if(result.pi.currentPage != 1){ 
	                        	   value2 += "<button onclick='location.href='" + "<%=contextPath%>/memPoint.ma?ppage=result.pi.currentPage-1&memNo=d " + "';'>&lt;</button>";
	                     		} 
	          
	                     for(let p=result.pi.startPage; p<=result.pi.endPage; p++){ 
	                    	 value2+=" <button onclick='location.href='" + "<%=contextPath%>/memPoint.ma?ppage=p&memNo=d" + "';'> " +  p + "</button>";
	                       } 
	         
	                       if(result.pi.currentPage != result.pi.maxPage){
	                    	   value2+=" <button onclick='location.href='" + "<%=contextPath%>/memPoint.ma?ppage=result.pi.currentPage+1&memNo=d" + "';'>&gt;</button>";
	                      } 
	                   $(".paging-area2").html(value2);    
                   
					   	
				   },error:function(){
					   alert("데이터 통신 실패");
				   }
				});
     		
				
				
				
			}
     	

     	
	    	
    		function searchKeyMem(page){
    			
    			var str = $("#keyInput").val(); // 키워드
    			
    			$.ajax({
    				url:"<%=contextPath %>/memSearch.ma",
    				data : {
    					keyword:str,
    					cpage:page
    				},
    				success:function(result){
    					// 검색결과 리스트
    					
    					let sval1 = "";
    					if(result.slist.length == 0){
    						sval1 += "<td colspan='10'>조회되는 회원정보가 없습니다.</td>";
    					}else{
    						for(var i = 0; i < result.slist.length; i++){
    							sval1 += "<tr>" 
                                + "<td>" + result.slist[i].memberNo + "</td>"
                                + "<td>" + result.slist[i].memberId + "</td>"
                                + "<td>" + result.slist[i].memberName + "</td>"
                                + "<td>" + result.slist[i].memberGrade + "</td>"
                                + "<td>" + result.slist[i].email + "</td>"
                                + "<td>" + result.slist[i].phone + "</td>"
                                + "<td>" + result.slist[i].address + "</td>"
                                + "<td>" + result.slist[i].totalpay + "</td>"
                                + "<td>" + result.slist[i].total 
                                +  "<button type='button' id='btn1' onclick= 'memDetail('" + result.slist[i].memberId + "', '" + result.slist[i].memberGrade+ "'," + result.slist[i].total +","+ result.slist[i].memberNo + ");' class='btn btn-outline-secondary btn-sm' data-toggle='modal' data-target='#point-info' style='font-size:9px;'> 상세 </button>"
                                +  "<button type='button' id='btn2' onclick= 'memModify(" + result.slist[i].memberId + "', " + result.slist[i].memberNo+ ");' class='btn btn-outline-secondary btn-sm' data-toggle='modal' data-target='#point-change' style='font-size:9px;'>변경</button>"
                                 + "</td>"
                                 + "<td>" 
                                 + result.slist[i].enrollDate + "</td>"
                             + "</tr>";
    						}
    					}
    					
    					$(".memContent").html(sval1);
    					
    					// 검색결과 페이징
    					let sval2 = "";
    					
	                     if(result.spi.currentPage != 1){ 
	                    	 sval2 += "<button onclick='searchKeyMem(" + (result.spi.currentPage-1) + ");'>&lt;</button>";
                  		} 
       
	                     for(let p=result.spi.startPage; p<=result.spi.endPage; p++){ 
	                    	 sval2 +=" <button onclick='searchKeyMem(" + p + ");'>"+ p +" </button>";
	                       } 
      
                      if(result.spi.currentPage != result.spi.maxPage){
                     	 sval2 +=" <button onclick='searchKeyMem("+ (result.spi.currentPage+1) + ");'> &gt;</button>";
                   } 
                $(".paging-area").html(sval2);   
    					
    					
    				}, error:function(){
    					alert("데이터 통신 실패");
    				}
    				
    			});
    			
    		}
    		
    		
        function memModify(a, b){
     		$("#modifyModalId").val(a);
     		$("#modifyModalNo").val(b);
     	}	
   		 </script>
            
            <div id="mem-3">
                <div class="paging-area">
                    
                                <% if(pi.getCurrentPage() != 1){ %>
                                    <button onclick="location.href='<%=contextPath%>/memList.ma?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                                <% } %>
                    
                                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                                    <button onclick="location.href='<%=contextPath%>/memList.ma?cpage=<%=p%>';"><%= p %></button>
                                <% } %>
                    
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
                                    <td id="detailModalId" ></td>
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
				                    <div class="paging-area2">
				                    <!-- 내가 보고있는 페이지가 1번 페이지가 아닐때에만 나타내기 -->
				                    

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
                
                <form action="<%=contextPath %>/memPointCh.ma" method="post">
                        <input type="hidden" name="" value="">
                       
	                        <table style="width:100%;" class="table table-borderless">
	                                <tr>
	                                    <td >아이디</td>
	                                    <td><input type="text" name="" id="modifyModalId" readonly></td>
	                                </tr>
	                                <tr>
	                                    <td >회원번호</td>
	                                    <td><input type="text" name="memPointNo" id="modifyModalNo" readonly></td>
	                                </tr>
	                                <tr>
	                                    <td>구분</td>
	                                    <td> <input type="radio" name="poStatus" value="적립"> 적립금 지급 <input type="radio" name="poStatus" value="사용"> 적립금 차감 </td>
	                                </tr>
	                                <tr>
	                                    <td>적립금</td>
	                                    <td><input type="number" name="memPointVal"></td>
	                                </tr>
	                                <tr>
	                                    <td>사유</td>
	                                    <td><input type="text" name="memPointCon"></td>
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
            
            
            
                <div id="mem-4" >
                        <p  style="font-size:20px; line-height: 90px; float:left;"><b>등급변경</b></p> 
                </div>
                <div id="mem-5">
                    <table class="upmember-info" style="width:100%; text-align:center;" border=1>
                        <thead>
                            <tr>
                                <td>회원번호</td>
                                <td>아이디</td>
                                <td>이름</td>
                                <td>등급</td>
                                <td>구매금액</td>
                                <td></td>
                            </tr>
                            </thead>
                            <tbody class="upmemContent">
                            <%if(list.isEmpty()){ %>
                                <tr>
                                    <td colspan="6">등급변경대상 회원이 없습니다.</td>
                                </tr>
                            <%}else{ %>
                                <%for(Member m : list){ %>
                                    <tr>
                                        <td><%=m.getMemberNo() %></td>
                                        <td><%=m.getMemberId() %></td>
                                        <td><%=m.getMemberName() %></td>
                                        <td><%=m.getMemberGrade() %></td>
                                        <td><%=m.getTotalpay() %></td>
                                        <td>
                                            <button type="button" id="btnUpgrade" onclick="memUpgrade(<%=m.getMemberNo() %>);" class="btn btn-outline-secondary btn-sm" style="font-size:15px;">변경</button>
                                        </td>
                                    </tr>
                                <%} %>
                            <%} %>
                        </tbody>
                    </table>
                </div>

                <script>
                    function memUpgrade(mNo){

						$.ajax({
							url : "<%=contextPath%>/upGrade.ma"
							data : {mNo:mNo}
							success : function(a){
								
								if(a.result > 0){
									alert(a.grade + "로 회원등급 변경완료되었습니다");
								}else{
									alert("회원등급 변경 실패");
								}
								
							}, error : function(){
								alert("회원등급용  ajax 통신실패")
							}
						});

                    }

                </script>
 <br><br><br><br><br><br><br><br><br><br>
        </div>
       
    </div>
    
</body>
</html>