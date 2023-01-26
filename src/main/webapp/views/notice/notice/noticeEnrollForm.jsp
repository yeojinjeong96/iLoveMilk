<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     .outer-1{
        width: 800px;
        margin:auto;
        float:left;
        box-sizing: border-box;
    }
    #notice-enroll td *{width:100%; box-sizing: border-box;}
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
            <h2 align="left">공지사항 작성</h2>
            <hr>
            <form action="<%=contextPath %>/insert.no" method="post" enctype="multipart/form-data">
            	
                <table id="notice-enroll">
                    <tr>
                        <th width="100px">* 제목</th>
                        <td width="500px"><input type="text" name="title" placeholder="제목을 작성하세요" required></td>
                    </tr>
                    <tr>
                        <th>* 내용</th>
                        <td>
                            <textarea name="content" id="" cols="30" rows="20" style="resize:none" placeholder="내용을 작성하세요" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 첨부</th>
                        <td><input type="file" name="upfile"></td>
                    </tr>
                </table>
                <br>
                <button type="submit">작성하기</button>
                <button onclick="history.back()">이전으로</button>
            </form>
        </div>
    </div>

</body>
</html>