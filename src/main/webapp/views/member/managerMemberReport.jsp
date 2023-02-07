<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import ="com.milk.common.model.vo.PageInfo, java.util.ArrayList, com.milk.member.model.vo.Report" %>    
    
<% 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
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
        height:100px;
        padding-left:10px;
    }
    #mem-1>*{float:left;}
    #mem-2{
        width:100%;
        height:60%;
    }
    #mem-3{
        width:100%;
        height:20%;
    }


    </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="../common/managerHeader.jsp" %>
    <%@ include file="../common/managerMenubar.jsp"%>

    <div class="wrap1" align="center">    
        <div class="mem-wrap">
                    <div id="mem-1" >
                        <div style="width:100px; height:100%">
                    <p  style="font-size:20px; line-height: 90px;"><b>신고관리</b></p>  

                    </div>
                    <br><br>

                    </div>
                    <div id="mem-2">
                        <table class="table member-report" style="width:100%; font-size:15px; text-align:center;">
                        	<thead>
                            <tr>
                                <td>신고번호</td>
                                <td>신고일</td>
                                <td>신고내용</td>
                                <td>아이디</td>
                                <td></td>

                            </tr>
                            </thead>
                            <tbody>
                            <%if(list.isEmpty()){ %>
                            	<tr>
                            		<td colspan="5">조회내역이 없습니다.</td>
                            	</tr>
                            <%}else{ %>
                            
                            	<%for(Report r : list){ %>
                            	<tr>
                                <td><%=r.getReportNo() %></td>
                                <td><%=r.getRepDate() %></td>
                                <td><a onclick="detailRep('<%=r.getRepType() %>');" style="cursor:pointer;"><%=r.getRepContent() %></a></td>
                                <td><%=r.getMemberId() %></td>
                                <td>
                                	<button type="button" onclick="memReport1(<%=r.getRepMemNo()%>);" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#report-mngm">관리</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="deleteReport(<%=r.getReportNo() %>);">삭제</button>
                                </td>
                                </tr>
	                            <%} %>
							<%} %>
							</tbody>
                        </table>
                    </div>
                    <div id="mem-3">
                        <div align="right" style="width:700px">
                            <button type="button" onclick="selectBlackList();" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#blacklist-view">블랙리스트조회</button>
                        </div> 
                        <div class="paging-area">
                            <!-- 내가 보고있는 페이지가 1번 페이지가 아닐때에만 나타내기 -->
                            
                                        <% if(pi.getCurrentPage() != 1){ %>
                                            <button onclick="location.href='<%=contextPath%>/repList.ma?cpage=<%=pi.getCurrentPage()-1%>';" class="btn btn-primary btn-sm" >&lt;</button>
                                        <% } %>
                            
                                        <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                                            <button onclick="location.href='<%=contextPath%>/repList.ma?cpage=<%=p%>';" class="btn btn-primary btn-sm" ><%= p %></button>
                                        <% } %>
                            <!--  내가 보고있는 페이지가 마지막 페이지가 아닐 때에만 나타내기 -->
                            
                                        <% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
                                            <button onclick="location.href='<%=contextPath%>/repList.ma?cpage=<%=pi.getCurrentPage()+1%>';" class="btn btn-primary btn-sm" >&gt;</button>
                                        <% } %>
                        </div>
                        
                    </div>
                    
                    <script>
                    	// 신고된 회원의 신고 상세내역
                    	function memReport1(memNo){
                    		
                    		$.ajax({
                    			url: "<%=contextPath%>/memRepma.ma",
                    			data:{memNo:memNo},
                    			success:function(result){
                   				
                    				console.log(result);
                    				
                    				$("#modalMemId1").text(result.memberId);
                    				$("#modalMemCount1 > b").text(result.count);
                    				$("#modalMemGrade1").text(result.memberGrade);
                    				
                    				$("#modalMemId2").text(result.memberId);
                    				$("#modalMemNo2").val(memNo);
                    				
                    				$("#modalMemId3").val(result.memberId);
                    				
                    			}, error:function(request, status, error ){
                    			    alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
                    			}
                    		});
                    		
                    	}
                    	// 신고내역 삭제
                    	function deleteReport(repNo){
                    		$.ajax({
                    			url: "<%=contextPath%>/repDelete.ma",
                    			data:{repNo : repNo},
                    			success:function(result){
                    				
                    				if(result){
                    					var r = confirm("해당 신고내역을 삭제하시겠습니까?");
                    					if(r){
                    						alert("신고내역이 성공적으로 삭제되었습니다.");
                    						location.reload();
                    					}
                    				}
                    				
                    				
                    			},error: function(){
                    				alert("통신실패");
                    			}
                    		})
                    	}
                    	// 블랙리스트 조회
                    	function selectBlackList(){
                    		$.ajax({
                    			url:"<%=contextPath%>/blackSelect.ma",
                    			success:function(result){
                    				
                    				let val = "";
                    				
                                    if(result.length == 0){
                                    	val += "<tr><td colspan='3'> 내역이 없습니다. </td></tr>";

                                    }else{
                                    	
                                    	
                                    	for(let i =0; i<result.length; i++){
                                    		
                                    		val += "<tr>"
                                    			+ "<td>" + (i+1) + "</td>"
                                    			+ "<td>" + result[i].memberId + "</td>"
                                    			+ "<td>" + result[i].modifyDate + "</td>"
                                    			+ "</tr>";
                                    	}
                                    }

                    				$(".blackListBody").html(val);
                    				
                    			},error:function(){
                    				alert("통신실패");
                    			}
                    			
                    		});
                    	}
                    	
                    	function detailRep(type){
                    		
                    		if(type == "1"){
                    			location.href="<%=contextPath%>/recipeDeleteListM.re?cpage=1";
                    		}else if(type == "2"){
                    			location.href ="<%=contextPath%>/replyM.re?cpage=1";
                    		}else if(type = "3"){ // 리뷰관리 페이지 href 넣기
                    			location.href ="";
                    		}
                    		
                    	}
                    	
                    </script>




                    <!-- 신고회원관리 모달 div -->
                    <div class="modal" id="report-mngm">
                        <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">신고 회원 관리</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                    
                        <!-- Modal body -->
                        <div class="modal-body">
                        
                        <form action="" method="post">
                                <input type="hidden" name="" value="">
                                <table style="width:100%; height:100px;">
                                        <tr>
                                            <td>아이디</td>
                                            <td id="modalMemId1"></td>
                                        </tr>
                                        <tr>
                                            <td>누적 신고 횟수</td>
                                            <td id="modalMemCount1"><b></b>회</td>
                                        </tr>
                                        <tr>
                                            <td>회원 등급</td>
                                            <td id="modalMemGrade1"></td>
                                        </tr>
                                        
                                </table>

                                <br>
                                <div align="center">
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#point-change">적립금변경</button>
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#blacklist-add">블랙리스트추가</button>
                                </div>

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
                                <table  style="width:100%; height:150px;">
                                        <tr>
                                            <td>아이디</td>
                                            <td id="modalMemId2"></td>
                                        </tr>
                                        <tr>
	                                    <td >회원번호</td>
	                                    <td  value=""><input type="text" name="memPointNo" id="modalMemNo2" readonly></td>
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
                                <button type="submit" class="btn btn-outline-secondary btn-sm">확인</button> <button type="reset" class="btn btn-outline-secondary btn-sm"  data-dismiss="modal" >취소</button>
                                </div>    
                        </form>
                        
                        
                        </div>
                    
                        </div>
                    </div>
                    </div>
                    


                    <!-- 블랙리스트추가 모달 div -->
                    <div class="modal" id="blacklist-add">
                        <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">블랙리스트 추가</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                    
                        <!-- Modal body -->
                        <div class="modal-body">
                        
                        <form onsubmit="return confirm('해당회원을 블랙리스트에 추가하시겠습니까?');" action="<%=contextPath %>/blackAdd.ma" method="post">
                                <input type="hidden" name="" value="">
                                <table style="width:100%; height:100px;" >
                                        <tr>
                                            <td>아이디</td>
                                            <td><input type="text" id="modalMemId3" name="blackId" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>날짜</td>
                                            <td><input type="date" name="blackDate"></td>
                                        </tr>
                                </table>

                                <br>
                                <div align="center">
                                <button type="submit" class="btn btn-outline-secondary btn-sm" >확인</button> <button type="reset" class="btn btn-outline-secondary btn-sm"  data-dismiss="modal" >취소</button>
                                </div>
                        </form>
                        
                        
                        </div>
                    
                        </div>
                    </div>
                    </div>
                    
                  

                    <!-- 블랙리스트 조회 모달 div -->
                    <div class="modal" id="blacklist-view">
                        <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">블랙리스트 조회</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                    
                        <!-- Modal body -->
                        <div class="modal-body">
                        
                        <form action="" method="post">
                                <input type="hidden" name="" value="">
                                
                                <table style="width:100%; height:100px; text-align: center; "class="table blackTable">
                                	<thead>
	                                    <tr> 
	                                        <td>no.</td>
	                                        <td>아이디</td>
	                                        <td>제재일</td>
	                                    </tr>
                                    </thead>
                                    <tbody class="blackListBody">

									</tbody>
                                </table>

                                </div>

                        </form>
                        
                    </div>
                    
                 </div>
             </div>
        </div>
        
        
        
    </div>
</body>
</html>