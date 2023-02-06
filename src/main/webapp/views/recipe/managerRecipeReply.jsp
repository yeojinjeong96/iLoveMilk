<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.common.model.vo.PageInfo, com.milk.recipe.model.vo.Reply" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list");
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

    #search{
    	margin-left : 210px;
        vertical-align: middle;
        width: 600px;
        height: 150px;
        background-color: lightgray;
        border: 1px solid gray;
    }

    .search-area{
        margin-top: 25px;
        background-color: white;
        width: 550px;
    }

    .list-area{
        width: 700px;
        text-align: center;
        table-layout: fixed;
        border-collapse: collapse /* 테두리 한줄로 나오도록 */
    }

    .list-area tr th{
        background-color: lightgray;
    }

    .list-area tr td{
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        -webkit-box-orient: vertical;
    }
    
    .list-area tbody a{
    	text-decoration: none;
    	color: black;
    }

    #delete{
        width: 700px;
    }
    
    #title{
    	width: 700px;
    	margin-left : 200px;
    }

</style>
</head>
<body>

	<%@include file="/views/common/managerHeader.jsp" %>
	<%@include file="/views/common/managerMenubar.jsp" %>

	<div class="outer" align="center">
        <br>
        <div id="search">
            <table class="search-area" border="1">
                <tr>
                    <td width="50px">
                        <select name="" style="border: none;">
                            <option value="">제목</option>
                            <option value="">작성자</option>
                        </select>
                    </td>
                    <td width="500px">
                        <input type="text" name="" value="검색어를 입력하세요." style="border: none;" size="55" required>
                    </td>
                </tr>
                <tr>
                    <td>신고 여부</td>
                    <td>
                        <input type="radio" name="" id="">
                        <label for="">Y</label>
                        
                        <input type="radio" name="" id="">
                        <label for="">N</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit" class="btn btn-secondary btn-sm">검색</button>
                    </td>
                </tr>
            </table>
        </div>
        <br><br>
        
        <div id="title" align="left"><h4>댓글 관리</h4></div>
        <table class="list-area" border="1"> 
            <thead>
                <tr height="30px">
                    <th width="20px">
                        <div class="custom-control custom-checkbox">
	                    	<input type="checkbox" name="allCheck" class="custom-control-input allCheck" id="customCheck" onclick="allChecked(this)">
	                    	<label class="custom-control-label" for="customCheck"></label>
	                    </div>
                    </th>
                    <th width="70px">신고 여부</th>
                    <th width="80px">댓글번호</th>
                    <th width="140px">신고 사유</th>
                    <th width="90px">신고자</th>
                    <th width="140px">게시글 제목</th>
                    <th width="130px">댓글 내용</th>
                </tr>
            </thead>
            <tbody>
            	<% for(Reply r : list) { %>
                <tr height="30px">
                    <td>
	                    <input type="checkbox" class="check" name="check" onclick="checkClicked()" value="<%= r.getReplyNo() %>">
                    </td>
                    <td><%= r.getReportStatus() %></td>
                    <td><%= r.getReplyNo() %></td>
                    <td><%= r.getReportContent() %></td>
                    <td><%= r.getMemberNo() %></td>
                    <td><%= r.getRecipeTItle() %></td>
                    <td><%= r.getReplyContent() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
        <table id="delete">
            <tr>
                <td align="right" style="padding: 5px 5px;">
                    <a href="" class="btn btn-danger btn-sm" onclick="replyDelete();">삭제</a>
                </td>
            </tr>
        </table>
        
        <script>
        	function allChecked(target){
        		if($(target).is(":checked")){
        			$(".check").prop("checked", true);
        		}else{
        			$(".check").prop("checked", false);
        		}
        	}
        	
        	function checkClicked(){
        		//체크박스 전체개수
        		var allCount = $("input:checkbox[name=check]").length;
        		
        		//체크된 체크박스 전체개수
        		var checkedCount = $("input:checkbox[name=check]:checked").length;
        		
        		//체크박스 전체개수와 체크된 체크박스 전체개수가 같으면 체크박스 전체 체크
        		if(allCount == checkedCount){
        			$(".check").prop("checked", true);
        		}else{ //같지않으면 전체 체크박스 해제
        			$(".allCheck").prop("checked", false);
        		}
        		
        	}
        	
        	function replyDelete(){
        		var replyArray = [];
        		
        		$("input:checkbox[name=check]:checked").each(function(){
        			replyArray.push($(this).val());
        		});
        		
        		// console.log(replyArray);
        		
        		if(replyArray == ""){
        			alert("삭제할 항목을 선택해주세요.");
        			return false;
        		}
        		
        		var confirmAlert = confirm("정말로 삭제하시겠습니까?");

        		if(confirmAlert){
        			
        			$.ajax({
        		       url:"<%= contextPath %>/selectDeleteReply.re",
        		       data:{replyArray:replyArray},
        		       type:"post",
        		       traditional:true,
        		       success:function(result) {
        					alert("해당 댓글이 정상적으로 삭제되었습니다.");
        					location.reload();
        		       }
        		   })	
        		}
        	}
        </script>

        <div class="paging-area">
            <% if(pi.getCurrentPage() != 1) { %>
                <button onclick="location.href='<%= contextPath %>/replyM.re?cpage=<%= pi.getCurrentPage()-1 %>';">&lt;</button>
            <% } %>
            
            <% for(int p=pi.getStartPage() ; p<=pi.getEndPage() ; p++) { %>
                <button onclick="location.href='<%= contextPath %>/replyM.re?cpage=<%= p %>';"><%= p %></button>
            <% } %>
               
             <% if(pi.getCurrentPage() != pi.getMaxPage()) { %>
                <button onclick="location.href='<%= contextPath %>/replyM.re?cpage=<%= pi.getCurrentPage()+1 %>';">&gt;</button>
             <% } %>
        </div>
        <br>

    </div>
    
</body>
</html>