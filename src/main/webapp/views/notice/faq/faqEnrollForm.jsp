<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      .outer-1{ 
        width: 800px;
        float: left;
        box-sizing: border-box;
    }
    #faq-enroll input[type=text], #faq-enroll textarea{
        width:100%;
         box-sizing: border-box;
          
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
    <%@include file="/views/common/managerHeader.jsp" %>
	<%@include file="/views/common/managerMenubar.jsp" %>

    <div class="outer-1" align="center">
        <br>
        <div style="width: 700px;">
            <br>
            <h2 align="left">FAQ 작성</h2>
            <hr>
            <form action="" method="post">
                <table id="faq-enroll" >
                    <tr>
                        <th width="120" height="50">* 제목</th>
                        <td width="480"><input type="text" value="기존제목" required></td>
                    </tr>       
                    <tr >
                        <th height="50">* 카테고리 선택</th>
                        <td>
                            <select name="category" id="">
                                <option value="">회원가입/정보</option>
                                <option value="">결제/배송</option>
                                <option value="">적립금</option>
                                <option value="">제품정보</option>
                                <option value="">기타</option>
                            </select>
                            &nbsp;<label for="best-faq">BEST FAQ</label>
                            <input type="checkbox" id="best-faq" name="best-faq" value="best-faq">
                        </td>
                    </tr>
                    <tr>
                        <th>* 내용</th>
                        <td>
                            <textarea name="content" id="" cols="30" rows="20" style="resize:none" required> 기존 내용</textarea>
                        </td>
                    </tr>
                
                </table>
                <br>
    
                <button type="submit">작성하기</button>
       
                
            </form>
        </div>
    </div>

</body>
</html>