<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.recipe.model.vo.Recipe, com.milk.common.model.vo.PageInfo" %>
<%
	ArrayList<Recipe> list = (ArrayList<Recipe>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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

    .searchResult{
        padding-left: 155px;
        margin-bottom: -30px;
    }

    .searchResult>b{
        font-size: 17px;
        color: rgb(51, 135, 253);
    }

    .order{
        width: 845px;
        text-align: right;
        margin-bottom: -40px;
    }

    .list-area{
        width: 700px;
        margin: auto;
    }

    .thumbnail{
        border: 1px solid white;
        width: 220px;
        display: inline-block;
        margin: 5px;
    }

    .list-area img{
        width: 100%;
        margin: auto;
    }

    .writer{
        margin-top: -10px;
        text-align: right;
        width: 700px;
    }

    .order>button:hover{
        background-color: rgb(51, 135, 253);
    }
    
    .thumbnail:hover{
   		opacity:0.7;
   		cursor:pointer;
   	}
</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>

	<div class="outer">
        <br>
        <h2 align="center">자유게시판</h2>
        <br>


        <div class="order" align="right">
            <button onclick="desc();" type="button" class="btn btn-secondary btn-sm">최신순</button>
            <button onclick="asc();" type="button" class="btn btn-secondary btn-sm">좋아요순</button>
            <button onclick="count();" type="button" class="btn btn-secondary btn-sm">조회순</button>
        </div>
        <br><br>

        <div class="list-area">

			<% for(Recipe r : list) { %>
            <div class="thumbnail" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                <input type="hidden" value="<%= r.getRecipeNo() %>">
                <img src="<%= contextPath %>/<%= r.getMainImg() %>" width="200" height="150">
                <p>
                    <%= r.getRecipeTitle() %><br>
                    <%= r.getRecipeWriter() %><br>
                    <%= r.getEnrollDate() %> &nbsp;&nbsp;&nbsp; <%= r.getCount() %>
                </p>
            </div>
            <% } %>

            <div style="border-bottom: 3px solid gray; width: 700px;"></div>

            
        </div>


        <div align="center">

            <br>
            <% if(loginMember != null) { %>
	            <!-- 로그인한 회원에게만 보여지도록 -->
	            <div class="writer" align="right">
	                <a href="<%= contextPath %>/enrollForm.re" class="btn btn-secondary btn-sm">글쓰기</a>
	            </div>
	        <% } %>
	            <br>
			
			
			
            <div class="paging-area">
            <% if(pi.getCurrentPage() != 1) { %>
                <button onclick="location.href='<%= contextPath %>/list.re?cpage=<%= pi.getCurrentPage()-1 %>';">&lt;</button>
            <% } %>
            
            <% for(int p=pi.getStartPage() ; p<=pi.getEndPage() ; p++) { %>
                <button onclick="location.href='<%= contextPath %>/list.re?cpage=<%= p %>';"><%= p %></button>
            <% } %>
               
             <% if(pi.getCurrentPage() != pi.getMaxPage()) { %>
                <button onclick="location.href='<%= contextPath %>/list.re?cpage=<%= pi.getCurrentPage()+1 %>';">&gt;</button>
             <% } %>
            </div>
            <br><br>

            <form action="<%= contextPath %>/search.re?cpage=1" method="post">

                <table>
                    <tr>
                        <td width="60px">
                            <select name="search-select" style="height:30px;">
                                <option value="title">제목</option>
                                <option value="content">본문</option>
                                <option value="writer">작성자</option>
                                <option value="ingre">재료</option>
                            </select>
                        </td>
                        <td width="365px">
                            <input type="text" name="keyword" size="40" placeholder="검색어를 입력하세요." required>
                        </td>
                        <td width="60px">
                            <button type="submit" style="width:60px;">검색</button>
                        </td>
                    </tr>
                </table>
                
            </form>

        </div>
        
        <script>
        	$(".thumbnail").click(function(){
        		location.href = "<%= contextPath %>/detail.re?no=" + $(this).children('input').val();
        	})
        	
        	function desc(){
        		location.href = "<%= contextPath %>/list.re?cpage=1"
        	}
        	function asc(){
        		location.href = "<%= contextPath %>/oldestlist.re?cpage=1"
        	}
        	function count(){
        		location.href = "<%= contextPath %>/countlist.re?cpage=1"
        	}
        </script>
        
    </div>
    
    <%@ include file = "../common/footer.jsp" %>

</body>
</html>