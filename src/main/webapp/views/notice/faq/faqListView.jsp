<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.milk.notice.model.vo.Faq, com.milk.common.model.vo.PageInfo, java.util.ArrayList" %>
<% 
	ArrayList<Faq>list= (ArrayList<Faq>)request.getAttribute("list");
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
    .list-area a{ 
        color: black;
        text-decoration: none;
        }
    .search, .qa{
        display: inline-block;
    }
    .search input{ width: 300px; height: 30px;}
    .search button{ height: 30px;}
    .qa{ 
        background-color: rgb(156, 208, 229);
        padding: 10px;

    }
    .faq-list table{ text-align: center;}
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
        <div style="width:700;">
            <div class="search">
                <form action="" method="get" >  
                        <input type="text" name="search" placeholder="검색어를 입력하세요."><button type="submit" >검색</button>              
                </form>     
            </div>
            &nbsp;
            <div class="qa" >
                <p>
                <strong>
                찾으시는 질문이 없으시면 <br>
                1:1문의를 해주세요.
                </strong>
                <br>
                <br>
                <a href="<%=contextPath%>/enroll.q" class="btn btn-sm btn-secondary">1:1 문의</a>
                </p>
            </div>
            <br>
           
            <div align="left" class="list-area" style="width:700px" >
                <h2 align="left">FAQ</h2>
                <br>
                <a href="<%=contextPath%>/list.faq?cpage=1">전체</a> |
                <a href="<%=contextPath%>/list.faq?cpage=1&category=회원가입/정보">회원가입/정보</a> |
                <a href="<%=contextPath%>/list.faq?cpage=1&category=결제/배송">결제/배송</a> |
                <a href="<%=contextPath%>/list.faq?cpage=1&category=적립금">적립금</a> |
                <a href="<%=contextPath%>/list.faq?cpage=1&category=제품정보">제품정보</a> |
                <a href="<%=contextPath%>/list.faq?cpage=1&category=기타">기타</a>
            </div>
            <br>
            <div class="faq-list">
                <table border="1" >
                    <tr>
                        <th width="150">번호</th>
                        <th width="150">분류</th>
                        <th width="400">내용</th>
                    </tr>
                    <%if (list.isEmpty()){ %>
                    <tr>
                 		<td colspan="3">
                 		 등록된 FAQ가 없습니다.
                 		</td>
             
                    </tr>
                    <%}else{ %>
                    <%for(Faq f: list){ %>
                    <tr>
                        <td><%=f.getFaqNo() %></td>
                        <td><%=f.getCategoryName() %></td>
                        <td><%=f.getQuestion() %></td>
                    </tr>
                    <%} }%>
                </table>
            </div>
            <br>
            <div class="paging-area">
                
               <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/list.faq?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
	            <%} %>   
	            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                <button onclick="location.href='<%=contextPath%>/list.faq?cpage=<%=p%>';"><%=p %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
	                <button onclick="location.href='<%=contextPath%>/list.faq?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
	            <%} %>
              
            </div>
         
        </div>

    </div>
    <%@include file="/views/common/footer.jsp" %>
</body>
</html>