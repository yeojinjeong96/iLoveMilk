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
    <div class="outer" align="center">
        <br>
        <div style="width: 700px;">
            <br>
            <h2 align="left">공지사항 조회</h2>
            <hr>
            <form action="" method="post">
                <table id="notice-update">
                    <tr>
                        <th width="100px">* 제목</th>
                        <td width="500px"><input type="text" placeholder="제목을 작성하세요" value="기존공지사항제목" required></td>
                    </tr>
                    <tr>
                        <th>* 내용</th>
                        <td>
                            <textarea name="content" id="" cols="30" rows="20" style="resize:none" placeholder="내용을 작성하세요" required>기존공지사항내용</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 첨부</th>
                        <td><input type="file"></td>
                    </tr>
                </table>
                <br>
                <button>이전으로</button>
                <button type="submit">수정하기</button>
                <button type="button">삭제하기</button>
            </form>
        </div>
    </div>

</body>
</html>