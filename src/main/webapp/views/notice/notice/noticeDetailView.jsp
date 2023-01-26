<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.milk.notice.model.vo.Notice, com.milk.notice.model.vo.Attachment" %>
<% 
	Notice n = (Notice)request.getAttribute("n");
	Attachment at = (Attachment) request.getAttribute("at");
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
</style>
</head>
<body>
    <%@include file = "../common/serviceCenterMainTop.jsp" %>
    <div class="outer" align="center">
        <br>
        <div style="width:700px">
            <h2 align="left">공지사항</h2>
            <hr>
            <br>
            <table >
                <tr height="50px">
                    <td colspan="3" width="650" style="font-size:large; font-weight:600" ><%=n.getNoticeTitle()%></td>
                </tr>  
                      
                <tr>
                    <td height="50px"><%=n.getManagerName() %></td>
                    <td><span style="font-weight: 600;">조회수</span><%=n.getCount()%></td>
                    <td><%=n.getEnrollDate() %></td>
                </tr>
                <!-- 첨부파일 있을경우 -->
                
                <%if(at != null){ %>
                <tr>
                	<td colspan="3">
                        <div>
                            <img src="<%=contextPath%>/<%=at.getFilePath()%><%=at.getChangeName()%>" >
                        </div> 
                    </td>
                </tr>
                <%} %>
                <tr>
                    <td colspan="3" height="500">
                    	<div style="height: 500px;">
                            <%=n.getNoticeContent() %>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
       <button  type="button" onclick="history.back()">이전으로</button>
    </div>
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>