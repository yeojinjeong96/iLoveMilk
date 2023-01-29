<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.util.ArrayList, com.milk.notice.model.vo.QA" %>
<% ArrayList<QA>list =(ArrayList<QA>) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        margin:auto;
        margin-top: 50px;
    }
    table tr{
        text-align: center;
    }
    .select-area a{
        color:black;
        text-decoration: none;
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
    <div class="outer" align="center">
        <br>
        <div style="width:700px">
            <h2 align="left">1:1문의하기 </h2>
            <hr>
            <br>
            <div class="select-area" align="left">        
                    조회기간&nbsp;
                    <a href="">오늘</a>&nbsp;
                    <a href="">7일</a>&nbsp;
                    <a href="">15일</a>&nbsp;
                    <a href="">1개월</a>&nbsp;
                    <a href="">3개월</a>
                    <input type="date"> -
                    <input type="date">       
            </div>
            <br>
            <table align="center" border="1" >
                <tr>
                    <th width="100">문의날짜</th>
                    <th width="150">카테고리</th>
                    <th width="350">제목</th>
                    <th width="100">문의상태</th>
                </tr>
				<%if(list.isEmpty()){ %>
                <!--게시글 없을경우-->
                <tr>
                    <td colspan="4">
                        게시글이 존재하지 않습니다.
                    </td>
                </tr>
                <%}else{ %>
                <%for(QA q:list){ %>
                <tr>
                    <td><%=q.getEnrollDate() %></td>
                    <td>[<%=q.getfCategory() %>/<%=q.getsCategory() %>]</td>
                    <td><%=q.getqTitle() %></td>
                    <td>
                    	<%=q.getStatus() %>
                    	<%=q.getAnswerStatus() %>
                    </td>
                </tr>
				<%}} %>
            </table>
        </div>
        
    </div>
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>