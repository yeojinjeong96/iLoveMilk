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
    .outer-1{
        width: 800px;
        box-sizing: border-box;
        float: left;
    }
    #answer-form td *{
        width:100%;
    }
    .a a{text-decoration: none;
    color:black}
    
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
            <h2 align="left">미답변 문의 </h2>
            <hr>
            <br>
            <table  width="700px" border="1" class="text-center">
                <tr>
                    <th>제목</th>
                    <td><%=q.getqTitle() %></td>
                    <th>작성자명</th>
                    <td><%=q.getMemberName() %></td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>[<%=q.getfCategory() %>/<%=q.getsCategory() %>]</td>
                    <th>작성일자</th>
                    <td><%=q.getEnrollDate() %></td>
                    
                </tr>
                <%if(at!=null) {%>
                <tr>
                	<th>
                	첨부파일
                	</th>
                	<td colspan="3">
                		
                    	  <div>
                           <a download="<%=at.getChangeName() %>"href="<%=contextPath %>/<%=at.getFilePath() %><%=at.getChangeName() %>"><%=at.getChangeName() %></a>
                       	  </div> 
	         			
                	</td>
                </tr>
                <%} %>
                <tr>
                    <th colspan="4">문의내용</th>
                </tr>
                <tr height="">
                    <td colspan="4">
                        <div style="text-align: left; padding: 12px;">
                            <%=q.getqContent() %>
                    	
                        </div>
                    </td>
                </tr>
            </table>
            <br>
            <button type="button" onclick="showForm();">답변하기</button>
            <br>
            <br>
                <form action="<%=contextPath%>/enroll.a" id="answer-form" style="display: none;">
                    <input type="hidden" name="qNo" value="<%=q.getqNo()%>">
                    <table id="answer-form">
                        <tr>
                            <th width="50">제목</th>
                            <td width="650"><input type="text" name="title" placeholder="제목을 입력하세요" required></td>
                        </tr>
                        <tr>
                            <th>내용 </th>
                            <td>
                                <textarea name="content" cols="30" rows="10" placeholder="내용을 입력하세요" style="resize:none" required></textarea>
                            </td>
                        </tr>

                    </table>
                    <br>
                    <button type="submit">답변완료</button>
                </form>
                <br>
                <div align="right" style="width:700px" class="a">
                    <a href="<%=contextPath%>/listM.a?cpage=1">> 답변 목록 조회</a>
                    <br><br>
                </div>
        </div>
        
    </div>
    <script>    
       function showForm(){

        $("#answer-form").attr("style","display:block");

       }
    </script>

</body>
</html>