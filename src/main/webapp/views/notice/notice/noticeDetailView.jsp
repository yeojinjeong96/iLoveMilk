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
</head>
<body>
    <div class="outer" align="center">
        <br>
        <div style="width:700px">
            <h2 align="left">공지사항</h2>
            <hr>
            <br>
            <table >
                <tr>
                    <td colspan="3" width="650" style="font-size:large; font-weight:600" >제목들어오는자리~~</td>
                </tr>  
                      
                <tr>
                    <td>작성자닉네임</td>
                    <td><span style="font-weight: 600;">조회수</span> 조회수~~</td>
                    <td>작성일자~~</td>
                </tr>
                
                <tr>
                    <td colspan="3" height="500">내용자리</td>
                </tr>
            </table>
        </div>
        <a href="<%=contextPath%>/list.no">목록으로</a>
    </div>

</body>
</html>