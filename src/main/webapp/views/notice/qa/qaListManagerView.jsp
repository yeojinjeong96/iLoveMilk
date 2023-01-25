<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #q-list td{ text-align: center;}
    .a a{text-decoration: none;
    color:black}
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
    <div class="outer" align="center">
        <br>
        <div style="width:700px" class="text-center">
            <h2 align="left" >미답변 문의</h2>
            <hr>
            <br>
            <div align="right">
                <select name="select-qa" id="">
                    <option value="">최신순</option>
                    <option value="">오래된순</option>
                </select>
            </div>
            <br>
            <table border="1" id="q-list">
                <tr>
                    <th width="100">No.</th>
                    <th width="100">작성자아이디</th>
                    <th width="100">작성일</th>
                    <th width="200">문의제목</th>
                    <th width="200">문의내용</th>
                </tr>
                <tr>
                    <td colspan="5">미답변 문의가 없습니다.</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>user01</td>
                    <td>2022.01.01</td>
                    <td>문의합니다</td>
                    <td>문의내용</td>
                </tr>
            </table>
            <br> <br>
            <div class="paging-area" >
                <button>&lt;</button>
                <button>1</button>
                <button>&gt;</button>
            </div>
            <div align="right" style="width:600px" class="a">
                <a href="">> 답변 목록 조회</a>
                 <br><br>
            </div>
        </div>
        
    </div>
   
</body>
</html>