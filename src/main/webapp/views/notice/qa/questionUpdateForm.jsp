<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "com.milk.notice.model.vo.QA, com.milk.notice.model.vo.Attachment" %>
<% Member m = (Member)session.getAttribute("loginMember");
	QA q= (QA)request.getAttribute("q");
	Attachment at = (Attachment)request.getAttribute("at");
%>
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
    table tr td{padding: 10px}
    .qa-form textarea{
        width: 100%;
        height: 100%;
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
	<%@include file="../common/serviceCenterMainTop.jsp" %>
    <div class="outer" align="center">
        <br>
        <div style="width: 700px;">
            <h2 align="left">1:1문의하기 </h2>
            <hr>
            <br>
            <form action="<%=contextPath%>/update.qa" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="memberNo" value="<%=m.getMemberNo()%>">
            	<input type="hidden" name="qNo" value="<%=q.getqNo()%>">
            	<%if (at!=null){ %>
            	<input type="hidden" name="fileNo" value="<%=at.getFileNo()%>">
            	<%} %>
                <table border="1" class="qa-form">
                    <tr>
                        <th width="150" class="text-center">* 말머리</th>
                        <td width="400">
                            <select onchange="scCateShow();"  name="fCate"  id="fCate" required>
                                <option>- 1차 카테고리 -</option>
                                <option>고객문의</option>
                                <option>고객제안</option>
                                <option>고객불만</option>
                            </select>
                            <select  name="sCate" id="sCate" required>
                                <option class="ti0">- 2차 카테고리 -</option>
                                <option class="ti1"  style="display:none">제품/품질문의</option>
                                <option class="ti1"  style="display:none">홈페이지문의</option>
                                <option class="ti1"  style="display:none">회원탈퇴</option>
                                <option class="ti2"  style="display:none">제품제안</option>
                                <option class="ti2"  style="display:none">서비스제안</option>
                                <option class="ti2"  style="display:none">홈페이지제안</option>
                                <option class="ti3"  style="display:none">제품/품질불만</option>
                                <option class="ti3"  style="display:none">홈페이지불만</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">* 제목</th>
                        <td><input type="text" name="title" style="width: 300px;" maxlength="10" required value="<%=q.getqTitle()%>"></td>
                    </tr>
                    <tr>
                        <th class="text-center">작성자</th>
                        <td><%=m.getMemberName() %></td>
                    </tr>
                    <tr>
                        <th class="text-center">첨부파일</th>
                      
                        <td>
                        <%if(at!=null){ %>
                        <%=at.getChangeName() %>
                    	
                        <%} %>
                        <input type="file" name="upfile">
                        	
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">* 내용</th>
                        <td><textarea name="content"  cols="30" rows="12" style="resize: none;" required><%=q.getqContent() %></textarea></td>
                    </tr>
                    
                </table>
                <br>
                <a href="" class="btn btn-sm btn-secondary">목록으로</a>
                <button type="submit" onclick="return cateNeed();" class="btn btn-sm btn-secondary">수정하기</button>
        
            </form>
            
        </div>
    </div>
    <script>
    	
    	
   		 function cateNeed(){
			if($("#fCate").val() == "- 1차 카테고리 -" || $("#sCate").val() == "- 2차 카테고리 -"){
				alert("카테고리를 입력하세요.");
				return false;
		}
   		 }
    	
    	function scCateShow(){
    		
			$(".ti0").prop("selected", true);
			
    		if($("select[name=fCate] option:selected").text() == "고객문의"){
    			$(".ti1").each(function(){
    				$(this).attr("style", "display:block");
    			});
    			$(".ti2").attr("style", "display:none");
    			$(".ti3").attr("style", "display:none");
    		
    		}else if($("select[name=fCate] option:selected").text() == "고객제안"){
    			$(".ti1").each(function(){
    				$(this).attr("style", "display:none");
    			});
    			$(".ti2").attr("style", "display:block");
    			$(".ti3").attr("style", "display:none");
    		
    		}else if($("select[name=fCate] option:selected").text() == "고객불만"){
    			$(".ti1").each(function(){
    				$(this).attr("style", "display:none");
    			});
    			$(".ti2").attr("style", "display:none");
    			$(".ti3").attr("style", "display:block");
    		
    		}
    		
    	}
    		
    	
    
    </script>
    <%@include file="/views/common/footer.jsp" %>
</body>
</html>
