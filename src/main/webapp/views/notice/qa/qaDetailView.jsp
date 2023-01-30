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

  
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@include file = "../common/serviceCenterMainTop.jsp" %>
    <div class="outer"  align="center">
        <br>
        <div style="width:700px">
            <h2 align="left">나의 1:1문의 </h2>
            <hr>
            <br>
            <table border="1" class="question-area, text-center" style="width: 700px;">
                <tr >
                    <td colspan="3">[<%=q.getfCategory() %>/<%=q.getsCategory() %>]&nbsp;<%=q.getqTitle() %></td>
                             
                    <td  rowspan="2">
                    	  <%if(q.getAnswerStatus().equals("Y")){ %>
	                   	답변완료
	                   	<%}else{ %>
	                   	접수
	                   	<%} %>
                    </td>

                </tr>
                <tr>
                    <td colspan="2"><%=q.getMemberName() %></td>
              
                    <td colspan="1" ><%=q.getEnrollDate() %></td>   
                </tr>
                <tr>
                    <td colspan="5" height="200">
                        
                    	<%if(at!=null) {%>
                            <br>
                    	  <div>
                            <img src="<%=contextPath%>/<%=at.getFilePath()%><%=at.getChangeName()%>"  >
                       	  </div> 
                    	
                          
	         			<%} %>
	         			<br>
	                    <%=q.getqContent() %>
	                   </td>             
                </tr>

            </table>

            <br><br>
            <!--답변 미완료시-->
              <%if(q.getAnswerStatus().equals("N")){ %>
            <div align="center">
                <a href="">삭제</a>
                <a href="">수정</a>
                <a href="">목록</a>
            </div>
            <%}else{ %>
            <!--답변완료시-->
            <br>
            <div class="answer-area, text-center" >
                <table border="1" style="width: 700px;">
                    <tr>
                        <td colspan="2"><%=q.getaTitle() %></td>
                    
                    </tr>
                    <tr>
                        <td><%=q.getManagerName() %></td>
                        <td><%=q.getAnswerDate() %></td>
                    </tr>
                    <tr>
                        <td colspan="2" height="200"><%=q.getaContent() %></td>
            
                    </tr>
                </table>
                <br><br>

            </div>
            <%} %>
        </div>
        
    </div>
<%@include file="/views/common/footer.jsp" %>
</body>
</html>