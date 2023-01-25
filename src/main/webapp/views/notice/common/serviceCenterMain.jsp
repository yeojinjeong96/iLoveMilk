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
    #category a{
        color: black;
        text-decoration: none;
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

   

       
        <div class="outer" align="center" >
            <br>
            <div style="width: 700px;">
                <form action="">
                    <input type="text" name="search"><button type="submit">검색</button>
                </form>
                <br>
                <h2 align="left">BEST FAQ</h2>
                <br>
                <p align="left" id="category">
                    <a href="">전체</a>&nbsp;
                    <a href="">회원가입/정보</a>&nbsp;
                    <a href="">결제/배송</a>&nbsp;
                    <a href="">적립금</a>&nbsp;
                    <a href="">제품정보</a>&nbsp;
                    <a href="">기타</a>&nbsp;
                </p>
    
                <table  border="1" style="text-align:center" class="content-area">
                    <tr>
                        <th width="100">No.</th>
                        <th width="100">분류</th>
                        <th width="500">내용</th>
                    </tr>
                    <!--내용이 있을 경우-->
                    <tr>
                        <td>글번호</td>
                        <td>제품정보</td>
                        <td>우유의 내용이 흰색인 이유는 무엇인가요?</td>
                    </tr>
                    <!--내용이 없을 경우-->
                    <tr>
                        <td colspan="3">표시할 목록이 없습니다.</td>
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