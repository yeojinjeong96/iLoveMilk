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
        background-color: rgb(180, 225, 243);
        padding: 20px;
        border-radius: 30px;

    }
    .faq-list table{ text-align: center;}
    .answer-area{
            border: 1px solid lightgrey;
            width: 500px;
            height: 140px;
            margin-top: 5px;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 10px;
            display: none;
        }
    .question-area{
        cursor: pointer;
     
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
        <div style="width:700;">
            <div class="search">
                <form action="<%=contextPath %>/search.faq" method="get" >  
                		<%if(searchFaq !=null){ %>
                		 <input type="text" name="searchFaq" placeholder="검색어를 입력하세요." class=" input-sm" required value="<%=searchFaq%>"><button type="submit" class="btn btn-primary btn-sm">검색</button> 
                		<%}else{ %>
                         <input type="text" name="searchFaq" placeholder="검색어를 입력하세요." class=" input-sm" required><button type="submit" class="btn btn-primary btn-sm">검색</button>   
                        <%} %>           
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
            <div class="faq-list" style="width:700px">
                <table  class="table">
                    <tr class="thead-light">
                        <th width="70">No.</th>
                        <th width="120">분류</th>
                        <th width="450">내용</th>
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
                        <td class="question-area">
                       		<div >
                       			 <%=f.getQuestion() %>
                
                       		</div>
                            <p class="answer-area">
                                <%=f.getAnswer() %>
                            </p>
                        </td>
                     
                    </tr>
                    <%} }%>
                </table>
            </div>
            <br>
            <%if(searchFaq!=null){ %>
            <div class="paging-area" >
                <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/search.faq?cpage=<%=pi.getCurrentPage()-1%>';" class="btn btn-primary btn-sm">&lt;</button>
	            <%} %>   
	            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                <button onclick="location.href='<%=contextPath%>/search.faq?cpage=<%=p%>';" class="btn btn-primary btn-sm"><%=p %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
	                <button onclick="location.href='<%=contextPath%>/search.faq?cpage=<%=pi.getCurrentPage()+1%>';" class="btn btn-primary btn-sm">&gt;</button>
            	<%} %>
           	</div>
         	 <%}else{ %>
            
            
            <%if(category!=null){ %>
            <div class="paging-area">
                
               <%if(pi.getCurrentPage()!=1){ %>
                <button onclick="location.href='<%=contextPath%>/list.faq?cpage=<%=pi.getCurrentPage()-1%>&category=<%=category%>';" class="btn btn-primary btn-sm">&lt;</button>
	            <%} %>   
	            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                <button onclick="location.href='<%=contextPath%>/list.faq?cpage=<%=p%>&category=<%=category%>';"class="btn btn-primary btn-sm"><%=p %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
	                <button onclick="location.href='<%=contextPath%>/list.faq?cpage=<%=pi.getCurrentPage()+1%>&category=<%=category%>';"class="btn btn-primary btn-sm">&gt;</button>
            	<%} %>
            </div>
         	 	<%} %>
	         	 <%if(category==null){ %>
	            <div class="paging-area">
	                  
	               <%if(pi.getCurrentPage()!=1){ %>
	                <button onclick="location.href='<%=contextPath%>/list.faq?cpage=<%=pi.getCurrentPage()-1%>';" class="btn btn-primary btn-sm">&lt;</button>
		            <%} %>   
		            <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
		                <button onclick="location.href='<%=contextPath%>/list.faq?cpage=<%=p%>';" class="btn btn-primary btn-sm"><%=p %></button>
		            <%} %>
		            <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
		                <button onclick="location.href='<%=contextPath%>/list.faq?cpage=<%=pi.getCurrentPage()+1%>';" class="btn btn-primary btn-sm">&gt;</button>
	             	<% }%>
	            </div>
	  
	         	 <% }}%>
	         	
	         	 
	       
        </div>

    </div>
    <script>
     $(function(){

            $(".question-area").on("click","div",function(){

                const $p= $(this).next();
                if($p.css("display") == "none"){
                    
                   
                    $(".answer-area").slideUp();
                    $p.slideDown();
                }else{
                    $p.slideUp();   
                }

            })
        }) 

    
    </script>
    <%@include file="/views/common/footer.jsp" %>
</body>
</html>