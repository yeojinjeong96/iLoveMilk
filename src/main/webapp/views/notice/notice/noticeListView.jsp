<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.milk.notice.model.vo.Notice, java.util.ArrayList , com.milk.common.model.vo.PageInfo" %>
<% 
	ArrayList<Notice>list= (ArrayList<Notice>)request.getAttribute("list");
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
        margin-top: 50px;
        
    }
    #notice-list> tbody tr:hover{
        
        cursor: pointer;
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
	<%@include file="../common/serviceCenterMainTop.jsp" %>
	
    <div id="outer" align="center">
        <br>
        <div style="width: 700px;">
            <table id="notice-list" class="text-center table">
                <thead  class="thead-light">
                    <tr>
                        <th width="70">No.</th>
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
                </thead>
                <tbody>
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
                </tbody>
            </table>
            <br>
            <%if(!list.isEmpty()){ %>
            <div class="paging-area" >
            <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=pi.getCurrentPage()-1%>';"  class="btn btn-primary btn-sm">&lt;</button>
            <%} %>   
            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=p%>';"  class="btn btn-primary btn-sm"><%=p %></button>
            <%} %>
            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
                <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=pi.getCurrentPage()+1%>';"  class="btn btn-primary btn-sm">&gt;</button>
            <%} }%>
            </div>
            

        </div>

    </div>
	<script>
		$(function(){
			$("#notice-list tr").click(function(){
				location.href='<%=contextPath%>/detail.no?no='+ $(this).children().eq(0).text();
			})
		})
	</script>
	
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>