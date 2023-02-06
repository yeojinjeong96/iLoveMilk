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
            <form action="<%=contextPath%>/insert.faq" method="post">
                <table id="faq-enroll" >
                    <tr>
                        <th width="120" height="50">* 질문</th>
                        <td width="480"><input type="text" name="question" required></td>
                    </tr>       
                    <tr >
                        <th height="50">* 카테고리 선택</th>
                        <td>
                            <select name="category" id="select-area">
                                <option>회원가입/정보</option>
                                <option>결제/배송</option>
                                <option>적립금</option>
                                <option>제품정보</option>
                                <option>기타</option>
                            </select>
                            &nbsp;<label for="best-faq">BEST FAQ</label>
                            <input type="checkbox" id="best-faq" name="best-faq" value="Y">
                        </td>
                    </tr>
                    <tr>
                        <th>* 답변</th>
                        <td>
                            <textarea name="answer"  cols="30" rows="20" style="resize:none" required></textarea>
                        </td>
                    </tr>
                
                </table>
                <br>
    
                <button type="submit"  class="btn btn-primary btn-sm">작성하기</button>
       			<button type="button" onclick="history.back();"  class="btn btn-primary btn-sm">이전으로</button>
                
            </form>
        </div>
    </div>

</body>
</html>