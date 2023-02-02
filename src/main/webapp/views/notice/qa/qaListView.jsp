<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.util.ArrayList, com.milk.notice.model.vo.QA, com.milk.common.model.vo.PageInfo" %>
<% ArrayList<QA>list =(ArrayList<QA>) request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
    table tr{
        text-align: center;
    }
    .select-area a{
        color:black;
        text-decoration: none;
    }
    #qa-list tbody tr:hover{cursor: pointer;}
    #qa-list tr{  
        overflow: hidden;
        width: 100px;
   		 white-space: nowrap ;
        text-overflow: ellipsis;   }
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
        <div style="width:700px">
            <h2 align="left">1:1문의하기 </h2>
            <hr>
            <br>
            <div class="select-area" align="left">  
            	      
                  <form action="">
                    조회기간&nbsp;
                    <a href="">오늘</a>&nbsp;
                    <a href="">7일</a>&nbsp;
                    <a href="">15일</a>&nbsp;
                    <a href="">1개월</a>&nbsp;
                    <a href="">3개월</a>&nbsp;
                    <input type="date"> -
                    <input type="date"> &nbsp;      
					<button type="submit">조회</button>
                  </form>
            </div>
            <br>
            <table align="center" border="1" id="qa-list">
                <tr>
                    <th width="100" height="30">문의날짜</th>
                    <th width="150">카테고리</th>
                    <th width="350" >제목</th>
                    <th width="100">문의상태</th>
                </tr>
				<%if(list.isEmpty()){ %>
                <!--게시글 없을경우-->
                
                <tr>
                    <td colspan="4">
                        작성된 문의사항이 없습니다.
                    </td>
                </tr>
                <%}else{ %>
                <%for(QA q:list){ %>
                <tbody>
                <tr>  
                	<td style="display:none"><%=q.getqNo() %></td>              	
                    <td height="40"><%=q.getEnrollDate() %></td>
                    <td>[<%=q.getfCategory() %>/<%=q.getsCategory() %>]</td>
                    <td><%=q.getqTitle() %></td>
                    <td>
                		  <%if(q.getAnswerStatus().equals("Y")){ %>
	                   	답변완료
	                   	<%}else{ %>
	                   	접수
	                   	<%} %>
                    </td>
                </tr>
                </tbody>
				<%}} %>
				
            </table>
        </div>
        <br>
        <div class="paging-area" >
            <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/list.qa?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <%} %>   
            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                <button onclick="location.href='<%=contextPath%>/list.qa?cpage=<%=p%>';"><%=p %></button>
            <%} %>
            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
                <button onclick="location.href='<%=contextPath%>/list.qa?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            <%} %>
          </div>
    </div>
    <script>
		$(function(){
			$("#qa-list tbody tr").click(function(){
				location.href='<%=contextPath%>/detail.qa?no='+$(this).children().eq(0).text();
			})
		})
	</script>
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>