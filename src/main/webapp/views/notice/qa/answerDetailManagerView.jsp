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
        margin:auto;
        margin-top: 50px;
    }
    .answer-form input, .answer-form textarea{
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
    <div class="outer" align="center">
        <br>
        <div style="width:700px">
            <h2 align="left">답변 완료 목록 조회 </h2>
            <hr>
            <br>
            
            <table  width="700px" border="1" class="text-center">
                <tr>
                    <th>제목</th>
                    <td>제목내용!!~~~~</td>
                    <th>작성자명</th>
                    <td>정여진</td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>[고객불만/제품/품질불만]</td>
                    <th>작성일자</th>
                    <td>2022.02.02 00:00:00</td>
                    
                </tr>
                <tr>
                    <th>문의내용</th>
                </tr>
                <tr height="300px">
                    <td colspan="4">문의내용!</td>
                </tr>
            </table>
            <br>
            <hr>
    
            <br>
                <table  width="700px" border="1" class="text-center">
                    <tr>
                        <th>제목</th>
                        <td>제목내용!!~~~~</td>
                        <th>작성자</th>
                        <td>정여진</td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>[고객불만/제품/품질불만]</td>
                        <th>작성일자</th>
                        <td>2022.02.02 00:00:00</td>
                        
                    </tr>
                    <tr>
                        <th>답변 내용</th>
                    </tr>
                    <tr height="300px">
                        <td colspan="4">문의내용!</td>
                    </tr>
                </table>
                <br>
                <button type="button">목록으로</button>

        </div>
       
    </div>

</body>
</html>