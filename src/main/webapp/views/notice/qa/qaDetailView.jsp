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
  
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="outer"  align="center">
        <br>
        <div style="width:700px">
            <h2 align="left">나의 1:1문의 </h2>
            <hr>
            <br>
            <table border="1" class="question-area, text-center" width="700">
                <tr >
                    <td colspan="3">[고객불만/제품불만]</td>
                    <td>문의사항 제목 들어오는 영역</td>              
                    <td  rowspan="2">접수</td>

                </tr>
                <tr>
                    <td>작성자명</td>
                    <td>조회수 5</td>
                    <td colspan="2" >2022.01.23 00:07:01</td>   
                </tr>
                <tr>
                    <td colspan="5" height="200">문의사항 내용 들어오는 영역</td>             
                </tr>

            </table>

            <br><br>
            <!--답변 미완료시-->
            <div align="center">
                <a href="">삭제</a>
                <a href="">수정</a>
                <a href="">목록</a>
            </div>
            <!--답변완료시-->
            <br>
            <div class="answer-area, text-center" >
                <table border="1" width="700">
                    <tr>
                        <td colspan="2">답변제목 들어오는자리</td>
                    
                    </tr>
                    <tr>
                        <td>관리자</td>
                        <td>2022.01.12 00:07:01</td>
                    </tr>
                    <tr>
                        <td colspan="2" height="200">내용자리!!</td>
            
                    </tr>
                </table>
                <br><br>

            </div>
        </div>
        
    </div>

</body>
</html>