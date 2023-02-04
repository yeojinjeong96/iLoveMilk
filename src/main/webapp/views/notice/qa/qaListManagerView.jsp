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
    #q-list td{ text-align: center;}
    .a a{text-decoration: none;
    color:black}
    .outer-1{
        width: 800px;
        float: left;
        box-sizing: border-box;
    }
    #q-list td div{ 
        
        overflow: hidden;
        width: 200px;
        white-space: nowrap ;
        text-overflow: ellipsis;  
    }
    #q-list tbody tr:hover{ cursor: pointer;}
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
        <div style="width:700px" class="text-center">
            <h2 align="left" >미답변 문의</h2>
            <hr>
            <br>
            <div align="right" style="width:640px">
                
                <select name="select-qa" onchange="orderQA();">
                	<option value="">--선택--</option>
                     <option value="asc">오래된순</option>
                    <option value="desc">최신순</option>
                   
                </select>
            </div>
            <br>
            <table border="1" id="q-list">
            	<thead>
                <tr>
                    <th width="50">No.</th>
                    <th width="100">작성자ID</th>
                    <th width="100">작성일</th>
                    <th width="200">문의제목</th>
                    <th width="200">문의내용</th>
                </tr>
                </thead>
                <%if(list.isEmpty()){ %>
                <tr>
                    <td colspan="5">미답변 문의가 없습니다.</td>
                </tr>
                <%}else{ %>
                <%for(QA q:list){ %>
                <tbody>
                <tr>
                    <td height="40"><%=q.getqNo() %></td>
                    <td><%=q.getMemberId() %></td>
                    <td><%=q.getEnrollDate() %></td>
                    <td>
                        <div>
                            <%=q.getqTitle() %>
                        </div>
                       
                    </td>
                      
                    <td>
                        <div>
                            <%=q.getqContent() %>
                        </div>
                    </td>
                </tr>
                </tbody>
                <%} }%>
            </table>
            <br> <br>
            <div class="paging-area" >
             <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/listM.qa?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <%} %>   
            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                <button onclick="location.href='<%=contextPath%>/listM.qa?cpage=<%=p%>';"><%=p %></button>
            <%} %>
            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
                <button onclick="location.href='<%=contextPath%>/listM.qa?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            <%} %>
            </div>
            
            <div align="right" style="width:600px" class="a">
                <a href="<%=contextPath %>/listM.a?cpage=1&date=0">> 답변 목록 조회</a>
                 <br><br>
            </div>
        </div>
        
    </div>
    <script>
		$(function(){
			$("#q-list tbody tr").click(function(){
				location.href='<%=contextPath%>/detailM.qa?no='+$(this).children().eq(0).text();
			})
			
			$("select[name=select-qa]").on("change",function(){
				if($(this).val() != ""){
					location.href='<%=contextPath%>/listM.qa?cpage=1&order='+$(this).val();
				}
			})
						
		})
	</script>
   
</body>
</html>