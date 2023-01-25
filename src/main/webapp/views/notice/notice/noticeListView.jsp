<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.milk.notice.model.vo.Notice, java.util.ArrayList , com.milk.common.model.vo.PageInfo" %>
<% 
	ArrayList<Notice>list= (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String contextPath= request.getContextPath();
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
        margin-top: 50px;
        
    }


</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div id="outer" align="center">
        <br>
        <div style="width: 700px;">
            <table id="notice-list" border="1" class="text-center">
                <tr>
                    <th width="50">번호</th>
                    <th width="350">제목</th>
                    <th width="100">작성일</th>
                    <th width="100">작성자</th>
                    <th width="100">조회</th>
                </tr>
                <!--공지사항 없을경우-->
              	<%if(list.isEmpty()){ %>
                <tr>
                    <td colspan="5">공지사항이 없습니다.</td>
                </tr>
                <%}else{ %>
                <!--공지사항 있을경우-->
                <%for(Notice n:list){ %>
                <tr>
                    <td><%=n.getNoticeNo()%></td>
                    <td><%=n.getNoticeTitle() %></td>
                    <td><%=n.getEnrollDate() %></td>
                    <td><%=n.getManagerName() %></td>
                    <td><%=n.getCount() %></td>
                </tr>
                <%} %>
                <%} %>
            </table>
            <br>
            <div class="paging-area" >
                <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                <%for(int p= pi.getStartPage(); p<pi.getEndPage(); p++){ %>
                <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=p%>';"><%=p %></button>
                <%} %>
                <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            </div>

        </div>

    </div>


</body>
</html>