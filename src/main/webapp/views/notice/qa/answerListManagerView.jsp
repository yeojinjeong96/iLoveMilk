<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .select-area a{
        color:black;
        text-decoration: none;
    }

    .a a{
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
    <div class="outer" align="center">
        <br>
        <div style="width:700px">
            <h2 align="left">답변 목록 조회 </h2>
            <hr>
            <br>
            
            <div class="select-area" align="left" >        
                조회기간&nbsp;
                <a href="">오늘</a>&nbsp;
                <a href="">7일</a>&nbsp;
                <a href="">15일</a>&nbsp;
                <a href="">1개월</a>&nbsp;
                <a href="">3개월</a>&nbsp;
                <input type="date"> -
                <input type="date">  
     
            </div>
            <br>
            <div class="search-area" align="left">
                <form action="" method="get">
                    <select name="search" id="search">
                        <option value="">회원아이디로검색</option>
                        <option value="">문의내용으로검색</option>
                    </select>
                    <input type="text">
                    <button type="submit">검색</button>
                </form>
            </div>
            <br>
            <table border="1" class="text-center"> 
                <tr>
                    <th width="100">완료일</th>
                    <th width="150">문의종류</th>
                    <th width="175">문의내용</th>
                    <th width="100">작성자</th>
                    <th width="175">답변내용</th>
                </tr>
                <!--데이터 없을시-->
                <tr>
                    <td colspan="5">답변 목록이 없습니다.</td>
                </tr>
                <!--데이터 있을시-->
                <tr>
                    <td>2022-01-01</td>
                    <td>[고객불만/품질불만]</td>
                    <td>문의합니다..</td>
                    <td>관리자</td>
                    <td>안녕하세요..</td>
                </tr>
            </table>
            <br>
            <div class="paging-area" >
                <button>&lt;</button>
                <button>1</button>
                <button>&gt;</button>
            </div>
    
            <div align="right" style="width:650px" class="a">
                <a href="">&lt; 미답변 목록 조회</a>
                 <br><br>
            </div>
    
        </div>
       
    </div>

</body>
</html>