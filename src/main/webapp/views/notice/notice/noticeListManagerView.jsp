<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.milk.notice.model.vo.Notice, java.util.ArrayList , com.milk.common.model.vo.PageInfo" %>
<% 
	ArrayList<Notice>list= (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String searchNo= (String)request.getAttribute("searchNo");

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
    
    tbody>tr:hover{cursor: pointer;}
    
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

    <div class="wrap1" align="center">
        <div class="wrap2">
            <div class="outer-1" align="center" >
                <br>
                <div style="width:700px">
                    <h2 align="left">공지사항 관리</h2>
                    <hr>
                    <br>
                    <form action="" method="post">
                        <div class="btn-area" align="right">
                            <a href="<%=contextPath%>/enroll.no">공지작성</a>
                            <button type="button" id="dlt-btn">선택삭제</button>
                        </div>
                        <br>
                        <table id="notice-list" border="1" class="text-center" >
                            <thead>
                                <tr>
                                    <th>선택</th>
                                    <th width="70">글번호</th>
                                    <th width="300">제목</th>
                                    <th width="100">작성자</th>
                                    <th width="100">작성일</th>
                                </tr>
                            </thead>
                        
                            <tbody >
                                <!--공지사항이 없을 경우-->
                            <%if(list.isEmpty()){ %>
                                <tr>
                                    <td colspan="5">
                                        공지사항이 없습니다.
                                    </td>
                                </tr>
                            <%}else{ %>
                                <!--공지사항이 있을 경우-->
                                <%for(Notice n : list){%>
                                    <tr>
                                        <td><input type="checkbox" name="delete" ></td>
                                        <td><%=n.getNoticeNo() %></td>
                                        <td><%=n.getNoticeTitle() %></td>
                                        <td><%=n.getManagerName() %></td>
                                        <td><%=n.getEnrollDate()%></td>
                                    </tr>
                                <%}} %>
                            
                    
                            </tbody>
            
            
                        </table>
                    </form>
                    <br>
                  	<%if(searchNo == null){ %>
                    <div class="paging-area" >
                    <%if(pi.getCurrentPage()!=1){ %>
                        <button onclick="location.href='<%=contextPath%>/listM.no?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                    <%} %>   
                    <%for(int p= pi.getStartPage(); p<pi.getEndPage(); p++){ %>
                        <button onclick="location.href='<%=contextPath%>/listM.no?cpage=<%=p%>';"><%=p %></button>
                    <%} %>
                    <%if(pi.getCurrentPage()!=pi.getEndPage()){ %>
                        <button onclick="location.href='<%=contextPath%>/listM.no?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                    <%} %>
                    </div>
                    <br>
                    <%}else{ %>
                    <div class="paging-area" >
                    <%if(pi.getCurrentPage()!=1){ %>
                        <button onclick="location.href='<%=contextPath%>/search.no?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                    <%} %>   
                    <%for(int p= pi.getStartPage(); p<pi.getEndPage(); p++){ %>
                        <button onclick="location.href='<%=contextPath%>/search.no?cpage=<%=p%>';"><%=p %></button>
                    <%} %>
                    <%if(pi.getCurrentPage()!=pi.getEndPage()){ %>
                        <button onclick="location.href='<%=contextPath%>/search.no?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                    <%} %>
                    </div>
              		<%} %>
                    <br>
                  
                    
                    
                    <form action="<%=contextPath%>/search.no?cpage=1" method="post">
                       	
                  
       					  <%if(searchNo != null){ %>
       					  <input type="text" name="searchNo" value="<%=searchNo%>">
       					  <%}else{%>
       					   <input type="text" name="searchNo">
       					   <%} %>
       					   
                        <button type="submit">검색</button>
                    </form>
                </div>
                
            

            </div>
        </div>
    </div>
    
            
    <script>
    	$(function(){
    		$("#notice-list tbody tr").click(function(){
                location.href="<%=contextPath%>/updateForm.no?no="+$(this).children().eq(1).text();
            })
    	})
    </script>
    

</body>
</html>