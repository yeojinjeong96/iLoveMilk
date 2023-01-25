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
    
    tbody>tr:hover{cursor: pointer;}
    .list-area {
        text-align: center;
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
            <h2 align="left">공지사항 관리</h2>
            <hr>
            <br>
            <form action="" method="post">
                <div class="btn-area" align="right">
                    <button type="button">공지작성</button>
                    <button type="submit">선택삭제</button>
                </div>
                <br>
                <table class="list-area" border="1" >
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th width="70">글번호</th>
                            <th width="400">제목</th>
                            <th width="100">작성자</th>
                            <th width="100">작성일</th>
                        </tr>
                    </thead>
                   
                    <tbody >
                        <!--공지사항이 없을 경우-->
                        <tr>
                            <td colspan="5">
                                공지사항이 없습니다.
                            </td>
                        </tr>
    
                        <!--공지사항이 있을 경우-->
                        <form action="" method="post">
                            <tr >
                                <td><input type="checkbox" name="delete" value=""></td>
                                <td>1</td>
                                <td>공지사항 제목</td>
                                <td>관리자</td>
                                <td>2022-01-01</td>
                            </tr>
                        
                        </form>
            
                    </tbody>
    
    
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