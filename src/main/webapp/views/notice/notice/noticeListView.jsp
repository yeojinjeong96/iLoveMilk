<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div id="outer" align="center">
        <br>
        <div style="width: 700px;">
            <table id="notice-list" border="1" class="text-center">
                <tr>
                    <th width="50">번호</th>
                    <th width="350">제목</th>
                    <th width="100">작성일</th>
                    <th width="100">작성자</th>
                    <th width="100">조회</th>
                </tr>
                <!--공지사항 없을경우-->
                <tr>
                    <td colspan="5">공지사항이 없습니다.</td>
                </tr>
                <!--공지사항 있을경우-->
                <tr>
                    <td>1</td>
                    <td>제목자리</td>
                    <td>2022.02.01</td>
                    <td>관리자</td>
                    <td>12</td>
                </tr>
            </table>
            <br>
            <div class="paging-area" >
                <button>&lt;</button>
                <button>1</button>
                <button>&gt;</button>
            </div>

        </div>

    </div>


</body>
</html>