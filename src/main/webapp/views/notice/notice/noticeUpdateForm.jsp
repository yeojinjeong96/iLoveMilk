<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.milk.notice.model.vo.Notice, com.milk.notice.model.vo.Attachment"%>
<% 
	Notice n = (Notice)request.getAttribute("n");
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
        float: left;
        box-sizing: border-box;
    }
    #notice-update td *{width:100%; box-sizing: border-box;}
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
        <div style="width: 700px;">
            <br>
            <h2 align="left">공지사항 수정</h2>
            <hr>
            <form action="<%=contextPath %>/update.no" method="post" enctype="multipart/form-data">
                <input type="hidden" name="noticeNo" value="<%=n.getNoticeNo() %>">
                <table id="notice-update">
                    
                    <tr>
                        <th width="100px">* 제목</th>
                        <td width="500px"><input type="text" name="title" value="<%=n.getNoticeTitle() %>" required></td>
                    </tr>
                    <tr>
                        <th>* 내용</th>
                        <td>
                            <textarea name="content" id="" cols="30" rows="20" style="resize:none" placeholder="내용을 작성하세요" required><%=n.getNoticeContent() %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 첨부</th>
                        <td>
	                        <%if(at !=null){ %>
	                        <!--기존의 첨부파일이 있었을 경우-->
	                        <%=at.getChangeName()%>
	                        <input type="hidden" name="originFileNo" value="<%=at.getFileNo()%>">
	                        <%}%>
	                        <!--첨부파일이 없었을 경우-->
	                        <input type="file" name="upfile" >
                        </td>
                    </tr>
                </table>
                <br>
                <button type="submit">수정하기</button>
                <button type="reset">초기화</button>
                <button type="button">삭제하기</button>
            </form>
        </div>
    </div>
  
</body>
</html>