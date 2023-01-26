<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer-1{float:left; width: 800px; box-sizing: border-box;}
    .outer-2{width: 700px;}
    .table span{color: red;}
    .table th{text-align: right;}
    .star{color: red;}
</style>
</head>
<body>
	<%@ include file="../common/managerHeader.jsp" %>
    <%@ include file="../common/managerMenubar.jsp" %>

    <div class="wrap1" align="center">
        <div class="wrap2">
            <div class="outer-1" align="center">
                <div class="outer-2">
                    <br>
                    <h3><b>상품 등록</b></h3>
                    <br><br>
                    <span class="star">*</span> 은 필수 입력사항입니다.

                    <form action="<%= contextPath %>/insert.pr" method="post">
                        <table class="table table-hover">
                            <tr>
                                <th width="30%"><span>*</span> 카테고리&nbsp;</th>
                                <td width="70%">
                                    <select name="fCate" id="fCate">
                                    	<option>- 1차 카테고리 -</option>
                                        <option id="op1" onclick="sCateShow();">우유</option>
                                        <option id="op2" onclick="sCateShow();">발효유</option>
                                        <option id="op3" onclick="sCateShow();">치즈</option>
                                        <option id="op4" onclick="sCateShow();">락토프리</option>
                                    </select>
                                    <select name="sCate" id="sCate">
                                        <option>- 2차 카테고리 -</option>
                                        <option id="ti1" style="display:none">백색시유</option>
                                        <option id="ti2" style="display:none">가공우유</option>
                                        <option id="ti3" style="display:none">멸균우유</option>
                                        <option id="ti4" style="display:none">발효유</option>
                                        <option id="ti5" style="display:none">치즈</option>
                                        <option id="ti6" style="display:none">락토프리</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>*</span> 상품명&nbsp;</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th><span>*</span> 용량&nbsp;</th>
                                <td><input type="text">&nbsp;(mL/g)</td>
                            </tr>
                            <tr>
                                <th>상품코드&nbsp;</th>
                                <td>자동으로 부여됩니다.</td>
                            </tr>
                            <tr>
                                <th>브랜드&nbsp;</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th><span>*</span> 상품 이미지&nbsp;</th>
                                <td><input type="file"></td>
                            </tr>
                            <tr>
                                <th><span>*</span> 판매가격&nbsp;</th>
                                <td><input type="number">&nbsp;원</td>
                            </tr>
                            <tr>
                                <th><span>*</span> 입고수량&nbsp;</th>
                                <td><input type="number">&nbsp;개</td>
                            </tr>
                            <tr>
                                <th><span>*</span> 상품 상세정보&nbsp;</th>
                                <td><textarea name="" id="" cols="30" rows="5" style="resize: none;"></textarea></td>
                            </tr>
                        </table>
                        <br><br>
                        
                        <div>
                            <button type="submit" class="btn btn-primary">상품 등록</button>
                        </div>
                    </form>
                </div>
                <br><br><br><br><br>
            </div>
        </div>
    </div>
    
    <script>
    	$(function(){
    		if($("#op1").is(":selected")){
    			$("#ti1").attr("style", "display:block");
    			$("#ti2").attr("style", "display:block");
    			$("#ti3").attr("style", "display:block");
    			$("#ti4").attr("style", "display:none");
    			$("#ti5").attr("style", "display:none");
    			$("#ti6").attr("style", "display:none");
    		}else if($("#op2").is(":selected")){
    			$("#ti1").attr("style", "display:none");
    			$("#ti2").attr("style", "display:none");
    			$("#ti3").attr("style", "display:none");
    			$("#ti4").attr("style", "display:block");
    			$("#ti5").attr("style", "display:none");
    			$("#ti6").attr("style", "display:none");
    		}else if($("#op3").is(":selected")){
    			$("#ti1").attr("style", "display:none");
    			$("#ti2").attr("style", "display:none");
    			$("#ti3").attr("style", "display:none");
    			$("#ti4").attr("style", "display:none");
    			$("#ti5").attr("style", "display:block");
    			$("#ti6").attr("style", "display:none");
    		}else if($("#op4").is(":selected")){
    			$("#ti1").attr("style", "display:none");
    			$("#ti2").attr("style", "display:none");
    			$("#ti3").attr("style", "display:none");
    			$("#ti4").attr("style", "display:none");
    			$("#ti5").attr("style", "display:none");
    			$("#ti6").attr("style", "display:block");
    		}else{
    			$("#ti1").attr("style", "display:none");
    			$("#ti2").attr("style", "display:none");
    			$("#ti3").attr("style", "display:none");
    			$("#ti4").attr("style", "display:none");
    			$("#ti5").attr("style", "display:none");
    			$("#ti6").attr("style", "display:none");
    		}
    	})
    </script>
    
</body>
</html>