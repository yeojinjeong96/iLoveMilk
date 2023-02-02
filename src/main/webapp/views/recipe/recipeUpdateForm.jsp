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

    .title-area{
        width: 700px;
        height: 50px;
    }

    .title-area h5{
        color: rgb(51, 135, 253);
    }

    .enroll-area table{
        width: 700px;
        border: 1px solid gray;
        padding: 10px;
    }


    .enroll-area input{
        height: 25px;
        border: 2px solid;
        border-color: gray;
        border-radius: 5px;
    }

    #content{
        width: 97%;
        height: 130px;
        resize: none;
        border: 2px solid;
        border-color: gray;
        border-radius: 5px;
    }


    .enroll-area b{
        margin-left: 10px;
        font-size: 17px;
    }


    #addOrder textarea{
        width: 98%;
        height: 90px;
        resize: none;
        border: 2px solid;
        border-color: gray;
        border-radius: 5px;
    }
      
    #addOrder>tbody>tr div{
        font-size: 18px;
        font-weight: 700;
        color: rgb(51, 135, 253);
    }
    

    .delete {opacity:0; transition:0.5s;}

    #addIngre>tbody>tr:hover .delete{
        opacity: 1;
        margin-top: 5px;
        width: 30px;
    }

    #addOrder>tbody>tr:hover .delete{
        opacity: 1;
        margin-top: 15px;
        width: 30px;
    }


    /* 이미지 미리보기 스타일 */
    .upload-btn {
        border: 1px solid rgb(160, 160, 160);
        background: rgb(160, 160, 160);
        color: white;
        font-size: 13px;
        font-weight: 600;
        padding: 5px 10px;
        display: inline-block;
        cursor: pointer;
    }

    .upload-btn input[type=file] {
        display: none;
    }

</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>
	
	<div class="outer" align="center">
        <br>

            <table class="title-area">
                <tr>
                    <td width="120px">
                        <h5><b>레시피 수정</b></h5>
                    </td>
                    <td width="580px">
                        모든 항목을 입력하세요.
                    </td>
                </tr>
            </table>

            <div style="border-bottom: 3px solid gray; width: 700px; margin-top: -15px;"></div>
            <br>

        <form action="<%= contextPath %>/update.re" method="post" enctype="multipart/form-data">
			<input type="hidden" name="no" value="<%= r.getRecipeNo() %>">
            <div class="enroll-area">
                <table>
                    <tr >
                        <td width="120px">
                            <b>* 레시피 제목</b>
                        </td>
                        <td width="380px">
                            <input type="text" name="title" size="42" placeholder="레시피 제목을 입력해주세요." value="<%= r.getRecipeTitle() %>" required>
                        </td>
                        <td rowspan="2" width="200px" align="center" style="padding: 12px 5px; ">
                            <img id="titleImg" src="<%= contextPath %>/<%= r.getMainImg() %>" width="170px" height="230px" style="border-radius: 5px;">
                            <br>
                            <label for="file1" class="upload-btn" style="margin-top: 15px;">
                            <input type="hidden" name="mainFile" value="<%= r.getMainImg() %>">
                                <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);">
                                <span>대표 이미지 등록</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>* 레시피 소개</b>
                        </td>
                        <td>
                            <textarea name="content" id="content" placeholder="요리를 소개해주세요." required><%= r.getRecipeIntro() %></textarea>
                        </td>
                    </tr>
                </table>
                <br>

                <table id="addIngre">
                    <thead>
                        <tr>
                            <td colspan="4">
                                <b>* 재료</b>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="padding-left: 10px;">
                                필요한 재료를 적어주세요.
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                    <% int num = 1; %>
                    <% for(RecipeIngre ri : listI) { %>
                    <input type="hidden" name="ingreNo" value="<%= ri.getIngreNo() %>">
                        <tr>
                            <td width="220px" style="padding-left: 10px;">
                                <br>
                                <input type="hidden" name="ingreNo" value="<%= ri.getIngreNo() %>">
                                <input type="text" name="ingre-name<%= num %>" size="20" style="margin-bottom: 20px;" placeholder="예) 우유" value="<%= ri.getIngreName() %>" required>
                            </td>
                            <td colspan="2" width="220px">
                                <br>
                                <input type="text" name="ingre-amount<%= num++ %>" size="20" style="margin-bottom: 20px;" placeholder="예) 300ml" value="<%= ri.getIngreAmount() %>" required>
                            </td>
                            <td width="260px">
                                <button type="button" class="delete btn btn-dark btn-sm" onclick="remove(this); renumber();">x</button>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2" align="center">
                                <br>
                                <input type="button" value="+ 재료 추가" style="background:none; border: 0;" onclick="rowAdd1();">
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <br>
                
                <table id="addOrder">
                    <thead>
                        <tr>
                            <td colspan="4">
                                <b>* 요리 순서</b>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="padding-left: 10px;">
                                요리 순서를 사진과 함께 빠짐없이 적어주세요.
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                    <% int num2 = 1; %>
                    <% for(RecipeOrder ro : listO) { %>
                        <tr>
                            <td width="70px" align="center">
                                <div id="num<%= num2 %>" >step <%= ro.getRecipeOrder() %></div>
                            </td>
                            <td width="375px">
                                <br>
                                <input type="hidden" name="orderNo" value="<%= ro.getRecipeOrderNo() %>">
                                <textarea name="order<%= num2 %>" placeholder="예) 얼음틀에 콜드브루 커피 300ml를 부어 냉동실에 꽁꽁 얼려요" required><%= ro.getRecipeExplain() %></textarea>
                            </td>
                            <td width="200px" style="padding-right: 10px;">
                                <br>
                                <input type="hidden" name="orderFile<%= num2 %>" value="<%= ro.getRecipeImg() %>">
                                <input type="file" name="file<%= (num2)+1 %>" onchange="loadImg(this, <%= (num2)+1 %>);" style="display: none;">
                                <img id="contentImg<%= num2 %>" width="200px" height="100px" src="<%= contextPath %>/<%= ro.getRecipeImg() %>" onclick="clickFile(<%= num2++ +1 %>);">
                            </td>
                            <td style="padding-right: 10px;">
                                <button type='button' class='delete btn btn-dark btn-sm orderRemove' onclick='remove(this); renumber();'>x</button>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" align="center">
                                <br>
                                <input type="button" value="+ 순서 추가" onclick="rowAdd2();" style="background:none; border: 0;">
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <br>

                <table style="font-size: 14px;">
                    <tr>
                        <td width="350px" align="center" style="padding: 10px;">
                            <button type="reset" class="btn btn-secondary btn-sm" data-target="#reset" data-toggle="modal" class="btn btn-outline-primary">취소</button>
                        </td>
                        <td width="350px" align="center">
                            <button type="submit" class="btn btn-primary btn-sm" data-target="#update" data-toggle="modal" class="btn btn-outline-primary">수정</button>
                        </td>
                    </tr>
                </table>
            </div>


            <!-- 등록 취소 모달 -->
            <div class="modal" id="modal-reset">
                <div class="modal-dialog">
                    <div class="modal-content modal-sm">
                
                        <!-- Modal body -->
                        <br>
                        <div class="modal-body" style="text-align:center; font-size:13px;">
                            정말 취소하시겠습니까?
                        </div>
                        <div align="center">
                            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" style=" width:100px;">취소</button>
                            <button type="button" class="btn btn-outline-primary btn-sm" data-dismiss="modal" style=" width:100px;">확인</button>
                        </div>
                        <br>
                    </div>
                </div>
            </div>


            <script>
                function clickFile(num){
                    $("input[name=file" + num + "]").click();
                }
    
                function loadImg(inputFile, num){
                        
                    if(inputFile.files.length == 1) {
                         
                        const reader = new FileReader();
                            
                        reader.readAsDataURL(inputFile.files[0]);
                         
                        reader.onload = function(e){
                                
                            switch(num){
                                case 1: $("#titleImg").attr("src", e.target.result); break;
                                case 2: $("#contentImg1").attr("src", e.target.result); break;
                                case 3: $("#contentImg2").attr("src", e.target.result); break;
                                case 4: $("#contentImg3").attr("src", e.target.result); break;
                                case 5: $("#contentImg4").attr("src", e.target.result); break;
                                case 6: $("#contentImg5").attr("src", e.target.result); break;
                                case 7: $("#contentImg6").attr("src", e.target.result); break;
                                case 8: $("#contentImg7").attr("src", e.target.result); break;
                                case 9: $("#contentImg8").attr("src", e.target.result); break;
                                case 10: $("#contentImg9").attr("src", e.target.result); break;
                                case 11: $("#contentImg10").attr("src", e.target.result); break;
                            }
                        }
    
                    }else{
    
                        switch(num){
                            case 1: $("#titleImg").attr("src", null); break;
                            case 2: $("#contentImg1").attr("src", null); break;
                            case 3: $("#contentImg2").attr("src", null); break;
                            case 4: $("#contentImg3").attr("src", null); break;
                            case 5: $("#contentImg4").attr("src", null); break;
                            case 6: $("#contentImg5").attr("src", null); break;
                            case 7: $("#contentImg6").attr("src", null); break;
                            case 8: $("#contentImg7").attr("src", null); break;
                            case 9: $("#contentImg8").attr("src", null); break;
                            case 10: $("#contentImg9").attr("src", null); break;
                            case 11: $("#contentImg10").attr("src", null); break;
                        }
                    }
                }
            </script>
    
    
            <script>

	            function rowAdd1(){
	
	                var newRowIngre = $("#addIngre tbody>tr").length;
	                
	                if(newRowIngre < 10){
	                    var innerHtmlI = "";
	                    innerHtmlI += "<tr>";
	                    innerHtmlI +=    "<td width='220px' style='padding-left: 10px;'><br>";
	                    innerHtmlI +=        "<input type='text' name='ingre-name" + (newRowIngre+1) + "' size='20' style='margin-bottom: 20px;' placeholder='예) 우유' required>";       
	                    innerHtmlI +=    "</td>";
	                    innerHtmlI +=    "<td colspan='2' width='220px'><br>";
	                    innerHtmlI +=        "<input type='text' name='ingre-amount" + (newRowIngre+1) +  "' size='20' style='margin-bottom: 20px;' placeholder='예) 300ml' required>";   
	                    innerHtmlI +=    "</td>";          
	                    innerHtmlI +=    "<td width='260px'>";
	                    innerHtmlI +=       "<button type='button' class='delete btn btn-dark btn-sm' onclick='remove(this); renumber();'>x</button>";
	                    innerHtmlI +=    "</td>";
	                    innerHtmlI += "</tr>";
	                        
	                    $("#addIngre > tbody:last").append(innerHtmlI);
	
	                }else{
	                    alert("최대 10개까지만 가능합니다.");
	                    return false;
	                }
	            }
    
                
                // 요리 순서
                function rowAdd2(){
                    
                    var newRowOrder = $("#addOrder tbody>tr").length;
            
                    if(newRowOrder < 10){
                        
                        var innerHtml = "";
                        innerHtml += "<tr>";
                        innerHtml +=    "<td width='70px' align='center'>";
                        innerHtml +=        "<div id='num" + (newRowOrder+1) + "'>step " + (newRowOrder+1) + "</div>";
                        innerHtml +=    "</td>";
                        innerHtml +=    "<td width='375px'><br>";
                        innerHtml +=        "<textarea name='order" + (newRowOrder+1) + "' placeholder='예) 얼음틀에 콜드브루 커피 300ml를 부어 냉동실에 꽁꽁 얼려요' required></textarea><br>";
                        innerHtml +=    "</td>";
                        innerHtml +=    "<td width='200px' style='padding-right: 10px;'><br>";
                        innerHtml +=        "<input type='file' name='file" + (newRowOrder+2) + "' onchange='loadImg(this, " + (newRowOrder+2) + ");' style='display: none;' required>";
                        innerHtml +=        "<img id='contentImg" + (newRowOrder+1) + "' width='200px' height='100px' onclick='clickFile(" + (newRowOrder+2) + ");'>";
                        innerHtml +=    "</td>";
                        innerHtml +=    "<td style='padding-right: 10px;'>";
                        innerHtml +=        "<button type='button' class='delete btn btn-dark btn-sm' id='orderRemove' onclick='remove(this); renumber();'>x</button>";
                        innerHtml +=    "</td>";     
                        innerHtml += "</tr>";
             
    
                        $("#addOrder > tbody:last").append(innerHtml);
                        
                    }else{

                        alert("최대 10개까지만 가능합니다.");
                        return false;
                    }
                    
                }
    
    
                // 순서/재료 삭제
                function remove(This){
                    
                    // closet:현재 엘리멘트에서 가장 가까운 조상을 반환 // 자식 요소의 전체 개수
                    if(This.closest("tbody").childElementCount != 1){
                        This.closest("tr").remove();
                    }                
                    
    
                }
    

                // 삭제시 숫자 재지정
                function renumber(){
                 
                    // step1~10 재지정
                    var i = 1;
                    $("div[id^=num]").each(function() {
                       
                        $(this).html("step " + i);
                        i++;
    
                    });
    
                    // 대표이미지+순서이미지 name / onchange명 재지정
                    var f = 2;
                    $("#addOrder input[name^=file]").each(function(){
                        
                        $(this).attr("name", "file" + f);
    
                        $(this).attr("onchange", "loadImg(this, " + f + ");")
                        f++;
                    });
    

                    // 순서 이미지 id / onclick명 재지정
                    var con = 1;
                    var click = 2;
                    $("#addOrder img[id^=contentImg]").each(function(){
    
                        $(this).attr("id", "contentImg" + con);
                        con++;                
    
                        $(this).attr("onclick", "clickFile(" + click + ");");
                        click++;
    
                    });

                    // 재료명 name 재지정
                    var ingreN = 1;
                    $("input[name^=ingre-name]").each(function() {
                       
                        $(this).attr("name", "ingre-name" + ingreN);
                        ingreN++;
    
                    });

                    // 재료양 name 재지정
                    var ingreA = 1;
                    $("input[name^=ingre-amount]").each(function() {
                       
                        $(this).attr("name", "ingre-amount" + ingreA);
                        ingreA++;
   
                   });

                   // 순서 내용 name 재지정
                   var o = 1;
                   $("textarea[name^=order]").each(function(){
                        $(this).attr("name", "order" + o);
                        o++;
                   });
                }

            </script>

        </form>
        
    </div>
    
    <%@ include file = "../common/footer.jsp" %>

</body>
</html>