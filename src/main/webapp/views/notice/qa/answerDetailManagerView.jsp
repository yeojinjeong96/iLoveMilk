<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.milk.notice.model.vo.QA, com.milk.notice.model.vo.Attachment" %>
<% 
	QA q= (QA)request.getAttribute("q");
	Attachment at = (Attachment)request.getAttribute("at");
%>
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
    .answer-form input, .answer-form textarea{
        width:100%;
    }
    .a a{text-decoration: none;
    color:black}
    .content-area{
        text-align: left;
        height: 100%;
        padding: 10px;

    }
    .outer-1{
        width: 800px;
        box-sizing: border-box;
        float: left;
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
	<%@include file="/views/common/managerHeader.jsp" %>
	<%@include file="/views/common/managerMenubar.jsp" %>
    <div class="outer-1" align="center">
        <br>
        <div style="width:700px">
            <h2 align="left">답변 완료 목록 조회 </h2>
            <hr>
            <br>
            
            <table  width="700px" border="1" class="text-center">
                <tr>
                    <th>제목</th>
                    <td><%=q.getqTitle() %></td>
                    <th>작성자명</th>
                    <td><%=q.getMemberName()%></td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>[<%=q.getfCategory() %>/<%=q.getsCategory()%>]</td>
                    <th>작성일자</th>
                    <td><%=q.getEnrollDate()%></td>
                    
                </tr>
                <tr>
                    <th colspan="4">문의내용</th>
                </tr>
                <tr >
                    <td colspan="4" height="300px">
                    	<div class="content-area">
                            <%=q.getqContent()%>
                        </div>
                    </td>
                </tr>
            </table>
            <br>
            <hr>
    
            <br>
                <table  width="700px" border="1" class="text-center">
                    <tr>
                        <th>제목</th>
                        <td><%=q.getaTitle() %></td>
                        <th>작성자</th>
                        <td><%=q.getManagerName() %></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>[<%=q.getfCategory() %>/<%=q.getsCategory()%>]</td>
                        <th>작성일자</th>
                        <td><%=q.getAnswerDate() %></td>
                        
                    </tr>
                    <tr>
                        <th colspan="4">답변 내용</th>
                    </tr>
                    <tr >
                        <td colspan="4" height="300px">
                        	<div class="content-area">
                                <%if(at!=null) {%>
                                    <br>
                                  <div>
                                    <img src="<%=contextPath%>/<%=at.getFilePath()%><%=at.getChangeName()%>" >
                                  </div> 
                                  <%} %>
                            <%=q.getaContent()%>
                        	</div>
                        </td>
                    </tr>
                </table>
                <br>
                <button type="button" >목록으로</button>

        </div>
       
    </div>

</body>
</html>