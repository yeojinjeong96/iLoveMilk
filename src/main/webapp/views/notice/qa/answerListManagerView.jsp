<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.util.ArrayList, com.milk.notice.model.vo.QA, com.milk.common.model.vo.PageInfo" %>
<% 
	ArrayList<QA>list =(ArrayList<QA>) request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .select-area a{
        color:black;
        text-decoration: none;
    }

    .a a{
        color: black;
        text-decoration: none;
    }
    .outer-1{
        width: 800px;
        float: left;
        box-sizing: border-box;
    }
    #answer-list tr div{

        overflow: hidden;
        width:170px;
   		 white-space: nowrap ;
        text-overflow: ellipsis;  
        padding: 10px;
       align-content: center;
    }
    #answer-list tbody tr{
        cursor: pointer;
    }
    .select-area button{
        border: 0;
        outline: 0;
        background-color: transparent;
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
        <div style="width:700px">
            <h2 align="left">답변 목록 조회 </h2>
            <hr>
            <br>
            
            <form action="<%=contextPath%>/listM.a?cpage=1" method="get">
                <div class="select-area" align="left" >        
                    조회기간&nbsp;
                    <button type="button" value="0">오늘</button>&nbsp;
                    <button type="button" value="7">7일</button>&nbsp;
                    <button type="button" value="15">15일</button>&nbsp;
                    <button type="button" value="30">1개월</button>&nbsp;
                    <button type="button" value="90">3개월</button>&nbsp;
                    <input type="date"> -
                    <input type="date">  
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-secondary">조회</button>
                </div>

            </form>
            <br>
            <div class="search-area" align="left">
                <form action="" method="get">
                    <select name="search" id="search">
                        <option value="">회원아이디로검색</option>
                        <option value="">문의내용으로검색</option>
                    </select>
                    <input type="text" name="search">
                    <button type="submit" class="btn btn-secondary btn-sm">검색</button>
                </form>
            </div>
            <br>
            <table border="1" class="text-center" id="answer-list">  
           <thead>
                <tr>
                    <th width="100">완료일</th>
                    <th width="150">카테고리</th>
                    <th width="170">문의내용</th>
                    <th width="100">작성자</th>
                    <th width="170">답변내용</th>
                </tr>
            
            </thead>
                <%if(list.isEmpty()){ %>
                <!--데이터 없을시-->
                <tr>
                    <td colspan="5">답변 목록이 없습니다.</td>
                </tr>
                <!--데이터 있을시-->
                <%}else{ %>
                 <%for (QA q :list){ %>
            <tbody>
                <tr>
                    <td style="display:none;"><%=q.getqNo()%></td>
                    <td style="height: 25px; "><%=q.getAnswerDate() %></td>
                    <td>[<%=q.getfCategory() %>/<%=q.getsCategory() %>]</td>
                    <td>
                        <div>
                            <%=q.getqContent() %>
                        </div>
                       
                    </td>
                    <td><%=q.getManagerName() %></td>
                    <td>
                        <div>
                            <%=q.getaContent() %>
                        </div>
                    </td>
                </tr>
            </tbody>
                <%}} %>
            </table>
            <br>
            <div class="paging-area" >
            <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/listM.a?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <%} %>   
            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                <button onclick="location.href='<%=contextPath%>/listM.a?cpage=<%=p%>';"><%=p %></button>
            <%} %>
            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
                <button onclick="location.href='<%=contextPath%>/listM.a?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            <%} %>
            </div>
    
            <div align="right" style="width:650px" class="a">
                <a href="<%=contextPath%>/listM.qa?cpage=1">&lt; 미답변 목록 조회</a>
                 <br><br>
            </div>
    
        </div>
       
    </div>
    <script>
    $(function(){
    	
    	$("#answer-list tbody tr").click(function(){
			location.href='<%=contextPath%>/detailM.a?no='+$(this).children().eq(0).text();
		})
    	
    	$(".select-area button").click(function(){
    		location.href='<%=contextPath%>/listM.a?cpage=1&date='+$(this).val();
    	})
    })
    
    </script>

</body>
</html>