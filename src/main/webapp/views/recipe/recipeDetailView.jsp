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
    }

    .detail-area{
        margin-bottom: 10px;
    }

    .detail-area2{
        border-top: 3px solid gray;
        width: 700px;
        border-collapse: collapse /* 테두리 한줄로 나오도록 */
    }

    .detail-area2>thead tr{
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
    }

    .detail-area2>thead th{
        background-color: lightgray;
    }

    .detail-area2>tbody>tr{
        text-align: center;
        border: 1px solid white;
    }

    .main-image{
        width: 700px;
    }

    .main-image>img{
        width: 60%;
    }



    .ingre-area{
        text-align: center;
        width: 200px;
    }

    .order-area{
        text-align: center;
        width: 600px;
    }

    #list{
        font-weight: 700;
        color: rgb(51, 135, 253);
        border: 4px solid rgb(51, 135, 253);
        width: 30px;
    }

    .detail-image>img{
        width: 100%;
    }

    .profile-image>img{
        width: 100%;
    }

    .reply-image>img{
        width: 100%;
    }

    .detail-area , .reply-area, .reply-count, .like-report{
        width: 700px;
    }

    #num{
        font-size: 15px;
        font-weight: 700;
        color: rgb(51, 135, 253);
    }

    .reply-enroll{
        width: 700px;
    }

    .reply-enroll input {
        width: 80px;
        height: 100px;
        vertical-align: auto;
        font-size: 16px;
        font-weight: 1000;
        border-radius: 10px;
        border: 2px solid rgb(160, 160, 160);
        cursor: pointer;
        color: rgb(70, 70, 70);
    }


    #reply{
        border-color: gray;
        border: 2px solid gray;
        border-radius: 5px;
    }

</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>

	<div class="outer" align="center">
        <br>
        <table class="detail-area">
            <tr>
                <td>
                    <a href="" class="btn btn-secondary btn-sm">&lt;이전글</a>
                    <a href="" class="btn btn-secondary btn-sm">다음글&gt;</a>
                    <a href="" class="btn btn-secondary btn-sm">목록</a>
                </td>
                <td align="right">
                    <!-- 로그인한 회원이고 본인의 게시글일때만 보여지도록 -->
                    <a href="" class="btn btn-primary btn-sm">수정</a>
                    <a href="" class="btn btn-danger btn-sm">삭제</a>
                </td>
            </tr>
        </table>
        
        <table class="detail-area2"> 
            <thead>
                <tr>
                    <th width="100px">제목</th>
                    <td width="600px" colspan="3">큐브 연유 라떼 만들기</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td colspan="3">admin</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td width="150px">2023-01-03</td>
                    <th width="100px">조회수</th>
                    <td>7777</td>
                </tr>
            </thead>
            <tbody>
                <tr height="200">
                    <td colspan="4">
                        <br><br>
                        <div class="main-image">
                            <img src="resources/image/recipe1.png">
                        </div>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        내용 내용 내용 자리 내용 내용 내용 자리
                    </td>
                </tr>
            </tbody>
        </table>
        <br><br>

        <table class="ingre-area">
            <tr>
                <td colspan="2">
                    <br>
                    <h3 style="font-size: 22px;"><b>재료</b></h3>
                </td>
            </tr>
            <tr>
                <td>
                    콜드브루
                </td>
                <td>
                    300ml
                </td>
            </tr>
        </table>

        <table class="order-area">
            <tr>
                <td colspan="4">
                    <br>
                    <h3 style="font-size: 22px;"><b>조리 순서</b></h3>
                </td>
            </tr>
            <tr>
                <td width="200px">
                    <div class="detail-image">
                        <img src="resources/image/1.jpg">
                    </div>
                </td>
                <td width="50px" align="center">
                    <div id="list">1</div>
                </td>
                <td width="450px" colspan="2" align="left">
                    얼음틀(아이스 트레이)에 콜드브루 커피 300ml를 부어 냉동실에 꽁꽁 얼려요
                </td>
            </tr>
        </table>
        <br><br>
        
        <table class="like-report">
            <tr>
                <td>
                    <div id="like" align="left">
                        <button type="submit" id="btn-buy" data-target="#like-btn" data-toggle="modal" style="background: none; border: 0; color: red;">♡</button>
                        좋아요
                        0
                    </div>
                </td>
                <td>
                    <!-- 로그인한 회원만 보이도록 -->
                    <div id="report" align="right">
                        신고
                    </div>
                </td>
            </tr>
        </table>

        <div style="border-bottom: 3px solid gray; width: 700px;"></div>
        <br><br>


        <table class="reply-count">
            <tr>
                <td width="45" style="font-size:large">
                    댓글
                </td>
                <td>
                    <div id="num">1</div>
                </td>
            </tr>
        </table>

        <div style="border-bottom: 3px solid gray; width: 700px;"></div>
        <br>

        <table class="reply-area" align="center">
            <tr>
                <td width="80px" rowspan="3" align="center" style="vertical-align: top;">
                    <div class="profile-image">
                        <img src="resources/image/profile.png">
                    </div>
                </td>
                <td width="70px" height="1">user01</td>
                <td width="130px">2023.01.03 11:35</td>
                <!-- 본인의 댓글일때는 신고가 아니라 삭제라고 보여지도록 -->
                <td width="50px">신고</td>
                <td>삭제</td>
                <td width="200px" rowspan="3" colspan="2" align="center">
                    <!-- 첨부파일이 있을 경우만 뜨도록 -->
                    <div class="reply-image">
                        <img src="resources/image/1.jpg">
                    </div>
                    <br>
                </td>
            </tr>
            <tr>
                <td rowspan="3" colspan="4" style="vertical-align: top">
                    감사합니다 너무 맛있네요
                    감사합니다 너무 맛있네요
                </td>
            </tr>
        </table>

        <div style="border-bottom: 3px solid gray; width: 700px;"></div>
        <br>


        <!-- 로그인한 회원만 보여지도록 -->
        <form action="" method="post" enctype="multipart/form-data">
            <table class="reply-enroll" align="center">
                <tr>
                    <td width="200px" align="center">
                        <input type="file" name="replyFile" onchange="loadImg(this, 1);" required style="display: none;">
                        <img id="replyImg" width="200px" height="100px" onclick="clickFile(1);">
                    </td>
                    <td width="400px" align="center" style="padding-top: 5px;">
                        <textarea name="reply" style="resize: none; width: 380px; height: 100px;" required placeholder="댓글을 남겨주세요."></textarea>
                    </td>
                    <td width="100px">
                        <input type="submit" value="등록">
                    </td>
                </tr>
            </table>
        </form>

        <!-- The Modal -->
        <div class="modal" id="like-btn">
            <div class="modal-dialog">
            <div class="modal-content modal-sm">
        
                <!-- Modal body -->
                <br>
                <div class="modal-body" style="text-align:center; font-size:13px;">
                    로그인이 필요한 기능입니다. <br>
                    로그인을 해주세요.
                </div>
                <div align="center">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" style=" width:100px;">확인</button>
                    </div>
                    <br>
            </div>
            </div>
        </div>


         <!-- 이미지 미리보기 스크립트 -->
         <!-- 이미지 미리보기 스크립트 -->
         <script>
            function clickFile(num){
                    $("input[name=replyFile]").click();
                }

                function loadImg(inputFile, num){
               
                    if(inputFile.files.length == 1) {
                        const reader = new FileReader();
                        reader.readAsDataURL(inputFile.files[0]);
                        reader.onload = function(e){
                    
                            switch(num){
                                case 1: $("#replyImg").attr("src", e.target.result); break;
                            }
                        }

                    }else{
                        
                        switch(num){
                            case 1: $("#replyImg").attr("src", null); break;
                        }
                    }
                }
        </script>

    </div>
    
    <%@ include file = "../common/footer.jsp" %>

</body>
</html>