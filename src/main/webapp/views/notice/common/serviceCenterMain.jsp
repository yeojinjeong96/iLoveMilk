<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.milk.notice.model.vo.Faq, com.milk.common.model.vo.PageInfo, java.util.ArrayList" %>
<% 
	ArrayList<Faq>list= (ArrayList<Faq>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String category= (String)request.getAttribute("category");
	String searchFaq = (String)request.getAttribute("searchFaq");
	
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
    }
    #category a{
        color: black;
        text-decoration: none;
    }
    .search, .qa{
        display: inline-block;
    }
    .search input{ width: 300px; height: 30px;}
    .search button{ height: 30px;}
    .qa{ 
        background-color: rgb(180, 225, 243);
        padding: 20px;
        border-radius: 30px;
       

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
		
     
         <%@include file="/views/notice/common/serviceCenterMainTop.jsp" %>
         
        <div class="outer" align="center" >
          
            <br>
            <div style="width: 700px;">
                <div class="search form-outline">
                    <form action="<%=contextPath%>/search.bfaq" method="get" >  
                            <input type="text" name="searchFaq" placeholder="검색어를 입력하세요." class=" input-sm" required><button type="submit" class="btn btn-primary btn-sm" >검색</button>              
                    		 <input type="hidden" name="cpage" value="1">
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
                    <a href="<%=contextPath%>/enroll.q" class="btn btn-sm btn-secondary" style="border-radius:20px">1:1 문의</a>
                    </p>
                </div>
                <br>
                <h2 align="left">BEST FAQ</h2>
                <br>
                <p align="left" id="category">
                    <a href="<%=contextPath%>/list.sv?cpage=1">전체</a>&nbsp;
                    <a href="<%=contextPath%>/list.sv?cpage=1&category=회원가입/정보">회원가입/정보</a>&nbsp;
                    <a href="<%=contextPath%>/list.sv?cpage=1&category=결제/배송">결제/배송</a>&nbsp;
                    <a href="<%=contextPath%>/list.sv?cpage=1&category=적립금">적립금</a>&nbsp;
                    <a href="<%=contextPath%>/list.sv?cpage=1&category=제품정보">제품정보</a>&nbsp;
                    <a href="<%=contextPath%>/list.sv?cpage=1&category=기타">기타</a>&nbsp;
                </p>
                
                <table  border="1" style="text-align:center" class="content-area table">
                    <tr>
                        <th width="100">No.</th>
                        <th width="100">분류</th>
                        <th width="500">내용</th>
                    </tr>
                    <%if(list.isEmpty()) {%>
                      <!--내용이 없을 경우-->
                    <tr>
                        <td colspan="3">표시할 목록이 없습니다.</td>
                    </tr>
                    <%}else{ %>
                  
                    <%for(Faq f:list){ %>
                    <tr>
                        <td><%=f.getFaqNo() %></td>
                        <td><%=f.getCategoryName() %></td>
                        <td><%=f.getQuestion() %></td>
                    </tr>
                    <%} }%>
    
                </table>
                <br>
                
                
                <div class="paging-area">
                <%if(category !=null) {%>
                
               <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/list.sv?cpage=<%=pi.getCurrentPage()-1%>&category=<%=category%>';"class="btn btn-primary btn-sm">&lt;</button>
	            <%} %>   
	            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                <button onclick="location.href='<%=contextPath%>/list.sv?cpage=<%=p%>&category=<%=category%>';"class="btn btn-primary btn-sm"><%=p %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
	                <button onclick="location.href='<%=contextPath%>/list.sv?cpage=<%=pi.getCurrentPage()+1%>&category=<%=category%>';"class="btn btn-primary btn-sm">&gt;</button>
	            <%if(searchFaq !=null){ %>
	            
	            <div class="paging-area">
                
               <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/search.faq?cpage=<%=pi.getCurrentPage()-1%>&category=<%=category%>';"class="btn btn-primary btn-sm">&lt;</button>
	            <%} %>   
	            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                <button onclick="location.href='<%=contextPath%>/search.faq?cpage=<%=p%>&category=<%=category%>';"class="btn btn-primary btn-sm"><%=p %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
	                <button onclick="location.href='<%=contextPath%>/search.faq?cpage=<%=pi.getCurrentPage()+1%>&category=<%=category%>';"class="btn btn-primary btn-sm">&gt;</button>	         
           		</div>
	             <% }}%>
	            <% }}%>
	            
              
           		</div>
           		<div class="paging-area">
                <%if(category ==null) {%>
                
               <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/list.sv?cpage=<%=pi.getCurrentPage()-1%>';"class="btn btn-primary btn-sm">&lt;</button>
	            <%} %>   
	            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                <button onclick="location.href='<%=contextPath%>/list.sv?cpage=<%=p%>';"class="btn btn-primary btn-sm"><%=p %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
	                <button onclick="location.href='<%=contextPath%>/list.sv?cpage=<%=pi.getCurrentPage()+1%>';"class="btn btn-primary btn-sm">&gt;</button>
	            <%if(searchFaq !=null){ %>
	            
	            <div class="paging-area">
                
               <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/search.faq?cpage=<%=pi.getCurrentPage()-1%>';"class="btn btn-primary btn-sm">&lt;</button>
	            <%} %>   
	            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                <button onclick="location.href='<%=contextPath%>/search.faq?cpage=<%=p%>';"class="btn btn-primary btn-sm"><%=p %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
	                <button onclick="location.href='<%=contextPath%>/search.faq?cpage=<%=pi.getCurrentPage()+1%>';"class="btn btn-primary btn-sm">&gt;</button>	         
           		</div>
	             <% }}%>
	            
	            
	            
	            <% }}%>
	            
              
           		</div>
    
    			
                

            </div>

        </div>
		
        <%@include file="/views/common/footer.jsp" %>
        

</body>
</html>