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

                    <form action="" method="post">
                        <table class="table table-hover">
                            <tr>
                                <th width="30%"><span>*</span> 카테고리&nbsp;</th>
                                <td width="70%">
                                    <select name="" id="">
                                        <option value="">1차카테고리?</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">2차카테고리?</option>
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
</body>
</html>