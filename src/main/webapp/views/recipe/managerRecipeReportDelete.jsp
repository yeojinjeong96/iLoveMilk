<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.common.model.vo.PageInfo, com.milk.recipe.model.vo.Report" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
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

    #delete{
        width: 700px;
    }
    
    .list-area tbody a{
    	text-decoration: none;
    	color: black;
    }

</style>
</head>
<body>

	<%@include file="/views/common/managerHeader.jsp" %>
	<%@include file="/views/common/managerMenubar.jsp" %>

	<div class="outer" align="center">
        <br>
        <div width="700px" align="left"style="margin-left: 250px;">
            <h4>게시글 관리</h4>
        </div>

        <div class="dropdown" width="700px" align="left" style="margin-left: 250px;">
            <button type="button" class="btn btn-primary dropdown-toggle btn-secondary btn-sm" data-toggle="dropdown">
              게시글 관리
            </button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="<%= contextPath %>/recipeDeleteListM.re?cpage=1" target="_self">게시글 삭제</a>
              <a class="dropdown-item" href="<%= contextPath %>/recipeReportDeleteListM.re?cpage=1" target="_self">신고 게시글 처리</a>
              <a class="dropdown-item" href="<%= contextPath %>/recipeListRestoreM.re?cpage=1" target="_self">삭제글 관리</a>
            </div>
          </div>
          <br><br><br><br>

        <div width="700px" align="left"style="margin-left: 250px;">
            <h4>신고 게시글 처리</h4>
        </div>
        <table class="list-area" border="1"> 
            <thead>
                <tr height="30px">
                    <th width="20px">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" name="allCheck" class="custom-control-input allCheck" id="customCheck" onclick="allChecked(this)">
                            <label class="custom-control-label" for="customCheck"></label>
                        </div>
                    </th>
                    <th width="80px">글번호</th>
                    <th width="140px">신고사유</th>
                    <th width="100px">신고자</th>
                    <th width="160px">제목</th>
                    <th width="100px">작성일</th>
                </tr>
            </thead>
            <tbody>
            <% for(Report r : list) { %>
                <tr height="30px">
                    <td><input type="checkbox" class="check" name="check" onclick="checkClicked()" value="<%= r.getRefNo() %>"></td>
                    <td><%= r.getRefNo() %></td>
                    <td><%= r.getReportContent() %></td>
                    <td><%= r.getReportingMemberNo() %></td>
                    <td><a href="<%= contextPath %>/detail.re?no=<%= r.getRefNo() %>"><%= r.getRefTitle() %></a></td>
                    <td><%= r.getReportDate() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>
        
        <table id="delete">
            <tr>
                <td align="right" style="padding: 5px 5px;">
                    <a class="btn btn-danger btn-sm" onclick="recipeDelete();">삭제</a>
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
        	
        	function recipeDelete(){
        		var recipeArray = [];
        		
        		$("input:checkbox[name=check]:checked").each(function(){
        			recipeArray.push($(this).val());
        		});
        		
        		// console.log(recipeArray);
        		
        		if(recipeArray == ""){
        			alert("삭제할 항목을 선택해주세요.");
        			return false;
        		}
        		
        		var confirmAlert = confirm("정말로 삭제하시겠습니까?");

        		if(confirmAlert){
        			
        			$.ajax({
        		       url:"<%= contextPath %>/selectDelete.re",
        		       data:{recipeArray:recipeArray},
        		       type:"post",
        		       traditional:true,
        		       success:function(result) {
        					alert("해당글이 정상적으로 삭제되었습니다.");
        					location.reload();
        		       }
        		   })	
        		}
        	}
        </script>

        <div class="paging-area">
            <% if(pi.getCurrentPage() != 1) { %>
                <button onclick="location.href='<%= contextPath %>/recipeReportDeleteListM.re?cpage=<%= pi.getCurrentPage()-1 %>';">&lt;</button>
            <% } %>
            
            <% for(int p=pi.getStartPage() ; p<=pi.getEndPage() ; p++) { %>
                <button onclick="location.href='<%= contextPath %>/recipeReportDeleteListM.re?cpage=<%= p %>';"><%= p %></button>
            <% } %>
               
             <% if(pi.getCurrentPage() != pi.getMaxPage()) { %>
                <button onclick="location.href='<%= contextPath %>/recipeReportDeleteListM.re?cpage=<%= pi.getCurrentPage()+1 %>';">&gt;</button>
             <% } %>
        </div>
        <br><br>

        <form action="" method="">

            <table>
                <tr>
                    <td>
                        <select name="" style="height:30px;">
                            <option value="">전체</option>
                            <option value="">제목</option>
                            <option value="">작성자</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="" value="검색어를 입력하세요.">
                    </td>
                    <td>
                        <button type="submit">검색</button>
                    </td>
                </tr>
            </table>
            
        </form>
    </div>
</body>
</html>