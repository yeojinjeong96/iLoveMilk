<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.milk.notice.model.vo.Faq" %>
<% 
	Faq f = (Faq)request.getAttribute("f");

%>
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
    #faq-update input[type=text], #faq-update textarea{
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
            <h2 align="left">FAQ 조회</h2>
            <hr>
            <form action="<%=contextPath%>/update.faq" method="post">
                <table id="faq-update" >
                    <tr>                  
                        <th width="120" height="50">* 질문</th>
                        <td width="480"><input type="text" name="question" value="<%=f.getQuestion() %>" required></td>
                    </tr>       
                    <tr >
                        <th height="50">* 카테고리 선택</th>
                        <td>
                            <select name="category"  id="category">
                                <option>회원가입/정보</option>
                                <option>결제/배송</option>
                                <option>적립금</option>
                                <option>제품정보</option>
                                <option>기타</option>
                            </select>
                            &nbsp;<label for="best-faq">BEST FAQ</label>
                            <input type="hidden" name = "no" value="<%=f.getFaqNo()%>">
                            <input type="checkbox" id="best-faq" name="best-faq" value="Y">
                        </td>
                    </tr>
                    <tr>
                        <th>* 답변</th>
                        <td>
                            <textarea name="answer" cols="30" rows="20" style="resize:none" required><%=f.getAnswer() %></textarea>
                        </td>
                    </tr>
                
                </table>
                <br>
                <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">이전으로</button>
                <button type="submit" class="btn btn-sm btn-secondary">수정하기</button>
                <button type="button" onclick="deleteFaq();" class="btn btn-sm btn-danger">삭제하기</button>

                
            </form>
        </div>
    </div>
    <script>
    $(function(){
    	const bestFaq = "<%=f.getBestFaq()%>";
    	
    	if(bestFaq == 'Y'){
    		$("#best-faq").attr("checked",true);
    	}
        
        const category =  "<%=f.getCategoryName()%>";
        $("#category option").each(function(){

            if(category.search($(this).val())!= -1){
                $(this).prop("selected",true);
            }
        })
 
    })
    
    function deleteFaq(){
    		const delNoArr = new Array();
		
			delNoArr.push(<%=f.getFaqNo()%>);
		
			if(confirm('정말 삭제하시겠습니까?'))
    		$.ajax({
    			url:"<%=contextPath%>/delete.faq",
    			data:{delNoArr: delNoArr},
    			type:"post",
    			traditional:true,
    			success:function(result){
    				if(result>0){
    					alert("FAQ 삭제 성공");
                        location.href="<%=contextPath%>/listM.faq?cpage=1";
    				}else{
    					alert("FAQ 삭제 실패");
    				}
    		    				
    			},
    			error:function(){
    				console.log("FAQ삭제용 ajax 통신 실패");
    			}	
    		})
    	}
    </script>

</body>
</html>