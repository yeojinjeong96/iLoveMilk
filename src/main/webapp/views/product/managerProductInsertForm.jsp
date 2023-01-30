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

                    <form action="<%= contextPath %>/insert.pr" method="post" enctype="multipart/form-data">
                        <table class="table table-hover">
                            <tr>
                                <th width="30%"><span>*</span> 카테고리&nbsp;</th>
                                <td width="70%">
                                    <select onchange="sCateShow();" name="fCate" id="fCate">
                                    	<option>- 1차 카테고리 -</option>
                                        <option>우유</option>
                                        <option>발효유</option>
                                        <option>치즈</option>
                                        <option>락토프리</option>
                                    </select>
                                    <select name="sCate" id="sCate">
                                        <option class="ti0">- 2차 카테고리 -</option>
                                        <option class="ti1" style="display:none">백색시유</option>
                                        <option class="ti1" style="display:none">가공우유</option>
                                        <option class="ti1" style="display:none">멸균우유</option>
                                        <option class="ti2" style="display:none">발효유</option>
                                        <option class="ti3" style="display:none">치즈</option>
                                        <option class="ti4" style="display:none">락토프리</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>*</span> 상품명&nbsp;</th>
                                <td><input type="text" name="productName" required></td>
                            </tr>
                            <tr>
                                <th><span>*</span> 용량&nbsp;</th>
                                <td><input type="number" name="capacity" required>&nbsp;(mL/g)</td>
                            </tr>
                            <tr>
                                <th>상품코드&nbsp;</th>
                                <td>자동으로 부여됩니다.</td>
                            </tr>
                            <tr>
                                <th>브랜드&nbsp;</th>
                                <td><input type="text" name="brand"></td>
                            </tr>
                            <tr>
                                <th><span>*</span> 상품 이미지&nbsp;</th>
                                <td><input type="file" name="productImg" required></td>
                            </tr>
                            <tr>
                                <th><span>*</span> 판매가격&nbsp;</th>
                                <td><input type="number" name="price" required>&nbsp;원</td>
                            </tr>
                            <tr>
                                <th><span>*</span> 입고수량&nbsp;</th>
                                <td><input type="number" name="stock" required>&nbsp;개</td>
                            </tr>
                            <tr>
                                <th><span>*</span> 상품 상세정보&nbsp;</th>
                                <td><textarea name="productInfo" cols="30" rows="5" style="resize: none;" required></textarea></td>
                            </tr>
                        </table>
                        <br><br>
                        
                        <div>
                            <button onclick="return cateNeed();" type="submit" class="btn btn-primary">상품 등록</button>
                        </div>
                    </form>
                </div>
                <br><br><br><br><br>
            </div>
        </div>
    </div>
    
    <script>
   		function cateNeed(){
    		// 1차, 2차 카테고리 미선택시 alert창 띄우기
    		if($("#fCate").val() == "- 1차 카테고리 -" || $("#sCate").val() == "- 2차 카테고리 -"){
    			alert("카테고리를 입력하세요.");
    			return false;
    		}else{
    			// 매니저 비밀번호 체크
    			
    			//1
    			if(<%= loginManager.getManagerPwd() %> != prompt('비밀번호를 입력하세요.')){
    				alert('비밀번호가 틀렸습니다.');
					return false;
    			}
				//2
    			let pwd = prompt('비밀번호를 입력하세요.');
    			if(loginManager.getManagerPwd() != pwd){
    				alert('비밀번호가 틀렸습니다.');
						return false;
    			}
    			//3
    			$.ajax({
       				url:"<%= contextPath %>/pwdCheck.ma",
       				data:{
       					pwd:prompt('비밀번호를 입력하세요.')
       				},
       				type:"post",
       				success:function(result){
       					//console.log(result);
       	    			if(result == '실패'){
       						alert('비밀번호가 틀렸습니다.');
       						return false;
       					}else{
       						return true;
       					}
       				},
       				error:function(){
       					console.log("비밀번호 체크용 ajax통신 실패");
       				}
       			})
    		}
    	}
   		
    	// 1차 카테고리 선택에 따른 2차 카테고리 옵션리스트 변경
    	function sCateShow(){
			$(".ti0").prop("selected", true);
			
    		if($("select[name=fCate] option:selected").text() == "우유"){
    			$(".ti1").each(function(){
    				$(this).attr("style", "display:block");
    			});
    			$(".ti2").attr("style", "display:none");
    			$(".ti3").attr("style", "display:none");
    			$(".ti4").attr("style", "display:none");
    		}else if($("select[name=fCate] option:selected").text() == "발효유"){
    			$(".ti1").each(function(){
    				$(this).attr("style", "display:none");
    			});
    			$(".ti2").attr("style", "display:block");
    			$(".ti3").attr("style", "display:none");
    			$(".ti4").attr("style", "display:none");
    		}else if($("select[name=fCate] option:selected").text() == "치즈"){
    			$(".ti1").each(function(){
    				$(this).attr("style", "display:none");
    			});
    			$(".ti2").attr("style", "display:none");
    			$(".ti3").attr("style", "display:block");
    			$(".ti4").attr("style", "display:none");
    		}else if($("select[name=fCate] option:selected").text() == "락토프리"){
    			$(".ti1").each(function(){
    				$(this).attr("style", "display:none");
    			});
    			$(".ti2").attr("style", "display:none");
    			$(".ti3").attr("style", "display:none");
    			$(".ti4").attr("style", "display:block");
    		}else{
    			$(".ti1").each(function(){
    				$(this).attr("style", "display:none");
    			});
    			$(".ti2").attr("style", "display:none");
    			$(".ti3").attr("style", "display:none");
    			$(".ti4").attr("style", "display:none");
    		}
    	}
    </script>
    
</body>
</html>