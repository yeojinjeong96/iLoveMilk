<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Member m = (Member)session.getAttribute("loginMember"); %>
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
    table tr td{padding: 10px}
    .qa-form textarea{
        width: 100%;
        height: 100%;
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
        <div style="width: 700px;">
            <h2 align="left">1:1문의하기 </h2>
            <hr>
            <br>
            <form action="<%=contextPath%>/insert.qa" method="post">
            	<input type="hidden" name="userNo" value="<%=m.getMemberNo()%>">
                <table border="1" class="qa-form">
                    <tr>
                        <th width="150" class="text-center">* 말머리</th>
                        <td width="400">
                            <select name="f-category" id="" required>
                                <option value="">고객문의</option>
                                <option value="">고객제안</option>
                                <option value="">고객불만</option>
                            </select>
                            <select name="sc-category" id="" >
                                <option value="">제품/품질문의</option>
                                <option value="">홈페이지문의</option>
                                <option value="">회원탈퇴</option>
                            </select>
                            <select name="sc-category" id="" >
                                <option value="">제품제안</option>
                                <option value="">서비스제안</option>
                                <option value="">홈페이지제안</option>
                            </select>
                            <select name="sc-category" id="" >
                                <option value="">제품/품질불만</option>
                                <option value="">홈페이지불만</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">* 제목</th>
                        <td><input type="text" name="title" style="width: 300px;"></td>
                    </tr>
                    <tr>
                        <th class="text-center">작성자</th>
                        <td><%=m.getMemberName() %></td>
                    </tr>
                    <tr>
                        <th class="text-center">첨부파일</th>
                        <td><input type="file" name="upfile"></td>
                    </tr>
                    <tr>
                        <th class="text-center">* 내용</th>
                        <td><textarea name="content" cols="30" rows="12" style="resize: none;" required>내용자리~</textarea></td>
                    </tr>
                    
                </table>
                <br>
                <a href="">목록으로</a>
                <button type="submit">작성하기</button>
            </form>
        </div>
    </div>
    
    <%@include file="/views/common/footer.jsp" %>
</body>
</html>