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
        margin:auto;f
        margin-top: 50px;
    }
    .faq-list{text-align: center;}
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
        <div style="width: 700px;">
            <br>
            <h2 align="left">FAQ 관리</h2>
            <hr>
            <br>
            <form action="" method="post">
                <div class="btn-area" align="right">
                    <button type="button">FAQ 작성</button>
                    <button type="submit">선택삭제</button>
                </div>
                <br>
                </div>
                <table border="1" class="faq-list">
                    <tr>
                        <th width="30">선택</th>
                        <th width="100">글번호</th>
                        <th width="200">카테고리</th>
                        <th width="350">질문</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="delete" value=""></td>
                        <td>1</td>
                        <td>회원가입/정보</td>
                        <td>배송이 언제 되나요?</td>
                    </tr>
                </table>

            </form>
            <br>
            <div class="paging-area" >
                <button>&lt;</button>
                <button>1</button>
                <button>&gt;</button>
            </div>
            <br>
            <form action="" method="get">
                <input type="text">
                <button type="submit">검색</button>
            </form>
        
        </div>

    </div>

</body>
</html>