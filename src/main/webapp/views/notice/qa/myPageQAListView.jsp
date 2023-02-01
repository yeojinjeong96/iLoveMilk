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
	
		height: 1000px;
		box-sizing: border-box; 
		margin:auto;
	}
	.mainmenubar{
		width: 23%;
		 
		 float: left;
		 height: 100%;
		 
	}
	
	.mainmember{
		float: left;
		width: 77%;
		
		height: 20%;
	}

	.maincontent{
		width: 77%;
		height: 300px;
		
		float: left;
	}
	#qa-list tbody tr:hover{cursor: pointer;}
    #qa-list tr{  
        overflow: hidden;
        width: 100px;
   		 white-space: nowrap ;
        text-overflow: ellipsis;   }
     .select-area a{
        color:black;
        text-decoration: none;
    }
    .paging-area{
     margin-top: ;
    }
 </style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div class="outer">

		<div class="mainmenubar" >
			<%@ include file="/views/common/myPageMenubar.jsp" %> 	
		</div>
				
		<div class="mainmember">
			<%@ include file="/views/member/memberInformation.jsp" %>
		</div>

		<div class="maincontent">
			<h4 align="left">나의 1:1 문의 </h4>
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
            <table align="center" border="1" id="qa-list" class="text-center table">
                <tr>
                    <th width="100" height="30">문의날짜</th>
                    <th width="190">카테고리</th>
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
           
            <br>
            <div class="paging-area" align="center">
                <%if(pi.getCurrentPage()!=1){ %>
                    <button class="btn-sm btn btn-primary" onclick="location.href='<%=contextPath%>/mypage.qa?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                <%} %>   
                <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                    <button class="btn-sm btn btn-primary" onclick="location.href='<%=contextPath%>/mypage.qa?cpage=<%=p%>';"><%=p %></button>
                <%} %>
                <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
                    <button class="btn-sm btn btn-primary" onclick="location.href='<%=contextPath%>/mypage.qa?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                <%} %>
            </div>
        </div>
        
	
	</div>
	
	
	<%@ include file="/views/common/footer.jsp" %> 	 
    
	 <script>
		$(function(){
			$("#qa-list tbody tr").click(function(){
				location.href='<%=contextPath%>/mypage.dq?no='+$(this).children().eq(0).text();
			})
		})
	</script>
</body>
</html>