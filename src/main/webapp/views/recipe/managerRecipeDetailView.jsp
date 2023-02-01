<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.milk.recipe.model.vo.*" %>
<%
	Recipe r = (Recipe)request.getAttribute("r");
	ArrayList<RecipeIngre> listI = (ArrayList<RecipeIngre>)request.getAttribute("listI");
	ArrayList<RecipeOrder> listO = (ArrayList<RecipeOrder>)request.getAttribute("listO");
%>
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
        border-top: 3px solid gray;
        width: 700px;
        border-collapse: collapse /* 테두리 한줄로 나오도록 */
    }

    .detail-area>thead tr{
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
    }

    .detail-area>thead th{
        background-color: lightgray;
    }

    .detail-area>tbody>tr{
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

    .reply-enroll button {
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

	<%@include file="/views/common/managerHeader.jsp" %>
	<%@include file="/views/common/managerMenubar.jsp" %>

	<div class="outer" align="center">
        <br>
        <a href="<%= contextPath %>/updateM.re?no<%= r.getRecipeNo() %>" class="btn btn-secondary btn-sm" width="700px" style="margin-left: 650px">수정</a>
        
        <br><br>
        <table class="detail-area"> 
            <thead>
                <tr>
                    <th width="100px">제목</th>
                    <td width="600px" colspan="3"><%= r.getRecipeTitle() %></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td colspan="3"><%= r.getRecipeWriter() %></td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td width="150px"><%= r.getEnrollDate() %></td>
                    <th width="100px">조회수</th>
                    <td><%= r.getCount() %></td>
                </tr>
            </thead>
            <tbody>
                <tr height="200">
                    <td colspan="4">
                        <br><br>
                        <div class="main-image">
                            <img src="<%= contextPath %>/<%= r.getMainImg() %>">
                        </div>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <%= r.getRecipeIntro() %>
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
            <% for(RecipeIngre ri : listI) { %>
	            <tr>
	                <td>
	                    <%= ri.getIngreName() %>
	                </td>
	                <td>
	                    <%= ri.getIngreAmount() %>
	                </td>
	            </tr>
            <% } %>
        </table>

        <table class="order-area">
            <tr>
                <td colspan="4">
                    <br>
                    <h3 style="font-size: 22px;"><b>조리 순서</b></h3>
                </td>
            </tr>
            <% for(RecipeOrder ro : listO) { %>
            <tr>
                <td width="200px">
                    <div class="detail-image">
                        <img src="<%= contextPath %>/<%= ro.getRecipeImg() %>">
                    </div>
                </td>
                <td width="50px" align="center">
                    <div id="list"><%= ro.getRecipeOrder() %></div>
                </td>
                <td width="450px" colspan="2" align="left">
                    <%= ro.getRecipeExplain() %>
                </td>
            </tr>
            <% } %>
        </table>
        <br><br>
        
        <div width="700px" align="left" style="margin-left: 250px;">
        <table class="like-report">
            <tr>
                <td>
                    <div id="like" align="left">
                        <button type="submit" id="btn-buy" data-target="#like-btn" data-toggle="modal" style="background: none; border: 0; color: red;">♡</button>
                        좋아요
                        0
                    </div>
                </td>
            </tr>
        </table>

        <div style="border-bottom: 3px solid gray; width: 700px;"></div>
        <br>

		<a href="<%= contextPath %>/upDelM.re?cpage=1" class="btn btn-primary btn-sm" width="700px" style="margin-left: 350px">이전으로</a>
		
		

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

</body>
</html>