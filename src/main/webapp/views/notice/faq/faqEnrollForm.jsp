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
    #faq-enroll input, #faq-enroll textarea{
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
    <div class="outer" align="center">
        <br>
        <div style="width: 700px;">
            <br>
            <h2 align="left">FAQ 작성</h2>
            <hr>
            <form action="" method="post">
                <table id="faq-enroll"  >
                    <tr>
                        <th width="120" height="50">* 제목</th>
                        <td width="500"><input type="text" placeholder="제목을 작성하세요" required></td>
                    </tr>       
                    <tr >
                        <th height="50">* 카테고리 선택</th>
                        <td>
                            <select name="category" id="" >
                                <option value="">회원가입/정보</option>
                                <option value="">결제/배송</option>
                                <option value="">적립금</option>
                                <option value="">제품정보</option>
                                <option value="">기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>* 내용</th>
                        <td>
                            <textarea name="content" id="" cols="30" rows="20" style="resize:none" placeholder="내용을 작성하세요" required></textarea>
                        </td>
                    </tr>
                
                </table>
                <br>
                <button type="submit">작성하기</button>
                <button>이전으로</button>
            </form>
        </div>
    </div>

</body>
</html>