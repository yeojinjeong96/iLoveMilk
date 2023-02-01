<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.milk.notice.model.vo.Faq, com.milk.common.model.vo.PageInfo, java.util.ArrayList" %>
<% 
	ArrayList<Faq>list= (ArrayList<Faq>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String category = (String)request.getAttribute("category");
	String searchFaq = (String)request.getAttribute("searchFaq");
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
    
    .faq-list{text-align: center;}
    .faq-list tbody tr{
        cursor: pointer;
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
            <h2 align="left">FAQ 관리</h2>
            <hr>
            <br>
        
                <div class="btn-area" align="right">
                    <button type="button" onclick="location.href='<%=contextPath%>/enroll.faq';">FAQ 작성</button>
                    <button type="submit" onclick="deleteFaq();">선택삭제</button>
                </div>
                <br>
                
                <table border="1" class="faq-list">
                    <tr>
                        <th width="30">선택</th>
                        <th width="100">글번호</th>
                        <th width="200">카테고리</th>
                        <th width="350">질문</th>
                    </tr>
                    <%if (list.isEmpty()){ %>
                    <tr>
                 		<td colspan="4">
                 		 등록된 FAQ가 없습니다.
                 		</td>
             
                    </tr>
                    <tbody>
                    <%}else{ %>
                    <%for(Faq f: list){ %>
                    <tr>
                        <td onclick="event.cancelBubble=true"><input type="checkbox" name="delete" value="<%=f.getFaqNo()%>" ></td>
                        <td><%=f.getFaqNo()%></td>
                        <td><%=f.getCategoryName() %></td>
                        <td><%=f.getQuestion() %></td>
                    </tr>
                       <%} }%>
                    </tbody>
                </table>

           
            <br>
            <%if(!list.isEmpty()) {%>
            <%if(searchFaq == null){ %>
            <div class="paging-area" >
                <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/listM.faq?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
	            <%} %>   
	            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                <button onclick="location.href='<%=contextPath%>/listM.faq?cpage=<%=p%>';"><%=p %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
	                <button onclick="location.href='<%=contextPath%>/listM.faq?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            	<%} %>
            </div>
            <%}else{ %>
            <div class="paging-area" >
                <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/searchM.faq?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
	            <%} %>   
	            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                <button onclick="location.href='<%=contextPath%>/searchM.faq?cpage=<%=p%>';"><%=p %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
	                <button onclick="location.href='<%=contextPath%>/searchM.faq?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            	<%} %>
            </div>
            
            <%} }%>
            <br>
            <form action="<%=contextPath %>/searchM.faq?cpage=1" method="get">
            	<%if (searchFaq ==null){ %>
                <input type="text" name="searchFaq">
                <%}else{ %>
                <input tyle="text" name ="searchFaq" value="<%=searchFaq%>">
                <%} %>
                <button type="submit">검색</button>
            </form>
        
        </div>

    </div>
    <script>
    	function deleteFaq(){
    		const delNoArr = new Array();
			$("input[type=checkbox]:checked").each(function(){
				delNoArr.push($(this).val())
			})
    		$.ajax({
    			url:"<%=contextPath%>/delete.faq",
    			data:{delNoArr: delNoArr},
    			type:"post",
    			traditional:true,
    			success:function(result){
    				if(result>0){
    					alert("FAQ 삭제 성공");
                        location.reload();
    				}else{
    					alert("FAQ 삭제 실패");
    				}
    		    				
    			},
    			error:function(){
    				console.log("FAQ삭제용 ajax 통신 실패");
    			}	
    		})
    	}
    	
    	$(".faq-list tbody tr").click(function(){
            location.href="<%=contextPath%>/updateForm.faq?no="+$(this).children().eq(1).text();        })
    	
    	
    </script>

</body>
</html>