<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.recipe.model.vo.*" %>
<%
	Recipe r = (Recipe)request.getAttribute("r");
	ArrayList<RecipeIngre> listI = (ArrayList<RecipeIngre>)request.getAttribute("listI");
	ArrayList<RecipeOrder> listO = (ArrayList<RecipeOrder>)request.getAttribute("listO");
	int replyCount = (int)request.getAttribute("replyCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        margin: auto;
    }

    .detail-area{
        margin-bottom: 10px;
    }

    .detail-area2{
        border-top: 3px solid gray;
        width: 700px;
        border-collapse: collapse /* 테두리 한줄로 나오도록 */
    }

    .detail-area2>thead tr{
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
    }

    .detail-area2>thead th{
        background-color: lightgray;
    }

    .detail-area2>tbody>tr{
        text-align: center;
        border: 1px solid white;
    }

    .main-image{
        width: 700px;
    }

    .main-image>img{
        width: 60%;
    }



    .ingre-area{
        text-align: center;
        width: 200px;
    }

    .order-area{
        text-align: center;
        width: 600px;
    }

    #list{
        font-weight: 700;
        color: rgb(51, 135, 253);
        border: 4px solid rgb(51, 135, 253);
        width: 30px;
    }

    .detail-image>img{
        width: 100%;
    }

    .profile-image>img{
        width: 100%;
    }

    .reply-image>img{
        width: 100%;
    }

    .detail-area , .reply-area, .reply-count{
        width: 700px;
    }

    #num{
        font-size: 15px;
        font-weight: 700;
        color: rgb(51, 135, 253);
    }

    .reply-enroll{
        width: 700px;
    }

    .reply-enroll button {
        width: 80px;
        height: 100px;
        vertical-align: auto;
        font-size: 16px;
        font-weight: 1000;
        border-radius: 10px;
        border: 2px solid rgb(160, 160, 160);
        cursor: pointer;
        color: rgb(70, 70, 70);
    }


    #reply{
        border-color: gray;
        border: 2px solid gray;
        border-radius: 5px;
    }

</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>
	
	<% String loginUserId = loginMember == null ? "" : loginMember.getMemberId(); %>

	<div class="outer" align="center">
        <br>
        <table class="detail-area">
            <tr>
                <td>
                    <a href="<%= contextPath %>/detailR.re?no=<%= r.getRecipeNo()+1 %>" class="btn btn-secondary btn-sm">&lt;이전글</a>
                    <a href="<%= contextPath %>/detailR.re?no=<%= r.getRecipeNo()-1 %>" class="btn btn-secondary btn-sm">다음글&gt;</a>
                    <a href="<%= contextPath %>/listR.re?cpage=1" class="btn btn-secondary btn-sm">목록</a>
                </td>
            </tr>
        </table>
        
        <table class="detail-area2"> 
            <thead>
                <tr>
                    <th width="100px">제목</th>
                    <td width="600px" colspan="3"><%= r.getRecipeTitle() %></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td colspan="3"><%= r.getRecipeWriter() %></td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td width="150px"><%= r.getEnrollDate() %></td>
                    <th width="100px">조회수</th>
                    <td><%= r.getCount() %></td>
                </tr>
            </thead>
            <tbody>
                <tr height="200">
                    <td colspan="4">
                        <br><br>
                        <div class="main-image">
                            <img src="<%= contextPath %>/<%= r.getMainImg() %>">
                        </div>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <%= r.getRecipeIntro() %>
                    </td>
                </tr>
            </tbody>
        </table>
        <br><br>

        <table class="ingre-area">
            <tr>
                <td colspan="2">
                    <br>
                    <h3 style="font-size: 22px;"><b>재료</b></h3>
                </td>
            </tr>
            <% for(RecipeIngre ri : listI) { %>
	            <tr>
	                <td>
	                    <%= ri.getIngreName() %>
	                </td>
	                <td>
	                    <%= ri.getIngreAmount() %>
	                </td>
	            </tr>
            <% } %>
        </table>

        <table class="order-area">
            <tr>
                <td colspan="4">
                    <br>
                    <h3 style="font-size: 22px;"><b>조리 순서</b></h3>
                </td>
            </tr>
            <% for(RecipeOrder ro : listO) { %>
            <tr>
                <td width="200px">
                    <div class="detail-image">
                        <img src="<%= contextPath %>/<%= ro.getRecipeImg() %>">
                    </div>
                </td>
                <td width="50px" align="center">
                    <div id="list"><%= ro.getRecipeOrder() %></div>
                </td>
                <td width="450px" colspan="2" align="left">
                    <%= ro.getRecipeExplain() %>
                </td>
            </tr>
            <% } %>
        </table>
        <br><br>
        
        
        <div style="border-bottom: 3px solid gray; width: 700px;"></div>
        <br><br>


        <table class="reply-count">
            <tr>
                <td width="45" style="font-size:large">
                    댓글
                </td>
                <td>
                    <div id="num"><%= replyCount %></div>
                </td>
            </tr>
        </table>

        <div style="border-bottom: 3px solid gray; width: 700px;"></div>
        <br>


        <table class="reply-area" align="center">
            <tbody>
            
            </tbody>
        </table>
       	<div style="border-bottom: 3px solid gray; width: 700px;"></div>
        <br>

	

		<% if(loginMember != null) { %>
        <!-- 로그인한 회원만 보여지도록 -->
           <table class="reply-enroll" align="center">
               <tr>
                   <td width="400px" align="right" style="padding-top: 5px; padding-right: 10px">
                       <textarea name="reply" style="resize: none; width: 350px; height: 100px;" required placeholder="댓글을 남겨주세요."></textarea>
                   </td>
                   <td width="200px" align="left">
                       <button onclick="insertReply();">등록</button>
                   </td>
               </tr>
           </table>
		<% } %>
		
		
		<script>
			$(function(){
				selectReplyList();
			})
			
			function insertReply(){
				$.ajax({
					url:"<%= contextPath %>/reinsert.re",
					type:"post",
					data:{
						content:$(".reply-enroll textarea").val(),
						no:<%= r.getRecipeNo() %>
					},
					success:function(result){
						if(result > 0) {
							selectReplyList();
							$(".reply-enroll textarea").val("");
							location.reload();
						}else{
							alert("댓글 등록을 실패했습니다.")
						}
					}
					
				})
			}
			
			
			function selectReplyList(){
				$.ajax({
					url:"<%= contextPath %>/relist.re",
					data:{
						no:<%= r.getRecipeNo() %>
					},
					success:function(list){
						
						let value = "";
        				if(list.length == 0){ // 댓글이 없을 경우
        					value += "<tr>"
        						   + 	"<td colspan='4'>조회된 댓글이 없습니다.</td>"
        						   + "</tr>"
        				}else { // 댓글이 있을 경우
        					for(let i=0; i<list.length; i++){
        						value += "<tr>"
        							   +	"<td width='70px' rowspan='2' align='center' style='vertical-align: top;'>"
        							   +		"<div class='profile-image'>"
        							   +			"<img src='" + list[i].profileImg + "'>"
        							   +		"</div>"
        							   +	"</td>"
        							   +	"<td width='70px' height='1'>" + list[i].memberNo + "</td>"
        							   +	"<td width='160px'>" + list[i].enrollDate + "</td>"
        							   +	"<input type='hidden' name='reNo' value='" + list[i].replyNo + "'>";
        							   
        							   
        							   if(list[i].memberNo == '<%= loginUserId %>') {
        								   value += "<td width=''><button type='button' onclick='replyDel();' style='border:none; background:none;'>삭제</button></td>";  
        							   }else if('<%= loginUserId %>' == "") {
     									  value += "<td width=''></td>";
     								   }else {
     									  value += "<td width=''><button type='button' onclick='sReply();' data-toggle='modal' data-target='#report-reply-view' style='border:none; background:none;'>신고</button></td>";
     								   }
        							   
        						
        							   
        							   value += "</tr>"
        							   + "<tr>"
        							   +	"<td colspan='3' style='vertical-align: top'>"
        							   +		list[i].replyContent
        							   +	"</td>"
        							   + "</tr>";				   
        					}
        				}
        				
        				$(".reply-area tbody").html(value);
						
					}
				})
			}
			
			function replyDel(){
				$.ajax({
					url:"<%= contextPath %>/reDelete.re",
					type:"post",
					data:{
						no:$(window.event.target).parent().prev().val()
					},
					success:function(result){
						if(result > 0) {
							alert("성공적으로 댓글을 삭제했습니다.")
							selectReplyList();
							location.reload();
						}else{
							alert("댓글 삭제에 실패했습니다.")
						}
					}
					
				})
			}
			
			function sReply(){
            	var rno = $(window.event.target).parent().prev().val();
            	$("#reNo").val(rno);
            }
		</script>
	


	
		

         <!-- 이미지 미리보기 스크립트 -->
         <script>
            function clickFile(num){
                    $("input[name=replyFile]").click();
                }

                function loadImg(inputFile, num){
               
                    if(inputFile.files.length == 1) {
                        const reader = new FileReader();
                        reader.readAsDataURL(inputFile.files[0]);
                        reader.onload = function(e){
                    
                            switch(num){
                                case 1: $("#replyImg").attr("src", e.target.result); break;
                            }
                        }

                    }else{
                        
                        switch(num){
                            case 1: $("#replyImg").attr("src", null); break;
                        }
                    }
                }
        </script>
        
        <!-- 신고-댓글 모달 div -->
        <div class="modal" id="report-reply-view" align="center">
        	<div class="modal-sm">
        		<div class="modal-content">
                       
		        <!-- Modal Header -->
		        <div class="modal-header">
		        	<h3 class="modal-title">신고 사유 선택</h4>
		        </div>
                   
        			<!-- Modal body -->
			        <div class="modal-body">
			        	<form action="<%= contextPath %>/reportReply.re" method="post">
			        	<input type="hidden" name="reNo" id="reNo">
			        	<input type="hidden" name="no" value="<%= r.getRecipeNo() %>">
				            <table>
				            	<tr>
				            		<td>
				            			<input type="radio" name="selectReport" id="radio1" value="광고성 댓글" checked>
					        			<label for="radio1">광고성 댓글</label>
				            		</td>
				            	</tr>
				            	<tr>
				            		<td>
				            			<input type="radio" name="selectReport" value="도배 및 중복 댓글" id="radio2">
					        			<label for="radio2">도배 및 중복 댓글</label>
				            		</td>
				            	</tr>
				            	<tr>
				            		<td>
				            			<input type="radio" name="selectReport" value="욕설/비방" id="radio3">
					        			<label for="radio3">욕설/비방</label>
				            		</td>
				            	</tr>
				            	<tr>
				            		<td>
				            			<input type="radio" name="selectReport" value="외설적인 댓글" id="radio4">
					        			<label for="radio4">외설적인 댓글</label>
				            		</td>
				            	</tr>
				            	<tr>
				            		<td>
				            			<input type="radio" name="selectReport" value="기타" id="radio5">
					        			<label for="radio5">기타</label>
				            		</td>
				            	</tr>
				            	<tr>
				            		<td>
				            			<textarea name="etc" placeholder="신고 내용을 입력해주세요." style="resize:none;"></textarea>
				            		</td>
				            	</tr>
				            </table>
				            <br>
				            <input type="submit" value="신고하기">
				            

				        </form>
                       
        			</div>   
            	</div>
        	</div>
    	</div>

    </div>
    
    <%@ include file = "../common/footer.jsp" %>

</body>
</html>